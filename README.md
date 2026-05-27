# RickAndMortyApp (iOS)
A prototype of an application Build a small but well-architected iOS app using the Rick & Morty REST API. 

# Prerequisites
Xcode : 26.2

## Architecture Decisions
Clean Architecture used to separate business logic from UI and networking
DTOs isolated inside Data layer
ViewModels manage only UI state
UseCases contain business operations
Repository pattern used for abstraction and testing
## Trade-offs
UserDefaults used for favourites for simplicity
Native AsyncImage used instead of third-party image libraries
Lightweight offline cache implementation
## Improvements With More Time
Add image caching library
Add snapshot tests
Add advanced offline synchronization
Add generic pagination abstraction
Add accessibility improvements
Add retry and refresh support
