for file in $PWD/*; do
    dir=${file::-4}
    mkdir -p "$dir"
    mv "$file" "$dir"
done
