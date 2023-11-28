# StateKit

This package provides tools to manage state transitions, validation, and branching logic, making it easier to handle different application states and their behaviors.

### Key features

- **Per State Validation**: StateKit follows a self-contained approach where each state validates itself. This ensures that your validation logic remains focused and specific to each state.
- **Branching Logic**: With StateKit, you can easily determine the next state from a given state. This feature is valuable for creating complex branching scenarios, such as A/B testing or conditional transitions.
- **Observability**: StateKit provides built-in observability, allowing you to seamlessly observe state changes and respond to them.


# Installation

### Requirements

- Swift 5.9
- iOS: 13.0 and above
- watchOS: 6.0 and above
- tvOS: 13.0 and above
- macOS (Catalyst): 13.0 and above
- macOS: 10.15 and above

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/bpisano/state-kit", .upToNextMajor(from: "1.0.0"))
]
```

# Quick start

**1. Define your states**: States are defined as enums conforming to the `State` protocol.

```swift
enum AppState: State {
    case onboarding
    case setup
    case authentication
    case app
}
```

**2. Create validators**: Validators determine state validity and specify the next state. They conform to the `Validator` protocol.

```swift
final class AuthenticationValidator: Validator {
    let state: AppState = .authentication
    let nextState: AppState = .app
    var shouldPerformValidation: PassthroughSubject<Void, Never> = .init()
    
    var isValid: Bool {
        userManager.currentUser != nil
    }

    private let userManager: UserManager
    private var cancellableSubscribers: Set<AnyCancellable> = []

    init(userManager: UserManager) {
        self.userManager = userManager
        observeCurrentUser()
    }

    private func observeCurrentUser() {
        userManager.$currentUser
            .sink { [weak self] in
                // Trigger validation when state needs to be re-evaluated
                self?.shouldPerformValidation.send()
            }
            .store(in: &cancellableSubscribers)
    }
}
```

**3. Initialize the StateValidator**: The `StateValidator` class manages state transitions based on validators. It requires an initial state and a list of validators.

```swift
let stateValidator: StateValidator<AppState> = StateValidator(initialState: .onboarding) {
    OnboardingValidator()
    AuthenticationValidator()
    // ... add other validators
}
```

**4. Observe the current state**: You can observe the validated state using the `currentState` property within `StateValidator`:

```swift
stateValidator.$currentState
    .sink { newState in
        print("Current state: \(newState)")
    }
    .store(in: &cancellableSet)
```
