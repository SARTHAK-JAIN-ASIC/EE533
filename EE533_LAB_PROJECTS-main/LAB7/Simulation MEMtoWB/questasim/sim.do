vsim -gui work.stage_MEMtoWB_tb -novopt

do {wave.do}

view wave
view structure
view signals

run 500000ps
# run -all