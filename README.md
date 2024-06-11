# Provo - Taming the Chaos of Automation Scripts

Provo is a modular framework designed to streamline the automation of your workflows, especially when it comes to setting up and provisioning environments. Think of it as a powerful manager for all your automation scripts.

Provo's strength lies in its modularity. It helps you organize your collection of automation scripts into a system of reusable modules. Want to quickly set up a new VM? Configure your editor just the way you like it? Deploy your dotfiles? Provo makes it a breeze. Simply clone your Provo setup to any machine and, with a single command, run the workflow you need.

## Use Cases

- **Working with Remote Hosts:** Connect to different VMs to investigate logs, perform active debugging, or leave a script running overnight. Run your setup and work within the comfort of your custom environment, even if they were bare systems with outdated shells, basic prompts, and missing needed packages.

- **Configuring a New Developer Laptop:**  Migrate years of fine-tuning your development environment to a new laptop without hassle. Don't worry if your old laptop is gone, the image is incompatible, or cloud restore is hanging – with a modular system, it's easy to keep setup scripts up-to-date and get running in no time.

- **Synchronizing Multiple Environments:**  Maintain a consistent look and feel across your macOS laptop, Debian VMs, and Windows desktop with WSL2 and Ubuntu.

- **Moving Your Website to a New Host:** Seamlessly transition your website from Amazon AWS to Google Cloud (or any other host) by recreating all your setups, including MySQL, Apache, WordPress, etc.

- **Provisioning a New VM:** With scripted CLI tools quickly provision a new development VM to replace a misbehaving one or add more boxes to distribute the load.

With Provo and your custom modules, you can configure your shell, prompt, and editor, unroll your development setup, launch a VM, or migrate a host within seconds, boosting your productivity.

## Features

- **Modular Design:** Promotes organizing your automation scripts into reusable, self-contained modules.
- **Dependency Management:** Verifies that declared requirements are met before running any module actions.
- **Error Handling:** Propagates error codes from individual modules to the framework, allowing for easy identification and debugging.
- **Safe Execution:** Stops execution if any error or missing dependency is detected, ensuring the correct order of module execution.

## Installation

While you can clone Provo directly:

```shell
git clone https://github.com/bryndin/provo
```

It's typically recommended to fork the repository to customize it with your own modules:

1. **Fork** the [Provo repository](https://github.com/bryndin/provo) on GitHub.
2. **Clone** your forked repository:

   ```shell
   git clone https://github.com/<your-username>/provo.git
   ```

3. **Create and add your modules** to the `modules` directory.

    See [Modules Docs](https://github.com/bryndin/provo/blob/master/modules/README.md).

This approach allows you to easily manage your custom modules and keep them separate from the original Provo repository.

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
