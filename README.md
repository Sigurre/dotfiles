# Configure a system with DotBot

This repo is used to sync custom dotfiles accross systems, or to setup a new system. It uses [Dotbot](https://github.com/anishathalye/dotbot) to install all the required packages using Brew, and create links from the dotfiles in this repo to their permanent locations.

This has only been developed and tested on macOS using Brew and NeoVim! It currently only works with Zsh.

## What it Configures

The script currently *installs* the following:

* Antigen for Zsh plugins
* NeoVim
* Tmux
* [FiraCode Font](https://github.com/tonsky/FiraCode) for powerline font support for Spaceship Prompt
* PyLint
* Silver Searcher (file searcher inside NeoVim)
* Ranger (file navigation)
* Navi (cheatsheet program) 

It also syncs the following configurations:

* `.zshrc` sources alias, functions, and antigenrc files. Sets NeoVim as the visual editor
* Tmux configuration via the `.tmux.conf` file
* `.antigenrc` contains all the custom Zsh configs via Antigen + Oh-My-Zsh
	* Plugins are currently all from [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins)
	* Most of these are self explanatory, but [Spaceship Prompt](https://spaceship-prompt.sh) is noteworthy
* `Nvim/init.vim` configures NeoVim and also loads plugins. You'll still need to install them within NeoVim via `:PlugInstall`
* `ranger` defines the preferences for Ranger (duh)

It also includes Terminal themes in the `terminal_themes` folder, which can be manually loaded via Terminal > Preferences.

## Dependencies

The configuration is all done via the `install` script in the root directory. It will configure most of the needed files and packages, but Homebrew is unable to autoinstall from the script for some reason, as well as Vim-Plug. ¯\_(ツ)_/¯ Maybe I'll take the time to hack that in one day...

[_Homebrew_](https://brew.sh)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

These next commands may not be needed, but I'll leave them here just in case. They were originally part of the shoddy README that I made when I first setup the repo, and I'm not 100% why they would be needed during a manual install.
```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile    
eval "$(/opt/homebrew/bin/brew shellenv)"
```

[_Vim-Plug_](https://github.com/junegunn/vim-plug)

Vim-Plug (for Neovim specifically) also needs to be installed.

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## New Setup

First remove any configurations on the system in the following directories to avoid conflicts. **You should probably back up existing configs first!** These are the files that may cause conflicts:

```
~/.aliases
~/.functions
~/.zshrc
~/.antigenrc
~/.tmux.conf
~/.config/nvim
~/.config/ranger
```

Install Homebrew and Vim-Plug as outlined above, then run the `install` script. This will first create symlinks to the dotfiles from the repo onto the system where they're expected, followed by any program installations. If there are any files that cannot be linked check to see if the target file already exists, and remove it if needed before running the install again.

Once the script has completed, reload the shell to source the `.zshrc` (which sources everything else inside it). You'll also need to set the Terminal theme/font to Fira Code if it isn't already. The themes included in the repo may already have those settings preconfigured, depending on if I remembered to do so or not...

Finally, load up NeoVim and run `:PlugInstall` to install its associated plugins.

## Updating Configurations

If a new setting is added to `main` it's usually sufficient to just run `git pull` on your local `main` branch, followed by reloading the shell. However if a brand new config file is introduced. that needs linking, or there's a new program that requires installation, you should run the `install` script again after pulling.

# Adding and Modifying Configurations

Before pushing your configs to `main` be sure to test them with a newly loaded shell, and run the `install` script for good measure.

Adding a configuration can be done within a pre-existing file (like `.antigenrc` for Antigen related stuff) or in their own file that is then sourced somewhere within the `.zshrc` chain. If a new file or folder is added that needs symlinking then it needs to be added to `install.conf.yaml` under `- link` with the `TARGET: REPO_LOCATION` format.

New programs slated for installation via Homebrew should also be added to the `install.conf.yaml` file at the end, like `[brew install foobar, Installing foobar]`. Note that these are simply arrays containing a `[COMMAND, MESSAGE]` format, and can be used for more than just installations!

## Machine Specific Configurations

The `main` branch should only contain settings that are going to be used globally, and should not include configurations that pertain to one specific system. If there's a custom setup that extends `main` on one particular machine do so in a new branch off of `main`.

For organizational purposes it's recommended to add the config files to their own `.rc` file, then source it inside of the `.zshrc`. For example if there's a config that extends `main` that is only used on a work machine you can make the `work` branch with a `.workrc` file containing all the settings you need (aliases, functions, exports), and then source that in the `.zshrc`.

If there's sensitive data contained in these custom configs (such as the export of keys) then the branch should remain local. Any settings that need disabling should be done by commenting it out. 

To sync up `main` updates to a custom branch simply run a `git rebase main`. If possible try to keep any configuration changes separate from the existing files in order to reduce the need to resolve conflicts during a rebase.

# Troubleshooting

### Linking of a file failed
If this is a new install try cleaning out the files that failed to link, then try again. Otherwise double check the `install.conf.yaml` and any associated file/folder names for typos.

### An antigen plugin won't load on a fresh shell
Antigen seems to be kind of finicky when applying plugins, and when one fails all subsequent plugin bundles fail. You can manually source `.antigenrc` and count the succesful plugin installs, then compare them against those listed in the rc file.

An easier method is to run `antigen list` to see what's installed. If one or more plugins appear to be missing try `antigen bundle pluginName` followed by `antigen apply` to see if the package loads. If it doesn't then it's probably an issue with the plugin. 

If multiple plugins are missing it's most likely that just one is failing, and all the ones below it are being skipped. Try removing the first plugin from the list, then reload the shell to see if they install.

If the plugin just adds useful aliases (like the `python` and `tmux` plugins) it's probably just easier to manually add them to the `.aliases` file, honestly...

### Spaceship Prompt not loading properly
You may notice that sourcing the `.antigenrc` or `.zshrc` file (either directly in the shell or as a startup argument to Terminal) appears to mess with the display of Spaceship Prompt... dunno why that happens. Just avoid doing it (outside of troubleshooting). :p

If things like Git status aren't displaying properly be sure that Fira Code is selected in the Terminal profile.
