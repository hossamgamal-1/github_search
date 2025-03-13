# Github Search App

## API RATE LIMIT Note
### In Case of a real world application in addition to debouncing, caching, and API optimization GitHub requests can be authenticated using github API KEY to enjoy +5000 request per hour instead of 60 request per hour for unauthenticated requests

## Assumptions Made
### 6 months = 180 days

## `Supported Flutter Version: 3.29.1`

## Functional Features
> - Real-time search: Fetch and display autocomplete suggestions from GitHub as users type.
> - Debouncing: Optimize API calls to prevent unnecessary requests when typing.
> - Dropdown Suggestions: Show the top 10 matching users dynamically below the search bar.
> - User Selection: Clicking a suggestion should display user details (avatar, GitHub profile link).
> - Error Handling: Handle network failures, empty responses, and API errors gracefully.
> 
> - **Offline caching for previously searched queries.**
> - **Support keyboard navigation for selecting users.**

## Sorting Logic for Autocomplete Results
> - Users with 50+ public repositories should be prioritized at the top of the list.
> - Among those, users who have committed in the last 6 months should appear first.
> - If both conditions are the same, sort by GitHub’s default relevance score.

