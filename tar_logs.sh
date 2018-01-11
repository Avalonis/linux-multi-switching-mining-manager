#!/bin/bash
###############################################################################
arch_name=last_logfiles_$(date +%s).tar

tar -cvf ${arch_name} \
    multi_mining_calc.err \
    multi_mining_calc.log \
    algo_multi_abfrage.log \
    perfmon.log \
    GLOBAL_GPU_SYSTEM_STATE.in \
    GLOBAL_GPU_ALGO_RUNNING_STATE \
    GLOBAL_ALGO_DISABLED \
    gpu_system.out \
    MINER_ALGO_DISABLED_HISTORY \
    MAX_PROFIT_DATA.out
    
find . -name gpu_gv-algo_\*.log   -exec tar -rvf ${arch_name} {} +
find . -name \*_mining.log        -exec tar -rvf ${arch_name} {} +
find . -name \*_benchmark.log     -exec tar -rvf ${arch_name} {} +
find . -name ALGO_WATTS_MINES.in  -exec tar -rvf ${arch_name} {} +
find . -name gpu_index.in         -exec tar -rvf ${arch_name} {} +
find . -name benchmark_GPU-*.json -exec tar -rvf ${arch_name} {} +
find benchmarking/test/ -name \*  -exec tar -uvf ${arch_name} {} +

tar -cvzf ${arch_name}.gz --remove-files ${arch_name}