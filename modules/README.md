# Modules

A *module* is a subdirectory of the `modules` directory.

## Module Structure

 The files `install.sh`, `update.sh`, and `remove.sh` correspond to the `install`, `update`, and `remove` actions, respectively. They contain the logic of your module. These files are optional; only define the actions you need. You can add any other files your logic requires (e.g., `.vimrc`).

> [!NOTE]
> Module scripts are executed local to the module, not the `provo` directory (e.g., `cp .vimrc ~` works).

## Error Handling

Provo executes each module in a separate subshell. Any error code returned or exited by a module is propagated to the framework and ultimately returned by `provo`.

Provo framework uses the following error codes:

```shell
# Error codes
readonly ERR_NOT_FOUND=2           # ENOENT: No such file or directory
readonly ERR_INVALID_ARGUMENT=22   # EINVAL: Invalid argument
readonly ERR_MISSING_DEPENDENCY=65 # ENOPKG: Package not installed 
```

## Action Script Structure

> [!IMPORTANT]
>
> 1. Action script names **must** be one of `install.sh`, `update.sh`, or `remove.sh`.
> 2. They **must** have the `if [[ "$RUN_MODULE" == true ]]; then <your logic> fi` structure. All logic executed upon sourcing your action file **must** go within these guards.
> 3. It's strongly recommended to include a `REQUIREMENTS=()` list, even if it's empty.

Refer to the [`simple:install.sh`](https://github.com/bryndin/provo/blob/master/modules/sample/install.sh) script for an example.

`provo` sources action files to pull and check the `REQUIREMENTS` list before executing the action. The `[[ "$RUN_MODULE" == true ]]` guards prevent your script logic from being executed twice.

## Creating a Module

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
