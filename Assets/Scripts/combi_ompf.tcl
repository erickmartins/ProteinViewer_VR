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

mol modselect 0 0 all
mol modstyle 0 0 Newcartoon
mol modcolor 0 0 Chain
color Chain A orange3
color Chain B mauve
color Chain C lime
mol addrep 0
mol modselect 1 0 not protein
mol modstyle 1 0 licorice
mol modcolor 1 0 Element
color Element C cyan3


for {set framecount 0} {$framecount < $frame} {incr framecount 1} {
	set filename [format $outputfolder $framecount]
	animate goto $framecount
	render Wavefront $filename
}

