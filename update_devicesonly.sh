#!/bin/bash
PATH_PLUGIN_XML="TealiumDeviceOnly/plugin.xml"
PATH_FRAMEWORKS="TealiumDeviceOnly/src/ios/*.framework"

cp -R $PATH_FRAMEWORKS ./

rm -r TealiumDeviceOnly
cp -R Tealium TealiumDeviceOnly

rm -r $PATH_FRAMEWORKS
mv ./*.framework TealiumDeviceOnly/src/ios/
sed -i '' 's/TealiumIOS.framework/TealiumIOSDevicesOnly.framework/g' TealiumDeviceOnly/plugin.xml 
sed -i '' 's/TealiumIOSLifecycle.framework/TealiumIOSLifecycleDevicesOnly.framework/g' TealiumDeviceOnly/plugin.xml
sed -i '' 's/@import TealiumIOSLifecycle/@import TealiumIOSLifecycleDevicesOnly/g' TealiumDeviceOnly/src/ios/tealium_int.m

echo "Remember: Copy new deviceonly frameworks if updated into TealiumDeviceOnly dir\n"
echo "Remember: Update package.json if applicable"

 
