
# Flutter Savings Application

Welcome to the Flutter Savings Application! This app simplifies saving using MPESA, offering features similar to M-Shwari with the added flexibility of opening multiple lock saving accounts.

## Technologies Used
- **Flutter**: For building cross-platform mobile applications.
- **Firebase**: For backend services including authentication, database, and storage.
- **MPESA API**: For handling mobile money transactions.


## Features
- Create and manage multiple lock saving accounts.
- Seamless integration with MPESA for deposits and withdrawals.
- Real-time notifications and updates on savings.

## Screenshots
![homepage](https://github.com/josephwatunu123/MPESA-Saving-Application/assets/81553233/9206af96-e678-4c8d-9336-7aaf8980bafc)  ![creatgoal](https://github.com/josephwatunu123/MPESA-Saving-Application/assets/81553233/3f6965e5-c174-4e2b-80d9-9a926bfad632)

![singlgoal](https://github.com/josephwatunu123/MPESA-Saving-Application/assets/81553233/63cfc5f7-2729-4cd2-81e0-caeab227372a) ![savingscreen](https://github.com/josephwatunu123/MPESA-Saving-Application/assets/81553233/4f1dc0e3-9fa7-4c9c-b424-942f46826598) ![api](https://github.com/josephwatunu123/MPESA-Saving-Application/assets/81553233/7f4db591-81f2-4f73-8704-63349ca2cb84)
## Installation and Setup

### Prerequisites
- Flutter installed on your machine. [Get Flutter](https://flutter.dev/docs/get-started/install)
- Firebase project setup. [Firebase Console](https://console.firebase.google.com/)
- MPESA developer account for API access. [MPESA Developer Portal](https://developer.safaricom.co.ke/)

### Step-by-Step Guide

1. **Clone the Repository**
    ```bash
    git clone https://github.com/yourusername/flutter-savings-app.git
    cd flutter-savings-app
    ```

2. **Install Dependencies**
    ```bash
    flutter pub get
    ```

3. **Setup Firebase**

    - Go to the [Firebase Console](https://console.firebase.google.com/).
    - Create a new project or use an existing one.
    - Add an Android/iOS app to your Firebase project.
    - Download the `google-services.json` file for Android and/or `GoogleService-Info.plist` for iOS.
    - Place the `google-services.json` file in the `android/app` directory and the `GoogleService-Info.plist` in the `ios/Runner` directory.

    Update your `android/build.gradle` file:
    ```groovy
    dependencies {
        classpath 'com.google.gms:google-services:4.3.3'
    }
    ```

    Update your `android/app/build.gradle` file:
    ```groovy
    apply plugin: 'com.google.gms.google-services'
    ```

4. **Configure MPESA API**

    - Get your Consumer Key and Consumer Secret from the [MPESA Developer Portal](https://developer.safaricom.co.ke/).
    - Update the `lib/mpesa_config.dart` file with your credentials:
    ```dart
    class MpesaConfig {
        static const String consumerKey = 'YOUR_CONSUMER_KEY';
        static const String consumerSecret = 'YOUR_CONSUMER_SECRET';
        // Add other necessary configurations
    }
    ```

5. **Run the Application**
    ```bash
    flutter run
    ```

## Usage

1. **Sign Up / Log In**
   - Create a new account or log in using your existing credentials.

2. **Create a Lock Saving Account**
   - Navigate to the 'Savings' tab.
   - Click on 'Create New Account' and follow the instructions.

3. **Deposit / Withdraw Funds**
   - Use the integrated MPESA functionality to deposit or withdraw funds from your saving accounts.

## Contributing
We welcome contributions! Please follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For any queries or support, please reach out at [josephwatunu08@gmail.com](mailto:josephwatunu08@gmail.com).
