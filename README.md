# Provo - Your Personal Lightweight Provisioner

Provo is a modular framework designed to streamline the setup and provisioning of environments. Whether you need to provision a new VM, install a specific shell, configure an editor, deploy your dotfiles, or set up any other software, Provo provides an easy-to-use, modular approach to manage these tasks.

Provo's goal is to help you organize your collection of automation scripts into a system of reusable modules. You can clone this system anywhere and, with a single command, make any machine feel like home and be 100% productive within seconds.

## Use Cases

- **Working with Remote Hosts:** Connect to different VMs to investigate logs, perform active debugging, or leave a script running overnight. Run your setup and work comfortably, even if they were bare systems with outdated shells, basic prompts, and missing needed packages.

- **Configuring a New Developer Laptop:**  Migrate years of fine-tuning your development environment to a new laptop without hassle. Don't worry if your old laptop is gone, the image is incompatible, or cloud restore is hanging – with a modular system, it's easy to keep setup scripts up-to-date and get running in no time.

- **Synchronizing Multiple Environments:**  Maintain a consistent look and feel across your macOS laptop, Debian VMs, and Windows desktop with WSL2 and Ubuntu.

- **Moving Your Website to a New Host:** Seamlessly transition your website from Amazon AWS to Google Cloud (or any other host) and recreate all your setups, including MySQL, Apache, WordPress, etc.

- **Provisioning a New VM:** With scripted CLI tools quickly provision a new development VM to replace a misbehaving one or add more boxes to distribute the load.

With Provo, you can configure your shell, prompt, and editor, unroll your development setup, launch a VM, or migrate a host within seconds, boosting your productivity.

## Installation

```shell
git clone https://github.com/bryndin/provo
```

## Usage

1. **Specify an action and modules:**

   Provide an action (`install`, `update`, or `remove`) to run on a list of modules:

    ```shell
    ./provo [install|update|remove] [module1 module2 ...]
    ```

2. **Hardcode common modules (optional):**

   If you have a predominantly common setup, hardcode it in the `MODULES` list inside the `provo` script and omit passing modules:

    ```shell
    ./provo [install|update|remove]
    ```

## Modules

*Modules* are the core concept in Provo, representing units of provisioning logic. Convert your automation scripts into Provo's *modules* to leverage the framework's capabilities for organizing, managing, and running these scripts in a standardized manner.

[Modules Docs](https://github.com/bryndin/provo/blob/master/modules/README.md) cover the Modules and Action Scripts structure, and explain how to create modules.
