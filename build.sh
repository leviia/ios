function parse_env {
  originalfile=$1
  tmpfile=$(mktemp)
  cp -a $originalfile $tmpfile
  cat $originalfile | /Users/user202752/Documents/homebrew/bin/envsubst "$(printf '${%s} ' ${!leviia*})" > $tmpfile &&  mv $tmpfile $originalfile
}

hex="'#00BC73'"

export leviia_fred=$(python -c "import matplotlib.colors as colors; print(colors.hex2color($hex)[0])")
export leviia_fgreen=$(python -c "import matplotlib.colors as colors; print(colors.hex2color($hex)[1])")
export leviia_fblue=$(python -c "import matplotlib.colors as colors; print(colors.hex2color($hex)[2])")

export leviia_app_name=Leviia
export leviia_app_prefix=leviia
subname=client
export leviia_app_version="4.0.5"
export leviia_app_build_version="5"
#Ncloginweb compare the two to know if it should add login to url
#do not put the same base adress unless you love bugs
export leviia_app_domain_name=cloud.leviia.com
export leviia_app_ecommerce=https://www.leviia.com
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


#open in xcode for fetching
xcodebuild -resolvePackageDependencies

#install brew no root et ensuite carthage
/Users/user202752/Documents/homebrew/bin/carthage update --use-xcframeworks --platform iOS --cache-builds

curl https://raw.githubusercontent.com/firebase/quickstart-ios/master/mock-GoogleService-Info.plist --output GoogleService-Info.plist

mkdir build

# back to compilation
xcodebuild -scheme Nextcloud -allowProvisioningUpdates -sdk iphoneos -destination generic/platform=iOS -configuration Release DEVELOPMENT_TEAM=7S955PF2T8 -archivePath build/app.xcarchive archive

xcodebuild -allowProvisioningUpdates -exportArchive -archivePath build/app.xcarchive -exportPath build -exportOptionsPlist exportOptions.plist
