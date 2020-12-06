#!/bin/bash

l1_dcache_sizes=("16kB" "32kB" "64kB" "128kB")
l1_icache_sizes=("16kB" "32kB" "64kB" "128kB")
l2_cache_sizes=("512kB" "1024kB" "2048kB" "4096kB")
l1_dcache_assoc=("1" "2" "4")
l1_icache_assoc=("1" "2" "4")
l2_cache_assoc=("1" "2" "4")
cacheline_sizes=("32" "64" "128")

benchmark_path=spec_cpu2006/458.sjeng/src/specsjeng
input_param="spec_cpu2006/458.sjeng/data/test.txt"
output_folder="sjeng"

for l1ds in "${l1_dcache_sizes[@]}"; do
    for l1is in "${l1_icache_sizes[@]}"; do
          ./build/ARM/gem5.opt -d spec_results/"${output_folder}/l1ds_${l1ds}_l1is_${l1is}" configs/example/se.py \
          --cpu-type=MinorCPU --caches --l2cache --l1d_size="${l1ds}" --l1i_size="${l1is}" --cpu-clock=1GHz \
          -c "${benchmark_path}" -o "${input_param}" -I 100000000
    done
done

for l2s in "${l2_cache_sizes[@]}"; do
    ./build/ARM/gem5.opt -d spec_results/"${output_folder}/l2s_${l2s}" configs/example/se.py \
    --cpu-type=MinorCPU --caches --l2cache --l2_size="${l2s}" --cpu-clock=1GHz \
    -c "${benchmark_path}" -o "${input_param}" -I 100000000
done

for l1da in "${l1_dcache_assoc[@]}"; do
    ./build/ARM/gem5.opt -d spec_results/"${output_folder}/l1da_${l1da}" configs/example/se.py \
    --cpu-type=MinorCPU --caches --l2cache --l1d_assoc="${l1da}" --cpu-clock=1GHz \
    -c "${benchmark_path}" -o "${input_param}" -I 100000000
done

for l1ia in "${l1_icache_assoc[@]}"; do
    ./build/ARM/gem5.opt -d spec_results/"${output_folder}/l1ia_${l1ia}" configs/example/se.py \
    --cpu-type=MinorCPU --caches --l2cache --l1i_assoc="${l1ia}" --cpu-clock=1GHz \
    -c "${benchmark_path}" -o "${input_param}" -I 100000000
done

for l2a in "${l2_cache_assoc[@]}"; do
    ./build/ARM/gem5.opt -d spec_results/"${output_folder}/l2a_${l2a}" configs/example/se.py \
    --cpu-type=MinorCPU --caches --l2cache --l2_assoc="${l2a}" --cpu-clock=1GHz \
    -c "${benchmark_path}" -o "${input_param}" -I 100000000
done

for cls in "${cacheline_sizes[@]}"; do
    ./build/ARM/gem5.opt -d spec_results/"${output_folder}/cls_${cls}" configs/example/se.py \
    --cpu-type=MinorCPU --caches --l2cache --cacheline_size="${cls}" --cpu-clock=1GHz \
    -c "${benchmark_path}" -o "${input_param}" -I 100000000
done
