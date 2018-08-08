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

mkdir -p ~/.config/nvim
ln -s ./toml ~/.config/nvim/toml
ln -s ./init.vim ~/.config/nvim/init.vim

deindir=~/.cache/dein/repos/github.com/Shougo/dein.vim
if [ ! -e $deindir ]; then
  git clone https://github.com/Shougo/dein.vim $deindir
fi
