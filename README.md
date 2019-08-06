# iOS Photo App Challenge
Coding Challenge: A mobile app that captures, stores and displays photos

## Build Instructions
The app has been developed in Xcode 10.3 using Swift 5 with a deployment target of iOS 12.0. No external dependencies are required. Simply run the Photo Challenge target in Xcode on an iPhone or iPad running iOS 12.0 or later. Please note that iOS simulators do not support camera operations.

## Development Approach
I started working on this take home test by separating the task description into small issues. These issues filled up a simple [Kanban board](https://github.com/easytargetmixel/ios-photo-app-challenge/projects/1), along with my initial thoughts and ideas in the issue descriptions. 

The first task, "Start menu" acts as the starting point for the project, as well as, a connecting point for the two main features of the app, capturing photos and displaying previously taken photos. Issue #1 can be seen as the most basic requirement: build an app that displays two options to the user. It is the framework for all other features and implementations.

The project structure is driven by functionality topics, rather than technological layers. Files and classes related to one topic, e.g. capturing a photo, belong together. This is reflected in the directories and helps modularising the app.
Example: "StartMenu -> PhotoGallery -> PhotoGalleryElementDetails" describes both a directory structure and a user journey.

## Possible Improvements

During the initial project phase and as I made progress, I identified several additional features and potential improvements. Whenever I have an idea during the development process, I try to turn it into a full-fledged issue. Not only does this ensure that ideas do not get lost, it also acts as a kind of filter. Adding a short issue description and prioritising an issue helps determining the feasibility of a feature. Additional features and potential changes can be found in the [Issues Section](https://github.com/easytargetmixel/ios-photo-app-challenge/issues).
