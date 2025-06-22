vsim -gui work.ARM_datapath_tb -novopt

do {wave.do}

view wave
view structure
view signals

# run 500000ps
# run 20000ps
run 4000000ps
# run -all