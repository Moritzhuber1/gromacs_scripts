import os
import csv
import sys

def xvg_to_csv(input_file):
    """
    Reads a .xvg file from GROMACS and writes the data 
    (first column = X, second column = Y) into a CSV file with the same base name.
    """
    # Create output filename with the same base name
    base, _ = os.path.splitext(input_file)
    output_file = base + ".csv"

    with open(input_file, 'r') as fin, open(output_file, 'w', newline='') as fout:
        writer = csv.writer(fout)
        writer.writerow(["X", "Y"])  # Header row, optional

        for line in fin:
            line = line.strip()
            # Skip comment lines, empty lines, or other non-data lines
            if not line or line.startswith('#') or line.startswith('@'):
                continue
            
            columns = line.split()
            if len(columns) >= 2:
                x_val = columns[0]
                y_val = columns[1]
                writer.writerow([x_val, y_val])
    
    print(f"Successfully converted: '{input_file}' -> '{output_file}'")

if __name__ == "__main__":
    # Usage: python scriptname.py file.xvg
    if len(sys.argv) < 2:
        print("Please provide one or more .xvg files.\nExample: python scriptname.py file.xvg")
        sys.exit(1)
    
    # Loop through multiple files if more than one is provided
    for in_file in sys.argv[1:]:
        xvg_to_csv(in_file)

