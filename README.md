# Assignment: Mobille App Coding Challenge: Lock Settings Configuration

Mobile development framework used for this challenge is Flutter. All the code written by me is located in the lib directory of a project.

Note: The app was tested only on Android emulator (Windows OS). Since it is using SQLite database, the app itself will not work on the web.

## Running the project

First insure that the Flutter SDK is installed on your computer. See the instructions [here](https://docs.flutter.dev/get-started/install/).

After that check on the terminal that the setup is complete and that all the components are there with the command:

`flutter doctor`

Then open the Android emulator via Android Studio or the terminal command. In the root project directory run the following command to build and run the debug version of the app:

`flutter run`

## Overview

The app starts with main.dart file and consists of two screens: HomeScreen and EditScreen.
HomeScreen is responsible for displaying the list of data and filtering while EditScreen is providing user with input fields and two action buttons.

For the simple state management I used the provider pattern. The data displayed is accessed by the screens through responsible providers and the flow goes both ways. On startup when the Home screen is initialized, the app checks if the data is already stored in the offline database. If there are no items, then the app gets the latest data through the API call.
Since the edit screen should not change the data from the list directly, it uses its own provider to change the primary and secondary values. On the save button click, these two values are then stored in our database and the changes are also reflected on the home screen.

Most of the thinking process was done on the beginning. Which type of input fields should I use for the configuration data? Radio buttons, text fields or slider? How should I store the data? Using key-value storage such as shared preferences or a database like SQLite. At the end I chose the simple database for offline storing using the sqflite plugin.

## Authorship
All the code in the lib directory was written by Mitja Dietner.
If you have any questions, feel free to contact me at mitja.dietner (at) gmail.com.