#!/bin/bash
source ~/.bashrc

#time $Rosetta3 @flag-relax
#cp output_files/2AJF.CLEAN_AE_0001.pdb 2AJF_relaxed.pdb

#curl -s   -F "token=a725zmrgg6req3b3mujav5g1kfk2a6"   -F "user=uqi7ybsbikcszikmgmjxbrc41viq2r"   -F "message=Relax Step Done."   https://api.pushover.net/1/messages


for j in R H K D E S T N Q C U G P A V I L M F Y W;
do
for i in {598..771};
do
input_string="CPFGEVFNATKFPSVYAWERKKISNCVADYSVLYNSTFFSTFKCYGVSATKLNVYADSFVVKGDDVRQIAPGQTGVIADYNYKLPDDFMGCVLAWNTRNIDATSTGNYNYKYRYLRHGKLRPFERDISNVPFSPDGKPCTPPALNCYWPLNDYGFYTTTGIGYQPYRVVVLSFE"
k=$(($i-598))
x="${input_string:$k:1}"
mkdir output_files/$k--$x-$i-$j 
sed "s/98/$i/" test.txt > intermediate.bak 
sed "s/W/$j/" intermediate.bak > UbcH7-mutate.resfile
$Rosetta/bin/rosetta_scripts.default.linuxgccrelease @flags-mutations

mv output_files/2AJF.relaxed_0001.pdb output_files/$k--$x-$i-$j
#mv output_files/relax.sc output_files/x-$i-W
mv output_files/score.sc output_files/$k--$x-$i-$j
done

curl -s   -F "token=a725zmrgg6req3b3mujav5g1kfk2a6"   -F "user=uqi7ybsbikcszikmgmjxbrc41viq2r"   -F "message=$k--$x-$i-$j done."   https://api.pushover.net/1/messages

done
