```
db       .d88b.  db    db d88888b   db    db d888888b .88b  d88.      d888888b .88b  d88. db    db db    db   .d888b.  
88      .8P  Y8. 88    88 88'       88    88   `88'   88'YbdP`88      `~~88~~' 88'YbdP`88 88    88 `8b  d8'   8P   8D  
88      88    88 Y8    8P 88ooooo   Y8    8P    88    88  88  88         88    88  88  88 88    88  `8bd8'    `Vb d8'  
88      88    88 `8b  d8' 88~~~~~   `8b  d8'    88    88  88  88         88    88  88  88 88    88  .dPYb.     d88C dD 
88booo. `8b  d8'  `8bd8'  88.        `8bd8'    .88.   88  88  88 db      88    88  88  88 88b  d88 .8P  Y8.   C8' d8D  
Y88888P  `Y88P'     YP    Y88888P      YP    Y888888P YP  YP  YP V8      YP    YP  YP  YP ~Y8888P' YP    YP   `888P Yb 
P                                                    

d88888b d88888D d88888b 
88'     YP  d8' 88'     
88ooo      d8'  88ooo   
88~~~     d8'   88~~~   
88       d8' db 88      
YP      d88888P YP      
```
                        
♠️  ♤ Keep rocking 🎸 my text editing experiece 💙💚💜


## Getting started
### Install the necessary stuff

- Make sure that you have installed the following(*Using Homebrew recommended*):
  - Vim > 8.* or NeoVim
  - tmux
    - and [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
  - [oh-my-zsh](https://ohmyz.sh/) - manage your zsh configuration and add themes and plugins
  - [FZF](https://github.com/junegunn/fzf) - an amazing commandline fuzzy finder for your files a lot of things 🤓. Check it out!!
  - [grip](https://github.com/joeyespo/grip) - (*to enable Markdown Preview for*)


### Add symbolic links for necessary files
In the root directory for this repo, run `zsh ./create-sym-links.sh`

This will help to make sure that set up and configuration files such as:
- .vimrc
- .zshrc
- .tmux.conf
- [coc.nvim](https://github.com/neoclide/coc.nvim) configuration file


### Setting up terminal devicons
This will enable Vim/NeoVim to display nerd icons e.g. File Extension icons on NERDTree etc.

- Download and install a [patched Nerd Font](https://github.com/ryanoasis/nerd-fonts)
  - such as [Hack Nerd Font](https://github.com/source-foundry/Hack/blob/master/build/ttf/Hack-Regular.ttf)
  - ensure that the font installed has nerd devicons - You can use Font Book if using MacOS to check out the installed font
- Open you terminal emulator e.g. ITerm and set the Font Type to the patched font


## Setting up coc.nvim language servers
### Salesforce language servers
- In this repo's directory, navigate to `./salesforce-language-servers` and run `npm install`

### Common language servers
- Coc.nvim has a lot of plugins for providing language intellisense for many common languages and frameworks. Just do a google search for your favourite language. e.g.
    - `coc-tsserver` - for TypeScript and JavaScript
    - `coc-python` - for ...
    - `coc-angular` - for ...
    - etc


```
.oPYo.                    8     o                         88 88 88 
8    8                    8     8                         88 88 88 
8      .oPYo. .oPYo. .oPYo8    o8P .oPYo.   .oPYo. .oPYo. 88 88 88 
8   oo 8    8 8    8 8    8     8  8    8   8    8 8    8 88 88 88 
8    8 8    8 8    8 8    8     8  8    8   8    8 8    8 `' `' `' 
`YooP8 `YooP' `YooP' `YooP'     8  `YooP'   `YooP8 `YooP' 88 88 88 
:....8 :.....::.....::.....:::::..::.....::::....8 :.....:.........
:::::8 :::::::::::::::::::::::::::::::::::::::ooP'.::::::::::::::::
:::::..:::::::::::::::::::::::::::::::::::::::...::::::::::::::::::

```
