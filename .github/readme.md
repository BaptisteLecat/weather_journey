Tab of all the secrets of the CI/CD pipeline environment

## Secrets

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
APPLE_AUTH_ISSUER_ID | Use the value of the issuer ID from the Apple Developer Portal, it will be used to generate the JWT token for Fastlane | `string` | yes |
APPLE_AUTH_KEY_ID | Use the value of the key ID from the Apple Developer Portal, it will be used to generate the JWT token for Fastlane | `string` | yes |
APPLE_AUTH_KEY_PATH | Use the value of the key path to access the key file and generate the JWT token for Fastlane | `string` | yes |
APPLE_DEVELOPER_USERNAME | This is the Apple Developer Portal username, it will be queried by Fastlane | `string` | yes |
APP_STORE_CONNECT_TEAM_ID | This is the App Store Connect Team ID, it will be used to upload the app to the App Store Connect | `string` | yes |
DEVELOPER_APP_IDENTIFIER | This is the app identifier, it's a unique string used to identify the app in the Apple Developer Portal | `string` | yes |
DEVELOPER_PORTAL_TEAM_ID | This is the Apple Developer Portal Team ID, it's needed by Fastlane | `string` | yes |
FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD | This is the Apple Application Specific Password, it's needed by Fastlane to upload the app to the App Store Connect | `string` | yes |
FASTLANE_APPLE_ID | This is the Apple ID, it's needed by Fastlane to upload the app to the App Store Connect | `string` | yes |
FIREBASE_TOKEN | This is the Firebase token, it will be used to generate a configuration file for the app | `string` | yes |
GCP_SERVICE_ACCOUNT_KEY | This is the Google Cloud Platform service account key, it will be used to authenticate with Google Cloud Platform | `string` | yes |
GOOGLE_CLOUD_BUCKET_NAME | This is the Google Cloud Storage bucket name, it will be used to get the Fastlane's match certificates | `string` | yes |
GOOGLE_CLOUD_KEY_FILENAME | This is the Google Cloud Storage file patch, it will be used to get the Fastlane's match certificates | `string` | yes |
GOOGLE_CLOUD_PROJECT_ID | This is the Google Cloud Platform project ID, it will be used to get the Fastlane's match certificates | `string` | yes |
KEY_ALIAS | This is the key alias of the keystore, it will be used to sign the android app | `string` | yes |
KEY_BASE_64 | This is the base64 encoded keystore, it will be used to sign the android app | `string` | yes |
KEY_PASSWORD | This is the key password of the keystore, it will be used to sign the android app | `string` | yes |
MATCH_KEYCHAIN_PASSWORD | This is the keychain password, it will be used to get the Fastlane's match certificates | `string` | yes |
PLAYSTORE_SERVICE_ACCOUNT_BASE_64 | This is the base64 encoded Google Play Store service account, it will be used to upload the app to the Google Play Store | `string` | yes |
STORE_PASSWORD | This is the store password of the keystore, it will be used to sign the android app | `string` | yes |
WIP_EMAIL | This is the email of the WIP account, it will be used to access to the GCP project | `string` | yes |
WORKLOAD_IDENTITY_PROVIDER_ID | This is the workload identity provider ID, it will be used to access to the GCP project | `string` | yes |

## Outputs