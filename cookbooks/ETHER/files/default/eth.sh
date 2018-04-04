#!/bin/bash
export DISPLAY=:0
# Since all my cards are the same, I'm happy with using the same Memory Transfer Rate Offset
memoryOffset=2000

# Enable nvidia-smi settings so they are persistent the whole time the system is on.
echo "nvidia-smi pm setting 1"
nvidia-smi -pm 0

# Set the power limit for each card (note this value is in watts, not percent!
echo "nvidia-smi -i and pl setting 100"
nvidia-smi -i 0 -pl 200

## Apply overclocking settings to each GPU
#nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1

echo "nvidia-settings -a GPU memory transfer rate offset 1450"
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffset[3]=$memoryOffset

echo "nvidia-settings -a GPU Graphics Clock Offset 100"
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 nvidia-settings -a [gpu:0]/GPUGraphicsClockOffset[3]=100

echo "executing claymore ethminer"
/home/ubuntu/ethereum/ethdcrminer64 -epool eth-us-east1.nanopool.org:9999 -ewal ethereum_address/server/someone@gmail.com -epsw x -mode 1 -ftime 10?