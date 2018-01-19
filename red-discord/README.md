Image for [Red-DiscordBot](https://github.com/Cog-Creators/Red-DiscordBot)
I'm not the author of the Bot and made this image for personal use. However feel free to use it.

# Quick start:
`docker run -it -v <your_path>/data:/app/data pejter/red-discordbot`
## Cogs and data are automatically preserved using docker-managed volumes
> If you'd like to host-mount those volumes you can do so, but make sure to initialize the directories first using their respective folders from the [source repository](https://github.com/Cog-Creators/Red-DiscordBot). Then you can run the container with

`docker run -it -v <your_path>/data:/app/data -v <your_path>/cogs:/app/cogs pejter/red-discordbot`

# Image Variants

The `red-discordbot` images come in many flavors, each based on the corresponding `python` image variant.

### This image has avconv installed instead of ffmpeg
To switch to it use the `[p]audioset player` command. `avconv` is used because ffmpeg is no longer maintained in debian main repositories and is replaced by it's fork `libavconv`.

## `python:latest`

This is the defacto image. If you are unsure about what your needs are, you probably want to use this one.

## `python:slim`

This image does not contain the common packages contained in the default tag and only contains the minimal packages needed to run **Red**.
As such it is about *2x smaller*. I highly recommend using the default image of this repository, unless you are working in an environment where *only* the base **Red** bot will be deployed with no additional dependencies and you have space constraints.

## `python:alpine`
### This is the only variant that still uses ffmpeg
This variant is highly recommended when image size being as small as possible is desired. It's about 10% smaler than the `red-discordbot:slim` variant, however before using this image it is *highly recommended* to read about [the `python:alpine` official image](https://hub.docker.com/_/python) variant and it's caveats.

![intro](http://i.imgur.com/RgGlNpQ.jpg)

# Red - A fully customizable Discord bot
#### *Music, admin, trivia, fun commands and much more!*
[![](https://img.shields.io/badge/Support-me!-orange.svg)](https://www.patreon.com/Twentysix26)  [![](https://img.shields.io/badge/discord-py-blue.svg)](https://github.com/Rapptz/discord.py) [![](https://discordapp.com/api/guilds/133049272517001216/widget.png?style=shield)](https://discord.gg/red) [![Build Status](https://api.travis-ci.org/Cog-Creators/Red-DiscordBot.svg?branch=develop)](https://travis-ci.org/Cog-Creators/Red-DiscordBot) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

**Red** is a fully modular bot – meaning all features and commands can be enabled/disabled to your liking, making it completely customizable.  
This is also a *self-hosted bot* – meaning you will need to host and maintain your own instance. You can turn Red into an admin bot, music bot, trivia bot, new best friend or all of these together!  
[Installation is easy](https://twentysix26.github.io/Red-Docs/), and you do NOT need to know anything about coding! Aside from installation and updating, every part of the bot can be controlled from within Discord.

The default set of modules includes and is not limited to:
* Moderation features (kick/ban/softban/hackban, mod-log, filter, chat cleanup)
* Trivia (lists are included and can be easily added)
* Music features (YouTube, SoundCloud, local files, playlists, queues)
* Stream alerts (Twitch, Hitbox, Beam)
* Slot machines
* Custom commands
* Imgur/gif search

Additionally, other modules (cogs) can be easily found and added from our growing community of cog repositories. Including:
* Cleverbot integration (talk to Red and she talks back)
* Loggers
* Welcome messages setup
* Reminders
* Raffles
* Leveler (increase levels for server participation)
* DotA
* And much, much more!

Feel free to take a [peek](https://cogs.red/)!

# Installation

The installation process is straightforward; all major platforms are supported:
* [Windows](https://twentysix26.github.io/Red-Docs/red_install_windows/)
* [Linux](https://twentysix26.github.io/Red-Docs/red_install_linux/)
* [macOS](https://twentysix26.github.io/Red-Docs/red_install_mac/)

Read the [getting started](https://twentysix26.github.io/Red-Docs/red_getting_started/) guide to quickly learn how to use Red.  

If you have any other questions, feel free to explore the [Docs](https://twentysix26.github.io/Red-Docs/) for guidance.

If [*after reading the guides*](https://twentysix26.github.io/Red-Docs/) you are still experiencing issues that are not listed on [this page](https://twentysix26.github.io/Red-Docs/red_guide_troubleshooting/) or in the [FAQs](https://twentysix26.github.io/Red-Docs/red_faq/), feel free to join the [official server](https://discord.gg/red) for help.  
Have fun!

# Join the community!

Red is in continuous development, and it’s supported by an active community which produces new content (cogs/plugins) for everyone to enjoy. New features are constantly added. If you can’t [find](https://cogs.red/) what you’re looking for, we are open to suggestions! Stay tuned by [joining the official server](https://discord.gg/red)!

# License

Released under the [GNU GPL v3](LICENSE).

*Red is named after the main character of "Transistor", a videogame by [Supergiant Games](https://www.supergiantgames.com/games/transistor/)*
