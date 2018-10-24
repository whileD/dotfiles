depend=("git" "python3")
notnext=false

for item in "${depend[@]}"; do
  if builtin command -v $item > /dev/null 2>&1; then
    echo "${item} ok."
  else
    echo "${item} has not."
    let $notnext=true
  fi
done

if $notnext; then
  exit
fi

nvimdir=~/.config/nvim
mkdir -p $nvimdir
ln -s $(pwd)/toml $nvimdir/toml
ln -s $(pwd)/init.vim $nvimdir/init.vim
ln -s $(pwd)/templates $nvimdir/templates

deindir=~/.cache/dein/repos/github.com/Shougo/dein.vim
if [ ! -e $deindir ]; then
  git clone https://github.com/Shougo/dein.vim $deindir
fi
