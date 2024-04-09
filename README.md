# Weather Journey

Weather Journey is more than just another weather app; it's a dynamic visualization tool designed to make weather forecasts come alive. Showcasing the power of AI to elevate basic applications, this app is a testament to the fusion of weather data, AI-powered prompts, and real-time image generation.

As an enthusiast and student of AI, mobile development, and cloud computing, this project offers an amalgamation of all these elements, serving as a personal exploration into their combined capabilities.

![App Onboarding](/.github/assets/app_onboard.png?raw=true "App Onboarding")

## Available on the App Store and Play Store

<a href="https://apps.apple.com/us/app/weather-journey/id1597876360"><img src="/.github/assets/app-store.png" alt="App Store" width="80"/></a>
<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
<a href="https://play.google.com/store/apps/details?id=com.baptistelecat.weatherjourney&pcampaignid=web_share"><img src="/.github/assets/google-play.png" alt="Play Store" width="80"/></a>

## Technology Stack

- Mobile App: Developed using Flutter (version 3.10).
- Backend: NestJS powers the API, which interacts with ChatGPT for prompt generation and MidJourney through a Discord bot integration.
- Hosting: Infrastructure hosted on Google Cloud Run.
- Authentication & Data Storage: Firebase Auth for authentication and Firestore for data storage.

## Features

- Dynamic Weather Visualizations: See real-time weather forecasts as never before with AI-generated images tailored to each forecast.
- AI-Powered: Leveraging the prowess of ChatGPT for textual prompts and MidJourney for generating imagery.
- Multi-Platform: Available on both App Store and Play Store.

## Automated Deployment

As you know my app is available on IOS and Android. So I have to deploy it on the App Store and Google Play Store. I use Fastlane to automate the deployment process.
Because I want to learn more about the way to do it well, I started learning the Github Workflow and Github Actions. I have a dedicated workflow for the deployment of my app.

### The Workflow

Basically I have 2 branches in my repository:
-**main** : This is the branch where the current version of the app is available. It's the production branch.
-**develop** : This is the branch where I work on the app. It's the development branch.

To start working on a new feature, I create a new branch from the develop branch. When the feature is done, I merge the branch into the develop branch. A Github Action is triggered when a new commit is pushed to the develop branch. This action will run the tests to ensure that the app is working well.

When I want to deploy a new version of the app, I have to create a new release on Github. I have a dedicated script to do it. This script will create a new tag with the version number by using a semantic versioning system, thanks to semver Github Action. Then it will create a new release with the tag. The Github Action will be triggered when a new release is created. This action will build the app and deploy it on the App Store and Google Play Store in BETA / INTERNAL TESTING mode.

After that a Pull Request is created to merge the release branch into the main branch. This PR will trigger a new Github Action to deploy the app on the App Store and Google Play Store in PRODUCTION mode.

You can find the Github Actions in the **`.github/workflows`** folder. And a documentation about the CI/CD Setup in the **`.github/cicd_setup.md`** file.

## Getting Started

### Prerequisites
Flutter SDK (Version 3.10)
A functioning environment for Flutter development.

#### Setup Instructions
Clone the repository:
```
git clone
```
Navigate to the project directory:
```
cd weather-journey
```

Install dependencies:
```
flutter pub get
```

Run the app:
```
flutter run
```