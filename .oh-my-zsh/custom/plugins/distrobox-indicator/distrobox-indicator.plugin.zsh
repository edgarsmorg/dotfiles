function distrobox_prompt_info() {
  if [[ -n "$CONTAINER_ID" ]]; then
    echo "%F{magenta}(󱣘 $CONTAINER_ID) %f "
  fi
}
