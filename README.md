# LearningRosetta0
Uploading the Rosetta input files and flags here

# Workflow
1. Downloaded 2AJF.pdb from RCSB database.
2. Clean the pdb using the python files in Cleaning PDB. Output only 2 of the four chains (A & E)
3. Relax the protein using the following command: $Rosetta/bin/relax.default.linuxgcc @flags-relax
4. Copy the output pdb of Step 3 and paste it in the input folder. Rename it to 2AJF.relaxed.pdb (refer to @flags-mutation for input address)
5. Mut and pack using the mutation_script.xml by using the command: $Rosetta/bin/rosetta_scripts.default.linuxgcc @flgas-mutations 

Step 5 is run in loops for the different mutations at different points. This was automated using the multirun.sh bash script.
