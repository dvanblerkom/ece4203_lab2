# Define the Makefile variables for the four arguments
cell ?= nand2_2
cell_inputs ?= in pull_up
cpar ?= 1f
fanout ?= 1
temp ?= 27

run: tpd_test_template.cir
	@echo "Replacing nominal values with cell=$(cell), cell_inputs=$(cell_inputs), temp=$(temp), cpar=$(cpar), and fanout=$(fanout)"
	@sed -e "s/CPARVALUE/$(cpar)/g" \
	     -e "s/FANOUTVALUE/$(fanout)/g" \
	     -e "s/CELLNAMEVALUE/$(cell)/g" \
	     -e "s/CELLINPUTSVALUE/$(cell_inputs)/g" \
	     -e "s/TEMPVALUE/$(temp)/g" \
	     tpd_test_template.cir > tpd_test.cir
	LD_LIBRARY_PATH=/data02/ECE4203/lib /data02/ECE4203/bin/ngspice tpd_test.cir
