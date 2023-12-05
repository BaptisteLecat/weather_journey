GitHub Actions for Flutter apps Documentation

## Ressources

- [Fastlane find the Apple Teams IDS](https://sarunw.com/posts/fastlane-find-team-id/)
- [Fastlane AppStore Connect Auth documentation](https://docs.fastlane.tools/app-store-connect-api/)
- [Fastlane Match documentation](https://docs.fastlane.tools/actions/match/)

## Secrets

| Name | Description | Where to get it |
|------|-------------| --------------- |
APPLE_AUTH_ISSUER_ID | Use the value of the issuer ID from the Apple Developer Portal, it will be used to generate the JWT token for Fastlane | Create a new key in the Apple Developer Portal in User Access |
APPLE_AUTH_KEY_FILENAME | Name of the stored file in the Google Cloud Storage, it will be used to generate the JWT token for Fastlane | The name of this file has to be AuthKey-env.p8 |
APPLE_AUTH_KEY_ID | Use the value of the key ID from the Apple Developer Portal, it will be used to generate the JWT token for Fastlane | Create a new key in the Apple Developer Portal in User Access |
APPLE_AUTH_KEY_PATH | Use the value of the key path to access the key file and generate the JWT token for Fastlane | The relative path to the key file usually in IOS folder so it's just ./APPLE_AUTH_KEY_FILENAME |
APPLE_DEVELOPER_USERNAME | This is the Apple Developer Portal username, it will be queried by Fastlane | Find it in the Apple Developer Portal in Membership |
APP_STORE_CONNECT_TEAM_ID | This is the App Store Connect Team ID, it will be used to upload the app to the App Store Connect | Find it with thanks to the ressources above |
DEVELOPER_APP_IDENTIFIER | This is the app identifier, it's a unique string used to identify the app in the Apple Developer Portal | Defined in the app's files |
DEVELOPER_PORTAL_TEAM_ID | This is the Apple Developer Portal Team ID, it's needed by Fastlane | Find it in the Apple Developer Portal in Membership |
FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD | This is the Apple Application Specific Password, it's needed by Fastlane to upload the app to the App Store Connect |Defined by the user in the Apple Developer Portal |
FASTLANE_APPLE_ID | This is the Apple ID, it's needed by Fastlane to upload the app to the App Store Connect | Defined by the user in the Apple Developer Portal, same as the username |
FIREBASE_TOKEN | This is the Firebase token, it will be used to generate a configuration file for the app | Firebase token you can get by running firebase login:ci |
GCP_SERVICE_ACCOUNT_KEY | This is the Google Cloud Platform service account key, it will be used to authenticate with Google Cloud Platform | Create a new service account in the Google Cloud Platform and drop the JSON Key content |
GOOGLE_CLOUD_BUCKET_NAME | This is the Google Cloud Storage bucket name, it will be used to get the Fastlane's match certificates | Create a new bucket in the Google Cloud Platform it will store the AuthKeys and the gc_keys and the match certificates |
GOOGLE_CLOUD_KEY_FILENAME | This is the Google Cloud Storage file patch, it will be used to get the Fastlane's match certificates | The name of the service account key file will be downloaded from the bucket and used in the CI usually gc_key_env.json |
GOOGLE_CLOUD_PROJECT_ID | This is the Google Cloud Platform project ID, it will be used to get the Fastlane's match certificates | Find it in the Google Cloud Platform |
KEY_ALIAS | This is the key alias of the keystore, it will be used to sign the android app | Defined by the user in the Android Studio |
KEY_BASE_64 | This is the base64 encoded keystore, it will be used to sign the android app | Defined by the user in the Android Studio |
KEY_PASSWORD | This is the key password of the keystore, it will be used to sign the android app | Defined by the user in the Android Studio |
MATCH_KEYCHAIN_PASSWORD | This is the keychain password, it will be used to get the Fastlane's match certificates | Defined by the user in the Fastlane's match certificates |
PLAYSTORE_SERVICE_ACCOUNT_BASE_64 | This is the base64 encoded Google Play Store service account, it will be used to upload the app to the Google Play Store | Create a new service account in the Google Play Console |
STORE_PASSWORD | This is the store password of the keystore, it will be used to sign the android app | Defined by the user in the Android Studio |
