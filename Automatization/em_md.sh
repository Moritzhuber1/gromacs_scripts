#!/bin/bash 


force_field="8"
water="6"

#datei names 

protein="hpin_ww"
topology="topol"

echo "best simulation ever is now starting with #$force_field"


echo -e "$force_field\n$water" | gmx pdb2gmx -f ${protein}.pdb -o ${protein}.gro -p ${topology}.top

gmx editconf -f ${protein}.gro -o box.gro -d 0.7

gmx solvate -cp box.gro -cs spc216 -o ${protein}_sol.gro -p ${topology}.top

gmx grompp -f em.mdp  -c ${protein}_sol.gro -p ${topology}.top -o ions.tpr -maxwarn 2  

echo "13" | gmx genion -s ions.tpr -o ${protein}_neutr.gro -p ${topology}.top -pname NA -nname CL -neutral

gmx grompp -f em.mdp -c ${protein}_neutr.gro -p ${topology}.top -o em.tpr -maxwarn 2 

gmx mdrun -v -s em.tpr -c em.pdb  


echo "Best energy minimisation ever"
