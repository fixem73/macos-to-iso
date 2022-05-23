# Run sudo chmod a+x BigSur_to_iso.sh
# Run the script by typing ./BigSur_to_iso.sh in the terminal
echo "⚠️   During the run of this script, please don't close the terminal or press any keys!\n\n"
echo "📀 Cleaning any of the previous fails of this script..."
sudo rm -rf /tmp/BigSur.dmg
echo "✅ Cleanup complete"

echo "📀 Creating temporary .dmg file. It might take a minute or two..."
hdiutil create -o /tmp/BigSur -size 15000m -layout SPUD -fs HFS+J
echo "✅ Creation complete"

echo "🔮 Mounting and doing magic to the volumes. It might take a while..."
hdiutil attach /tmp/BigSur.dmg -noverify -mountpoint /Volumes/install_build
yes Y | sudo /Applications/Install\ macOS\ BigSur.app/Contents/Resources/createinstallmedia --volume /Volumes/install_build
echo "✅ Magic complete"

echo "📀 Detaching volume..."
hdiutil detach /Volumes/Install\ macOS\ BigSur
echo "✅ Volume detached"

echo "📀 Image created! Converting the image..."
hdiutil convert /tmp/BigSur.dmg -format UDTO -o ~/Downloads/BigSur
echo "✅ Conversion complete"

echo "📀 Creating .ISO file..."
mkdir ~/Downloads/ISO
sudo mv ~/Downloads/BigSur.cdr ~/Downloads/ISO/BigSur.iso
echo "✅ Created"

echo "📀 Cleaning temporary stuff..."
sudo rm -rf /tmp/BigSur.dmg
echo "✅ Cleanup complete"

echo "✅ Done !"
open ~/Downloads/ISO