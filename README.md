# weather_forecast_app_flutter

## Permissions for Flutter Geolocator Plugin
To add the geolocator to your Flutter application read the install instructions. Below are some Android and iOS specifics that are required for the geolocator to work correctly.
Permissions

### On Android you'll need to add either the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission to your Android Manifest. To do so open the AndroidManifest.xml file (located under android/app/src/main) and add one of the following two lines as direct children of the <manifest> tag (when you configure both permissions the ACCESS_FINE_LOCATION will be used by the geolocator plugin):
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
## Here You are all screens of app
### Launch Screen
![loading](https://github.com/user-attachments/assets/fbc9f4c8-f798-4b6d-b5e9-726caaf48dad)
### Loading Screen
![loading](https://github.com/user-attachments/assets/4ac9bd11-0b40-4750-9a84-dacc7cbe8ce5)

### Home Screen
![home](https://github.com/user-attachments/assets/65e6eefb-e50e-40f2-810a-38b40dfcbd45)

### Drawer Screen
![drawer](https://github.com/user-attachments/assets/f04ccb7f-10f5-4b67-8a77-769df4e1567b)

### Hourly Screen
![hours](https://github.com/user-attachments/assets/d4a70fd9-703e-4db0-a167-2ddf5d81b198)

### Daily Screen
![days](https://github.com/user-attachments/assets/c0372e3c-2371-44fa-b3e7-b4d6718392bd)

### Cities Screen
![cities](https://github.com/user-attachments/assets/b531592b-d926-4a9c-8390-0a94dbfd03d1)

### City Screen
![city_info](https://github.com/user-attachments/assets/2fef85e2-760e-41b7-9ed1-b32c5aef4cba)

