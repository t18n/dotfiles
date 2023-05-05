# Display time
SPACESHIP_TIME_SHOW=true

# # Display username always
SPACESHIP_USER_SHOW=always

# # Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false

# Add custom Ember section
# # See: https://github.com/spaceship-prompt/spaceship-ember
# spaceship add ember

# # Add a custom vi-mode section to the prompt
# # See: https://github.com/spaceship-prompt/spaceship-vi-mode
# spaceship add --before char vi_mode


[character]
success_symbol = "[λ](bold purple)"
error_symbol = "[λ](italic bold red)"

[[battery.display]]
threshold = 10
style = "bold red"

[[battery.display]]
threshold = 30
style = "bold yellow"

[[battery.display]]
threshold = 50
style = "bold green"

add_newline = false