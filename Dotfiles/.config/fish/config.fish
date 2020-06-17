if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Fish prompt settings reconfigure
set SPACEFISH_PROMPT_FIRST_PREFIX_SHOW "true"
set SPACEFISH_CHAR_SUFFIX "  "
set SPACEFISH_TIME_SHOW "true"
set SPACEFISH_USER_SHOW "always"
set SPACEFISH_HOST_SHOW "always"
set SPACEFISH_DIR_TRUNC "0"
set SPACEFISH_EXEC_TIME_ELAPSED "5"
set SPACEFISH_BATTERY_SHOW "charged"
set SPACEFISH_EXIT_CODE_SHOW "true"

neofetch
nl
