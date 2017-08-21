set frame  0
axes location off
set folder [lindex $argv 0]
set negfolder $folder*-neg/*.pdb
set posfolder $folder*-pos/*.pdb
set outputfolder $folder/outputs/animate.%04d.obj

foreach pdb [lsort -decreasing [glob $posfolder]] { 
  mol addfile $pdb 
  

  incr frame
} 

foreach pdb [lsort [glob $negfolder]] { 
  mol addfile $pdb 
  

  incr frame
} 

mol modselect 0 0 residue 29 to 36 129 to 333 531 to 549
mol modstyle 0 0 Newcartoon
mol modcolor 0 0 Chain
color Chain A orange3
mol addrep 0
mol modselect 1 0 residue 37 to 128
mol modstyle 1 0 Newcartoon
mol modcolor 1 0 Chain
color Chain B mauve
mol addrep 0
mol modselect 2 0 residue 334 to 530 550 to 693
mol modstyle 2 0 Newcartoon
mol modcolor 2 0 Chain
color Chain C lime
mol addrep 0
mol modselect 3 0 residue 0 to 28
mol modstyle 3 0 Newcartoon
mol modcolor 3 0 Chain
color Chain D red
mol addrep 0
mol modselect 4 0 residue 403 467 592 594 596
mol modstyle 4 0 licorice
mol modcolor 4 0 Name
color Name C lime
mol addrep 0
mol modselect 5 0 not protein
mol modstyle 5 0 licorice
mol modcolor 5 0 Element
color Element C cyan3
color Element F green


for {set framecount 0} {$framecount < $frame} {incr framecount 1} {
	set filename [format $outputfolder $framecount]
	animate goto $framecount
	render Wavefront $filename
}

