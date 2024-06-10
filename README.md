# Provo - Your Personal Lightweight Provisioner

Provo is a modular framework designed to streamline the setup and provisioning of environments. Whether you need to provision a new VM, install a specific shell, configure an editor, deploy your dotfiles, or set up any other software, Provo provides an easy-to-use, modular approach to manage these tasks.

Provo's goal is to help you organize your collection of automation scripts into a system of reusable modules. You can clone this system anywhere and, with a single command, make any machine feel like home and be 100% productive within seconds.

## Use Cases

- **Working with Remote Hosts:** Connect to different VMs to investigate logs, perform active debugging, or leave a script running overnight. Run your setup and work comfortably, even if they were bare systems with outdated shells, basic prompts, and missing needed packages.

- **Configuring a New Developer Laptop:**  Migrate years of fine-tuning your development environment to a new laptop without hassle. Don't worry if your old laptop is gone, the image is incompatible, or cloud restore is hanging – with a modular system, it's easy to keep setup scripts up-to-date and get running in no time.

- **Synchronizing Multiple Environments:**  Maintain a consistent look and feel across your macOS laptop, Debian VMs, and Windows desktop with WSL2 and Ubuntu.

- **Moving Your Website to a New Host:** Seamlessly transition your website from Amazon AWS to Google Cloud (or any other host) and recreate all your setups, including MySQL, Apache, WordPress, etc.

- **Provisioning a New VM:** With scripted CLI tools quickly provision a new development VM to replace a misbehaving one or add more boxes to distribute the load.

With Provo, you can configure your shell, prompt, editor, unroll your development setup, launch a VM, or migrate a host within seconds, boosting your productivity.

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

Provo provides a framework to execute modules, which are essentially a way to organize your scripts. Use the [`sample`](https://github.com/bryndin/provo/tree/master/modules/sample) module as an example.

### Module Structure

A *module* is a subdirectory of the `modules` directory. The files `install.sh`, `update.sh`, and `remove.sh` correspond to the `install`, `update`, and `remove` actions, respectively. They contain the logic of your module. These files are optional; only define the actions you need. You can add any other files your logic requires (e.g., `.vimrc`).

> [!NOTE]
> Module scripts are executed local to the module, not the `provo` directory (e.g., `cp .vimrc ~` will work as expected).

### Action Script Structure

> [!IMPORTANT]
>
> 1. Action script names **must** be one of `install.sh`, `update.sh`, or `remove.sh`.
> 2. They **must** have the `if [[ "$RUN_MODULE" == true ]]; then <your logic> fi` structure. All logic executed upon sourcing your action file **must** go within these guards.
> 3. It's strongly recommended to include a `REQUIREMENTS=()` list, even if it's empty.

Refer to the [`simple:install.sh`](https://github.com/bryndin/provo/blob/master/modules/sample/install.sh) script for an example.

`provo` sources action files to pull and check the `REQUIREMENTS` list before executing the action. The `[[ "$RUN_MODULE" == true ]]` guards prevent your script logic from being executed twice.

### Creating a Module

0. **(Prerequisite) Fork `provo`.**

1. **Create a new directory for your module:**

    ```bash
    mkdir modules/<module-name>
    ```

2. **Add your module scripts and configuration files inside this directory.**

3. **(Optional) Update the `provo` script if you want to hardcode your new module.**

4. **Commit and push your changes:**

    ```bash
    git add modules/<module-name>
    git commit -m "Add <module-name> module"
    git push origin <branch-name>
    ```
