# DncInstallScripts

Install scripts for .NET Core.

## InstallDnc31.sh

The first script that has been added is InstallDnc31.sh . It installs .NET Core 3.1 on Ubuntu (including 20.04).
You can easily modify it to install it on a different Ubuntu version by making a small modification.

The problem it solves is that the [officially provided install instructions](https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-ubuntu-1804#install-the-net-core-sdk) have an issue as quoted here.

> If you receive an error message similar to Unable to locate package dotnet-sdk-3.1, see the Troubleshoot the package manager section.

This script does not have that problem since it does not use `install dotnet-sdk-3.1` . It downloads the sdk as a `tar.gz` file and sets the variables correctly afterwards. A restart may be needed after running the script. To use this script, run it in admin mode.

To test the script in a docker environment, type:

````bash
docker build --build-arg version="20.04" -t dnc .
````

The version can be replaced by any other supported Ubuntu version.

The installed sdk version will be shown after this message:

> These sdks are installed now