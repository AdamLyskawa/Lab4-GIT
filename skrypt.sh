#!/bin/bash

count_files() {
  local prefix=$1
  local count=${2:-100}
  for ((i=1; i<=count; i++)); do
    mkdir -p "${prefix}${i}"
    echo -e "Nazwa pliku: ${prefix}${i}.txt\nSkrypt: $0\nData: $(date)" > "${prefix}${i}/${prefix}${i}.txt"
  done
}

case $1 in
  --date|-d)
    echo "Dzisiejsza data: $(date)"
    ;;
  --logs|-l)
    count=${2:-100}
    for ((i=1; i<=$count; i++)); do
      echo -e "Nazwa pliku: log${i}.txt\nSkrypt: $0\nData: $(date)" > "log${i}.txt"
    done
    ;;
  --help|-h)
    echo "Dostępne opcje:"
    echo "--date lub -d         - pokazuje dzisiejszą datę"
    echo "--logs [n] lub -l [n] - tworzy n (domyślnie 100) plików logx.txt"
    echo "--error [n] lub -e [n] - tworzy n (domyślnie 100) katalogów errorx/errorx.txt"
    echo "--init                - klonuje repozytorium i ustawia PATH"
    echo "--help lub -h         - pokazuje tę pomoc"
    ;;
  --error|-e)
    count_files "error" "$2"
    ;;
  --init)
    echo "Klonowanie repozytorium..."
    git clone https://github.com/AdamLyskawa/Lab4-GIT.git cloned_repo
    export PATH=$PATH:$(pwd)/cloned_repo
    echo "Dodano cloned_repo do PATH"
    ;;
  *)
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne polecenia."
    ;;
esac
