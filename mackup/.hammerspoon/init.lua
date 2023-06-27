-- Examples: https://github.com/ipatch/dotfiles/blob/f43a96aebde45101af1da60238dfbb7783f6473a/jobs/macos/Users/mr-fancy/hammerspoon/init.lua#L37-L39

mouse_follows_focus = hs.loadSpoon("MouseFollowsFocus")
mouse_follows_focus:configure({})
mouse_follows_focus:start()