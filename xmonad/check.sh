depend=("compton" "nitrogen")

for item in "${depend[@]}"; do
  if builtin command -v $item > /dev/null 2>&1; then
    echo "${item} ok."
  else
    echo "${item} has not."
  fi
done


# Environment variables
if [ ! -n "${WALLPAPER}" ]; then
  echo "\$WALLPAPER is not found."
fi
