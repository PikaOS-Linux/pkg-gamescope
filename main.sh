# Clone Upstream
git clone https://github.com/Plagman/gamescope -b 3.12.0-beta10
cp -rvf ./debian ./gamescope
cd ./gamescope

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p gamescope_3.12.0-beta10
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
