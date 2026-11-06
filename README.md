# bjhinkle/homebrew-tap

Homebrew formulae for [lxdtop](https://github.com/bjhinkle/lxdtop), a live, btop-style view of an LXD host.

```sh
brew install bjhinkle/tap/lxdtop
```

lxdtop itself runs on the LXD host. The formula installs `lxdtop-remote`, which copies lxdtop to a host over SSH and shows it in your terminal:

```sh
lxdtop-remote install myhost   # copy lxdtop to myhost:~/bin/lxdtop
lxdtop-remote myhost           # show it here (q quits)
```
