import { writeFile } from "fs/promises";
import parse from "semver/functions/parse.js";
import compare from "semver/functions/compare.js";

(async () => {
  const channelReleasesURL =
    "https://raw.githubusercontent.com/dotnet/core/master/release-notes/releases-index.json";

  console.info("fetching channel releases");
  const res = await fetch(channelReleasesURL);
  const data = await res.json();
  const channelReleases = data["releases-index"];

  const versions = [];
  await channelReleases.reduce(async (previous, channelRelease) => {
    await previous;

    const releasesURL = channelRelease["releases.json"];
    const res = await fetch(releasesURL);
    const data = await res.json();
    console.info(
      `extracting versions from channel-version=${data["channel-version"]}`,
    );

    const releasesSdks = data["releases"].flatMap((r) => {
      if ("sdks" in r && r["sdks"] != null) {
        return r.sdks;
      }

      // for older versions (e.g. <3.1) sometimes there is not sdks object
      return { version: r.sdk.version };
    });

    const sdkVersions = releasesSdks.flatMap((sdk) => sdk.version);
    versions.push(...sdkVersions);
  }, Promise.resolve());

  const content =
    versions
      .filter((version, index) => index == versions.indexOf(version))
      .flatMap(parse)
      .sort(compare)
      .join("\n") + "\n";

  console.info(`writing versions.txt file`);
  await writeFile("../versions.txt", content, {
    flag: "w+",
  });
  console.info(`done`);
})();
