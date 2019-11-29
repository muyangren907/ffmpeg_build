# ffmpeg_build

- OS  Ubuntu18.04
- CUDA 10.2

安装CUDA 10.2


```bash
wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
sudo sh cuda_10.2.89_440.33.01_linux.run
```

运行脚本

```bash
chmod +x fb.sh && ./fb.sh
```

- 查看支持的硬件加速选项

> ffmpeg -hwaccels

若在 `Hardware acceleration methods:`下方出现`cuda`则为支持GPU加速

- 查看GPU编解码器

> ffmpeg -codecs | grep cuvid

用GPU进行转码的命令和软转码命令不太一样，CPU转码的时候，我们可以依赖ffmpeg识别输入视频的编码格式并选择对应的解码器，但ffmpeg只会自动选择CPU解码器，要让ffmpeg使用GPU解码器，必须先用ffprobe识别出输入视频的编码格式，然后在命令行中指定对应的GPU解码器。

- 示例 用h264解码 h265 编码

> ffmpeg -hwaccel cuvid -c:v h264_cuvid -i <input> -c:v nvenc_hevc -b:v 6000k -y <output>
  
-hwaccel cuvid：指定使用cuvid硬件加速
-c:v h264_cuvid：使用h264_cuvid进行视频解码
-c:v nvenc_hevc：使用nvenc_hevc进行视频编码

若需要改变视频分辨率
-vf scale_npp=1280:-1：指定输出视频的宽高，-1是为了保持原分辨率比例，注意，这里和软解码时使用的-vf scale=x:x不一样
