# Clone Upstream
git clone https://github.com/Plagman/gamescope
cp -rvf ./debian ./gamescope
cd ./gamescope
git submodule update --init
# Get build deps
apt-get update -y
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p gamescope_3.12.5-rc
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
