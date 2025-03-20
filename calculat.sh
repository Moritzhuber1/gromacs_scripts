#!/bin/bash 


echo "Starting calculating nice values"

echo "first rmsd... lets fucking go"

echo -e "1\n1" | gmx rms -s md.tpr -f traj_comp.xtc 

echo -e "4" | gmx rmsf -s md.tpr -f traj_comp.xtc -oq -res

echo -e "9" | gmx energy -f ener.edr 

echo -e "1" | gmx gyrate -s md.tpr -f traj_comp.xtc

echo "MORITZ reminds you "you are a genius..." "


