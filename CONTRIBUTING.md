Please refer to the [Gardener contributor guide](https://gardener.cloud/docs/contribute).

## Chocolatey package maintenance

This repository contains the Chocolatey packages for selected Gardener-related CLI tools.

### How package updates work

The packages in this repository are primarily updated automatically via the GitHub workflow
[`remote-dispatch.yaml`](./.github/workflows/remote-dispatch.yaml).

For the currently automated components:

- `diki`
- `gardenlogin`
- `gardenctl-v2`

the update flow is:

1. A release happens in the source repository.
2. The source repository triggers this repository via `repository_dispatch`.
3. The workflow runs the matching update script in `.github/workflows/update-<component>.ps1`.
4. The workflow builds the updated Chocolatey package.
5. The workflow opens a pull request with the updated package sources and generated `.nupkg`.

### Maintaining automated packages

When adding another automatically maintained package, update all of the following:

1. **Package files**
   - Add the new `<component>/` package directory to the repository.
   - Add the corresponding `<component>.nuspec` and `tools/` scripts.
2. **Update script**
   - Add `.github/workflows/update-<component>.ps1`.
   - Follow the existing scripts for updating the package metadata, download URL, and checksum.
3. **Central update workflow**
   - Update `.github/workflows/remote-dispatch.yaml`:
     - add the component to the `workflow_dispatch.inputs.component.options` list
     - add a case for the component in the `Resolve paths / flags` step
     - define the matching script path, nuspec path, package directory, package name, and extra files
4. **Source repository release automation**
   - Update the GitHub Actions workflow in the source repository so that, after a release is built,
     it triggers this repository with the required payload:
     - `component`
     - `tag`
     - `windows_sha`

Without the source repository workflow update, new releases will not automatically update the
Chocolatey package in this repository.

### Manual retrigger of a package update

If the automatic trigger did not run, failed for any reason, or you need to recreate a package
update pull request, you can manually trigger the workflow:

1. Open the GitHub Actions page for this repository.
2. Select the **Update Chocolatey Package** workflow.
3. Click **Run workflow**.
4. Choose the `component` you want to update.
5. Enter the release `tag`.
6. Provide the `windows_sha` value.
7. Optionally set `push_to_chocolatey` if you explicitly want the workflow run to push the package.
8. Run the workflow. It will generate the package update and open a pull request.

### How to obtain the required hash

The required SHA256 digest can be taken from the build workflow in the source repository for the
corresponding release.

Look for the workflow run where the release artifact for the component was built and published.
Use the Windows artifact digest from that workflow as input for the manual workflow run in this
repository.

When enabling automation for an additional source repository, make sure that repository's release
workflow passes the correct `component`, `tag`, and `windows_sha` values when triggering this repo.