> [!IMPORTANT]
> Most of this discord bot is getting reworked on based on the notices to make all discord bot better

<!-- Divider Color #3776ab -->
# Cordevall Python Discord Bot Template
A Python Discord Bot for all

[direnv]: https://direnv.net/
[envExample]: .env.example


## Features
- Both Slash Commands and Text-Commands using `!`.
- One Place for Multiple Cogs to organize your Cogs!
- Management though a lightweight Dashboard using `flask`.


##  Table of Contents

- [Cordevall Python Discord Bot Template](#cordevall-python-discord-bot-template)
  - [Features](#features)
  - [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Nix | Recommended for Nix/NixOS users](#nix--recommended-for-nixnixos-users)
    - [Loading Nix Environment](#loading-nix-environment)
    - [Flake Information](#flake-information)
  - [Poetry | Virtual Environments Recommended](#poetry-virtual-environments-recommended)
  - [Python](#python)
- [Setting up the bot](#setting-up-the-bot)
  - [So what you require to get this bot working?](#so-what-you-require-to-get-this-bot-working)

![Divider 1](src/assets/docs/dividers2.png)

# Installation

## Nix | Recommended for Nix/NixOS users
Your in luck Nix/NixOS users we have included a `flake.nix` ready for you to use.
We have combined of all of the information of the flake [here](#flake-information)

### Loading Nix Environment
To load the environment for Nix/NixOS by using
```
export NIXPKGS_ALLOW_UNFREE=1
nix develop --impure
``` 

or you can do the automatic way by installing [direnv][direnv].


### Flake Information
- Devenv for devenvioments. 
- Installs Poetry and Python.
- Git Hooks to format and lint python and nix files.
- Automatic loading of dev environments via `direnv`.


## Poetry | Virtual Environments Recommended
> [!CAUTION]
> Poetry should always be installed in a dedicated virtual environment to isolate it from the rest of your system. It should in no case be installed in the environment of the project that is to be managed by Poetry. This ensures that Poetry’s own dependencies will not be accidentally upgraded or uninstalled. (Each of the following installation methods ensures that Poetry is installed into an isolated environment.) In addition, the isolated virtual environment in which poetry is installed should not be activated for running poetry commands.


## Python

1. Install Python via: 
2. Install the required packages using 
```sh
pip install -r requirements.txt
```


# Setting up the bot

To setup the bot we have included a `.env.example` [here][envExample] to know what you need to input follow below.

## So what you require to get this bot working? 
You will need:
- A Discord Bot Token
- Guild ID
- Mongo DB Connection URl (Nix users have the service included in their flake)
