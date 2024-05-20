import { writeFile } from "fs/promises";

(async () => {
  const channelReleasesURL =
    "https://raw.githubusercontent.com/dotnet/core/master/release-notes/releases-index.json";

  const res = await fetch(channelReleasesURL);
  const data = await res.json();
  const channelReleases = data["releases-index"];

  const versions = [];
  await channelReleases.reduce(async (previous, channelRelease) => {
    await previous;

    const releasesURL = channelRelease["releases.json"];
    const res = await fetch(releasesURL);
    const data = await res.json();
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
      .flatMap((v) => v)
      .reverse()
      .join("\n") + "\n";
  await writeFile("versions.txt", content, {
    flag: "w+",
  });
})();
