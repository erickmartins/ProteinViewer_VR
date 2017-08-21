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

mol modselect 0 0 residue 0 to 107
mol modstyle 0 0 Newcartoon
mol modcolor 0 0 Chain
color Chain A orange3
mol addrep 0
mol modselect 1 0 residue 108 to 312
mol modstyle 1 0 Newcartoon
mol modcolor 1 0 Chain
color Chain B mauve
mol addrep 0
mol modselect 2 0 residue 313 to 462
mol modstyle 2 0 Newcartoon
mol modcolor 2 0 Chain
color Chain C lime
mol addrep 0
mol modselect 3 0 residue 18 19 38 59 75 76 96
mol modstyle 3 0 licorice
mol modcolor 3 0 Name
color Name C orange3
mol addrep 0
mol modselect 4 0 residue 119 120 280 284
mol modstyle 4 0 licorice
mol modcolor 4 0 Type
color Type C mauve
mol addrep 0
mol modselect 5 0 residue 315 334 345
mol modstyle 5 0 licorice
mol modcolor 5 0 Element
color Element C lime
mol addrep 0
mol modselect 6 0 residue 463 464
mol modstyle 6 0 Beads 2 12
mol modcolor 6 0 Element
color Element Mn green
mol addrep 0
mol modselect 7 0 residue 465 466
mol modstyle 7 0 licorice
mol modcolor 7 0 Element
color Element F cyan3


for {set framecount 0} {$framecount < $frame} {incr framecount 1} {
	set filename [format $outputfolder $framecount]
	animate goto $framecount
	render Wavefront $filename
}

