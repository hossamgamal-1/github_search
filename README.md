# Github Search App

### GitHub User Search with Weighted Autocomplete allows users to search for GitHub usernames in real-time

## 🚀 Features

- ✅ Real-time search: Fetch and display autocomplete suggestions from GitHub as users type.
- ✅ Debouncing: Optimize API calls to prevent unnecessary requests when typing.
- ✅ Dropdown Suggestions: Show the top 10 matching users dynamically below the search bar.
- ✅ User Selection: Clicking a suggestion should display user details (avatar, GitHub profile link).
- ✅ Error Handling: Handle network failures, empty responses, and API errors gracefully.
- ✅ 🏆 **Offline caching for previously searched queries.**
- ✅ 🏆 **Support keyboard navigation for selecting users.**

## 📲 Installation

### Make sure you have **Flutter Version: 3.29.1** installed. Then, follow these steps:

```sh
# Clone the repo
git clone https://github.com/hossamgamal-1/github_search

# Navigate to the project directory
cd github_search

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## API rate limit note
### In case of a real world application in addition to debouncing, caching, and API optimization GitHub requests can be authenticated using GitHub API KEY to enjoy +5000 request per hour instead of 60 request per hour for unauthenticated requests

## Assumptions Made
### 6 months = 180 days

## 📸 Screenshots

| Landing Screen | Search |
|------------|-----------|
| ![Landing Screen](assets/screenshots/landing.png) | ![Search](assets/screenshots/search.png) |
