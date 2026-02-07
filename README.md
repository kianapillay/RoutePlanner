# Route Planner

## Overview
Route Planner is a simple application that allows users to store and manage routes by name, latitude, and longitude. 
The app includes logic for:  
Validation: Ensures route data is complete and correct (e.g. checking for missing or invalid coordinates). 
Optimization: Sorts routes or calculates best paths for efficiency.

Validation and optimization logic is handled within the `RouteProvider` and related service classes, keeping the core logic separate from the UI for maintainability and testability.

## Features 
Add,edit, and delete routes
Validate route input data
Optimize routes for effciency 
Clean seperation of business logic and UI

## Running the App
To run the app locally:

1. Make sure you have [Flutter](https://flutter.dev/docs/get-started/install) installed.  

2. Clone the repository:  
   ```bash
   git clone https://github.com/kianapillay/RoutePlanner.git

3. Navigate to the project folder:
    ```bash
    cd route_planner

    ````

4. Get dependencies 
    ```bash
    flutter pub get

    ```

5. Run the app:
    ```bash
    flutter run
    
    ```

## Running Tests
This project uses Flutter's built in testing framework. To run tests:
""flutter test""
All tests are located in the `test/` directory. Ensure your `RouteProvider` is properly initialized in tests to avoid `ProviderNotFoundException`.

## Architecture and Logic 
Validation and optimization logic live in the state layer (the provider), not in the UI. The UI only displays data and trigger actions, while the provider enforces rules, performs calculations, and updates the app’s state. By keeping logic like input validation and route optimization inside RouteProvider, it ensures that all data remains consistent, the code is easier to test, and business rules are centralised instead of being scattered across screens.