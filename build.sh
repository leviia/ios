for d in /usr/local/Cellar/*/*/bin
do
echo $d
export PATH="$PATH:$d"
done

function parse_env {
  originalfile=$1
  tmpfile=$(mktemp)
  cp -a $originalfile $tmpfile
  cat $originalfile | envsubst "$(printf '${%s} ' ${!leviia*})" > $tmpfile &&  mv $tmpfile $originalfile
}

rm -rf build/
git checkout iOSClient/
git checkout Nextcloud.xcodeproj/
git clean -f

hex="'#00BC73'"

export leviia_fred=$(python -c "import matplotlib.colors as colors; print(colors.hex2color($hex)[0])")
export leviia_fgreen=$(python -c "import matplotlib.colors as colors; print(colors.hex2color($hex)[1])")
export leviia_fblue=$(python -c "import matplotlib.colors as colors; print(colors.hex2color($hex)[2])")

export leviia_app_name=Leviia
export leviia_app_prefix=leviia
subname=client
export leviia_app_version="4.0.6"
export leviia_app_build_version="8"
#Ncloginweb compare the two to know if it should add login to url
#do not put the same base adress unless you love bugs
export leviia_app_domain_name=cloud.leviia.com
export leviia_app_ecommerce=https://www.leviia.com

if [[ $# > 0 ]]; then
echo "Building branding $1"
source ./brandings/$1/env.sh
./brandings/$1/env.sh
else
export leviia_icon_name=logo.svg
export leviia_intro_icon_name=intro1.svg
inkscape -w 40 -h 40 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon40@1x.png"
inkscape -w 60 -h 60 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon60@3x.png"
inkscape -w 29 -h 29 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon29@1x.png"
inkscape -w 58 -h 58 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon58@2x.png"
inkscape -w 87 -h 87 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon87@3x.png"
inkscape -w 80 -h 80 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon80@2x.png"
inkscape -w 120 -h 120 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon120@3x.png"
inkscape -w 57 -h 57 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon57@1x.png"
inkscape -w 114 -h 114 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon114@2x.png"
inkscape -w 120 -h 120 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon120@2x.png"
inkscape -w 180 -h 180 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon180@3x.png"
inkscape -w 20 -h 20 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon20@1x.png"
inkscape -w 40 -h 40 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon40@2x.png"
inkscape -w 29 -h 29 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon29@1x-1.png"
inkscape -w 58 -h 58 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon58@2x-1.png"
inkscape -w 40 -h 40 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon40@1x-1.png"
inkscape -w 80 -h 80 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon80@2x-1.png"
inkscape -w 50 -h 50 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon50@1x.png"
inkscape -w 72 -h 72 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon72@1x.png"
inkscape -w 144 -h 144 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon144@2x.png"
inkscape -w 76 -h 76 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon76@1x.png"
inkscape -w 152 -h 152 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon152@2x.png"
inkscape -w 167 -h 167 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon167@2x.png"
inkscape -w 1024 -h 1024 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon1024@1x.png"
inkscape -w 100 -h 100 "brandings/square.svg" -o "iOSClient/Brand/Custom.xcassets/AppIcon.appiconset/nextcloud-icon100@2x.png"
fi

export leviia_idb=com.$leviia_app_prefix.$subname

#group
parse_env Nextcloud.xcodeproj/project.pbxproj
parse_env Nextcloud.xcodeproj/xcshareddata/xcschemes/Share.xcscheme
parse_env iOSClient/Brand/File_Provider_Extension.entitlements
#app display name
parse_env iOSClient/Brand/iOSClient.plist
parse_env iOSClient/Brand/File_Provider_Extension.plist
parse_env iOSClient/Brand/Share.plist
#change color
parse_env iOSClient/Brand/LaunchScreen.storyboard
# bundle identifier for Nextcloud and extention
parse_env iOSClient/Brand/NCBrand.swift
parse_env iOSClient/Brand/Intro/NCIntroViewController.swift
parse_env iOSClient/Brand/Notification_Service_Extension.entitlements
parse_env iOSClient/Brand/Share.entitlements
parse_env iOSClient/Brand/iOSClient.entitlements
parse_env iOSClient/Brand/NCBridgeSwift.h
parse_env iOSClient/Main/NCFunctionCenter.swift
parse_env iOSClient/Login/NCLogin.storyboard

parse_env iOSClient/Brand/Intro/ImagesIntro.xcassets/intro1.imageset/Contents.json
parse_env iOSClient/Brand/Custom.xcassets/logo.imageset/Contents.json

#open in xcode for fetching
xcodebuild -resolvePackageDependencies

#install brew no root et ensuite carthage
carthage update --use-xcframeworks --platform iOS --cache-builds

curl https://raw.githubusercontent.com/firebase/quickstart-ios/master/mock-GoogleService-Info.plist --output GoogleService-Info.plist

mkdir build

# back to compilation
xcodebuild -scheme Nextcloud -allowProvisioningUpdates -sdk iphoneos -destination generic/platform=iOS -configuration Release DEVELOPMENT_TEAM=7S955PF2T8 -archivePath build/app.xcarchive archive

xcodebuild -allowProvisioningUpdates -exportArchive -archivePath build/app.xcarchive -exportPath build -exportOptionsPlist exportOptions.plist
