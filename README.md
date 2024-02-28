# afsbot

This is a Flutter-based Chatgpt App with a sleek and modern design using Firebase as database.

## Installations

To get started, you need to have [Flutter](https://docs.flutter.dev/get-started/install) installed on your machine. Then, follow the instructions below:

- Open the terminal and navigate to the project folder.
- Run the command flutter packages get to install the required packages.
- Run flutter run to build and run the debug app on your emulator/phone.

### Configuration
Signup or login to firebase account and create a new project. Be sure to choose device types for your project.

For firestore firebase, add the following rules:
```flutter
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
  
    // Allow read and write access to the "users" collection
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }

    // Allow read and write access to the "prompts"
    match /users/{userId}/prompts/{promptId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

# License
Distributed under the MIT License.

# Contact
- Brilliant Kwakye - https://twitter.com/kwakyebrilliant
