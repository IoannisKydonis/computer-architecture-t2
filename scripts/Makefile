GEM5=./build/ARM/gem5.opt
SE = ./configs/example/se.py

SPEC_BZIP=./spec_cpu2006/401.bzip2/src/
SPEC_MCF=./spec_cpu2006/429.mcf/src/
SPEC_HMMER=./spec_cpu2006/456.hmmer/src/
SPEC_SJENG=./spec_cpu2006/458.sjeng/src/
SPEC_LBM=./spec_cpu2006/470.lbm/src/

BZIP_IN="spec_cpu2006/401.bzip2/data/input.program 10"
MCF_IN="spec_cpu2006/429.mcf/data/inp.in"
HMMER_IN="--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm"
SJENG_IN="spec_cpu2006/458.sjeng/data/test.txt"
LBM_IN="20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of"

SE_PARAMS=--cpu-type=MinorCPU --caches --l2cache

FLAGS=-I 100000000

default: all

all: specbzip specmcf spechmmer specsjeng speclibm

specbzip:
	$(GEM5) -d spec_results/$@ $(SE) $(SE_PARAMS) -c $(SPEC_BZIP)$@ -o $(BZIP_IN) $(FLAGS)
specmcf:
	$(GEM5) -d spec_results/$@ $(SE) $(SE_PARAMS) -c $(SPEC_MCF)$@ -o $(MCF_IN) $(FLAGS)
spechmmer:
	$(GEM5) -d spec_results/$@ $(SE) $(SE_PARAMS) -c $(SPEC_HMMER)$@ -o $(HMMER_IN) $(FLAGS)
specsjeng:
	$(GEM5) -d spec_results/$@ $(SE) $(SE_PARAMS) -c $(SPEC_SJENG)$@ -o $(SJENG_IN) $(FLAGS)
speclibm:
	$(GEM5) -d spec_results/$@ $(SE) $(SE_PARAMS) -c $(SPEC_LBM)$@ -o $(LBM_IN) $(FLAGS)

build:
	make all -C $(SPEC_BZIP)
	make all -C $(SPEC_MCF)
	make all -C $(SPEC_HMMER)
	make all -C $(SPEC_SJENG)
	make all -C $(SPEC_LBM)
