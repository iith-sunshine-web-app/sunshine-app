## This is official ***Sunshine***, IIT Hyderabad mobile app's repo

### [Install](https://play.google.com/store/apps/details?id=com.sunshine.iith) the app from Google Play Store

## Features
- **Session Booking:** Book a session with the counsellors
- **Team:** Get details of *Sunshine* current team
- **Chatbot:** Interact with our chatbot 

## Tech Stack
- **Flutter:** The app is built using Flutter.
- **Firebase:** Used firebase for ***Auth*** and ***Database*** 
- **Dialogflow:** for Chatbot

### Run Locally

1. Clone the repository to your local machine.
   ```bash
   git clone https://github.com/bhaskaraa45/sunshine-iith/
   ```
2. Navigate to the Flutter project directory.   
   ```bash
   cd sunshine-iith
   ```
3. Run the Flutter app locally on your device.
   ```bash
   flutter run
   ```

### For Sunshine Developers
- Open Firebase [console](https://console.firebase.google.com/), login with [ug.sunshine@campus.iith.ac.in](mailto:ug.sunshine@campus.iith.ac.in)
- go to *Storage* and delete the old team member's images and add new ones (try to minimize the size (<40kb))
- then open *Firestore*, there you change the data, you can add/remove member/branch also, ***DO NOT CHANGE FILEDS*** *(i.e.- name, email ,image, phone, position)* 
- **No change required in RTDB**
- Place the `keystores` @ `.../android/app/`
- `google-services.json` @ `.../android/app/`
- `key.properties` @ `.../android/`
- `service.json` @ `.../assets/`

#### To get these files [contact me](mailto:bhaskaraa45@duck.com) or [ug.sunshine@campus.iith.ac.in](mailto:ug.sunshine@campus.iith.ac.in)
