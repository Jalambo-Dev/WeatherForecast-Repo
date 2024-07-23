# Weather Forecast App

## Permissions for Flutter Geolocator Plugin
To add the geolocator to your Flutter application read the install instructions. Below are some Android and iOS specifics that are required for the geolocator to work correctly.
Permissions

### On Android 
you'll need to add either the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission to your Android Manifest. To do so open the AndroidManifest.xml file (located under android/app/src/main) and add one of the following two lines as direct children of the <manifest> tag (when you configure both permissions the ACCESS_FINE_LOCATION will be used by the geolocator plugin):
   
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

### On iOS 
you'll need to add the following entry to your Info.plist file (located under ios/Runner) in order to access the device's location. Simply open your Info.plist file and add the following (make sure you update the description so it is meaningfull in the context of your App):
   
    <key>NSLocationWhenInUseUsageDescription</key>
	<string>This app needs access to location when open.</string>

## Here You are all screens of app
### Launch Screen | Loading Screen | Home Screen | Drawer Screen

<p float="left">
    <img src="https://github.com/user-attachments/assets/0ab0e880-514b-4e2e-8577-42148915e6e0" alt="Launch Screen" width="200" height="auto">
    <img src="https://github.com/user-attachments/assets/4ac9bd11-0b40-4750-9a84-dacc7cbe8ce5" alt="Loading Screen" width="200" height="auto">
    <img src="https://github.com/user-attachments/assets/65e6eefb-e50e-40f2-810a-38b40dfcbd45" alt="Home Screen" width="200" height="auto">
    <img src="https://github.com/user-attachments/assets/f04ccb7f-10f5-4b67-8a77-769df4e1567b" alt="Drawer Screen" width="200" height="auto">
</p>

### Hourly Screen | Daily Screen | Cities Screen | City Screen

<p float="left">
    <img src="https://github.com/user-attachments/assets/d4a70fd9-703e-4db0-a167-2ddf5d81b198" alt="Hourly Screen" width="200" height="auto">
    <img src="https://github.com/user-attachments/assets/c0372e3c-2371-44fa-b3e7-b4d6718392bd" alt="Daily Screen" width="200" height="auto">
    <img src="https://github.com/user-attachments/assets/b531592b-d926-4a9c-8390-0a94dbfd03d1" alt="Cities Screen" width="200" height="auto">
    <img src="https://github.com/user-attachments/assets/2fef85e2-760e-41b7-9ed1-b32c5aef4cba" alt="City Screen" width="200" height="auto">
</p>
