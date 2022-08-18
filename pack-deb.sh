#make
mkdir -p godot_3.5_amd64/usr/bin
mkdir -p godot_3.5_amd64/usr/share/applications
mkdir -p godot_3.5_amd64/usr/share/pixmaps
mkdir -p godot_3.5_amd64/etc/skel/.config/godot

curl --location --write-out "%{url_effective}\n" "https://github.com/godotengine/godot/releases/download/3.5-stable/Godot_v3.5-stable_x11.64.zip" -o godot_3.5_amd64.zip
unzip godot_3.5_amd64.zip -d ./godot_3.5_amd64/usr/bin
cp ./pack-files/godot.desktop godot_3.5_amd64/usr/share/applications
cp ./pack-files/Godot_icon.svg godot_3.5_amd64/usr/share/pixmaps
cp ./pack-files/editor_settings-3.tres godot_3.5_amd64/etc/skel/.config/godot

mkdir -p godot_3.5_amd64/DEBIAN
filename="./godot_3.5_amd64/DEBIAN/control"

rm -f $filename
touch godot_3.5_amd64/DEBIAN/control

echo "Package: godot" >> $filename
echo "Version: 3.5" >> $filename
echo "Architecture: amd64" >> $filename
echo "Maintainer: Juan Linietsky, Ariel Manzur and the Godot community" >> $filename
echo "Description: Godot Game Engine" >> $filename

dpkg-deb --build --root-owner-group godot_3.5_amd64
dpkg-name godot_3.5_amd64.deb