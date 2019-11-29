sudo apt-get update
sudo apt-get install yasm
sudo apt-get -y install autoconf automake build-essential libass-dev libfreetype6-dev libsdl2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev
sudo apt-get install libx264-dev
sudo apt-get install libx265-dev
sudo apt-get install libvpx-dev
sudo apt-get install libfdk-aac-dev
sudo apt-get install libmp3lame-dev
sudo apt-get install libopus-dev
sudo apt-get -y install glew-utils libglew-dbg libglew-dev libglew1.13 \
libglewmx-dev libglewmx-dbg freeglut3 freeglut3-dev freeglut3-dbg libghc-glut-dev libghc-glut-doc libghc-glut-prof libalut-dev libxmu-dev libxmu-headers libxmu6 libxmu6-dbg libxmuu-dev libxmuu1 libxmuu1-dbg
git clone https://git.ffmpeg.org/ffmpeg.git
# git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
wget "https://github.com/FFmpeg/nv-codec-headers/archive/n9.0.18.3.tar.gz"
tar xzvf n9.0.18.3.tar.gz
cd nv-codec-headers-n9.0.18.3
#cd nv-codec-headers
make
sudo make install
cd ..
cd ffmpeg
./configure --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree --enable-libnpp --extra-cflags=-I/usr/local/cuda-10.1/include --extra-ldflags=-L/usr/local/cuda-10.1/lib64
make -j 10
cp ffmpeg /usr/bin
cp ffplay /usr/bin
cp ffprobe /usr/bin
cd ..
ffmpeg -hwaccels
