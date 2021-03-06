#!/bin/zsh

#==============================================
# This script has been tested with GHDL v.0.37
#==============================================
echo "\nThis script has been tested with GHDL v.0.37\n"

# Compiling UVVM Util
echo "Compiling UVVM Utility Library..."
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/types_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/adaptations_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/string_methods_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/protected_types_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/global_signals_and_shared_variables_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/hierarchy_linked_list_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/alert_hierarchy_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/license_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/methods_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/bfm_common_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=uvvm_util ../../uvvm_util/src/uvvm_util_context.vhd

# Compiling Bitvis VIP SBI BFM
echo "Compiling Bitvis VIP SBI BFM..."
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=bitvis_vip_sbi ../../bitvis_vip_sbi/src/sbi_bfm_pkg.vhd

# Compiling Bitvis IRQC
echo "Compiling Bitvis IRQC..."
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=bitvis_irqc ../src/irqc_pif_pkg.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=bitvis_irqc ../src/irqc_pif.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=bitvis_irqc ../src/irqc_core.vhd
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=bitvis_irqc ../src/irqc.vhd

# Compiling demo TB
echo "Compiling IRQC demo TB..."
ghdl -a -frelaxed-rules --std=08 -Wno-hide -Wno-shared --work=bitvis_irqc ../tb/irqc_demo_tb.vhd

# Running simulations
echo "Starting simulations..."
ghdl -e -frelaxed-rules --std=08 --work=bitvis_irqc irqc_demo_tb
ghdl -r -frelaxed-rules --std=08 --work=bitvis_irqc irqc_demo_tb


