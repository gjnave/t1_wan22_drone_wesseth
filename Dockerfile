FROM runpod/worker-comfyui:5.5.1-base

RUN comfy-node-install rgthree-comfy
RUN comfy-node-install comfyui-videohelpersuite
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

RUN comfy model download \
 --url https://huggingface.co/Phr00t/WAN2.2-14B-Rapid-AllInOne/resolve/main/wan2.2-i2v-rapid-aio.safetensors \
 --relative-path models/checkpoints \
 --filename wan2.2-rapid-mega-aio-v9.safetensors
RUN comfy model download \
 --url https://huggingface.co/UnifiedHorusRA/DroneShot-Wan2.2_2.1-I2V-A14B/resolve/main/wan22-video8-drone-16-sel-2.safetensors \
 --relative-path models/loras \
 --filename wan22-video8-drone-16-sel-2.safetensors
