#!/bin/bash

base_path=~/Documents/moritz/exp_md_sim

for dir in "$base_path"/*/ ; do
    [ -d "$dir" ] || continue

    folder_name=$(basename "$dir")
    auto_sh="$dir/auto.sh"

    if [ -f "$auto_sh" ]; then
        echo "🔧 Passe $auto_sh an für Protein: $folder_name"

        # Ersetze die Zeile mit protein="..."
        sed -i "s/^protein=.*/protein=\"$folder_name\"/" "$auto_sh"
    else
        echo "⚠️  Keine auto.sh Datei in $dir gefunden"
    fi
done
