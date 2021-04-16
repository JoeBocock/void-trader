# 💸 void-trader 💸

Void Trader is a custom oh-my-zsh plugin that displays the time left until the he arrives.

Ever been hard at work coding the next big SPA and thought... 

> "Gosh, I can't wait until the Void Trader arrives in Warframe! When is it again?"

No? Me neither! But now your terminal can remind you of it every day.

Utilising the open Warframe content API, the next arrival date and location will be cached on your machine in JSON to prevent spamming them with requests.

---

# Requirements

Void Trader has a couple core packages that it relies on...

- [jq](https://stedolan.github.io/jq/)
- [curl](https://curl.se/)

Curl fetches the data and jq allows for easier parsing of JSON as the response we recieve from the API is a freaking mess.

---

# Installation

Clone this repo into `~/.oh-my-zsh/custom/plugins`

``` 
  git clone https://github.com/JoeBocock/void-trader.git ~/.oh-my-zsh/custom/plugins/void-trader 
```

Edit your `~/.zshrc` and add void-trader to your plugin list.

```
...

plugins=(git void-trader)
```

> No idea what a plugin is? How the hell did you end up on this repo? See [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) for plugin information.

---

# Usage

Umm, open your terminal. If you don't see an output, either i'm dumb or you are, or both.

---

# TODO

I have literally no idea what I'm doing with Bash scripts, so if you have improvements, please submit a PR.

- Add config file to allow for *time left* format changes.
- Give it some more sparkle 🪄. The output is about as interesting as my love life.
- Re-connect with my family
