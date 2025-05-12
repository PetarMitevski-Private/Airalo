# Airalo App
This repository contains my submission for the iOS Developer position at Airalo. The project demonstrates my proficiency in modern iOS development, focusing on clean architecture, modular design, and best coding practices.

# Overview
The Airalo app is a Swift-based iOS application that simulates key functionalities to original Airalo App. It emphasizes scalability, maintainability, and testability, adhering to industry standards and leveraging modern development tools.

# Architecture
The application is structured using the Clean Architecture and the Model-View-ViewModel (MVVM) pattern, promoting a clear separation of concerns. This architecture facilitates easier testing and enhances code readability.

### Key Components:
* DataModels: Define the data structures

* Models: Define the business logic.

* ViewModels: Handle the presentation logic and prepare data for the views.

* Interactors: Handles communication between the Model and the ViewModels. Takes back actions from View to Model.

* Views: Responsible for the user interface and user interactions.

### Project Structure
The project is organized into the following directories:

* Airalo/DataModel/ – Contains data models representing the application's entities.
  
* Airalo/Dependencies/ – Contains dependencies like NetworkingService and Dependency Declarations.

* Airalo/Model/ – Contains model representing the application's business logic and handles Events from Views.

* Airalo/Services/ – Contains Services implementations.

* Airalo/UI/Views – Houses the UI components and view controllers.

* Airalo/UI/ViewModels/ – Includes view models that manage the presentation logic.

* Airalo/UI/Interactors/ – Includes Interactors that handle communication between the Model and the View Models.

* Airalo/UI/ViewState/ – Includes states that are representing the view state (loading, loaded, error)

* Airalo/Resources/ – Contains assets

This modular structure ensures that each component has a single responsibility, making the codebase more maintainable and scalable.

### Packages:
The project contains two additional packages:

* AiraloUtils: A package that is responsible for handling the util types that can be used anywhere across the app.
  
* AiraloUIFoundations: A package that has all the UI foundations, fonts, views extensions, etc..

Those packages show the ability an app to be separated into dedicated libraries. Hosting those packages in separate repositories will allow them to be used across other apps from Airalo. 

### Technologies Used
* Swift 6.1 – The primary programming language.

* SwiftUI – For building the user interface.

* Combine – For handling asynchronous events and data binding.

* XCTest & Swift Testing – For unit testing the application's components.

# Getting Started
To run the project locally:

Clone the repository:

```
git clone https://github.com/PetarMitevski-Private/Airalo.git
```

Open the project:

```
cd Airalo
open Airalo.xcworkspace
```
### Build and run:

Select the desired simulator or device and press Cmd + R to build and run the application.

# Features Implemented
### User Story
<img width="644" alt="Screenshot 2025-05-12 at 03 00 20" src="https://github.com/user-attachments/assets/c8096db1-ca4e-4ac1-a973-e7b39fe23caa" />

### Screenshots
|Country Select|Sample Country|Sample Country|Sample Country|
|---|---|---|---|
|![Simulator Screenshot - iPhone 16 Pro - 2025-05-12 at 02 57 55](https://github.com/user-attachments/assets/f9d4f879-e795-457e-8984-14ef4e30ee29)|![Simulator Screenshot - iPhone 16 Pro - 2025-05-12 at 02 58 38](https://github.com/user-attachments/assets/02cf0737-6824-4548-9da9-9d300cfa2756)|![Simulator Screenshot - iPhone 16 Pro - 2025-05-12 at 02 58 46](https://github.com/user-attachments/assets/915142ad-381a-49ab-9741-2567690660dc)|![Simulator Screenshot - iPhone 16 Pro - 2025-05-12 at 02 58 52](https://github.com/user-attachments/assets/4ebd9894-cb04-4b82-b3ed-3d215e15135c)|

