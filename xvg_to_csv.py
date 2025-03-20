import os
import csv
import sys

def xvg_to_csv(input_file):
    """
    Liest eine .xvg Datei von GROMACS ein und schreibt die Daten 
    (erste Spalte = X, zweite Spalte = Y) in eine CSV-Datei mit gleichem Namen.
    """
    # Erstellt den Output-Dateinamen mit gleicher Basis
    base, _ = os.path.splitext(input_file)
    output_file = base + ".csv"

    with open(input_file, 'r') as fin, open(output_file, 'w', newline='') as fout:
        writer = csv.writer(fout)
        writer.writerow(["X", "Y"])  # Kopfzeile, optional

        for line in fin:
            line = line.strip()
            # Überspringe Kommentarzeilen, leere Zeilen oder sonstige nicht-Datenzeilen
            if not line or line.startswith('#') or line.startswith('@'):
                continue
            
            columns = line.split()
            if len(columns) >= 2:
                x_val = columns[0]
                y_val = columns[1]
                writer.writerow([x_val, y_val])
    
    print(f"Erfolgreich konvertiert: '{input_file}' -> '{output_file}'")

if __name__ == "__main__":
    # Nutzung: python scriptname.py datei.xvg
    if len(sys.argv) < 2:
        print("Bitte eine oder mehrere .xvg-Dateien angeben.\nBeispiel: python scriptname.py datei.xvg")
        sys.exit(1)
    
    # Falls du mehrere Dateien gleichzeitig übergeben willst, kannst du sie hier verarbeiten:
    for in_file in sys.argv[1:]:
        xvg_to_csv(in_file)

