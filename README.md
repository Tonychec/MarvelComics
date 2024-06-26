# Marvel Comics Application
<img src="https://github.com/Tonychec/MarvelComics/assets/15349089/db5d77bd-8962-4e7a-9b0c-fccf5abf82f5" width="200">
<img src="https://github.com/Tonychec/MarvelComics/assets/15349089/9398c273-5798-4f9b-81bb-ae95a61183a1" width="200">

This application is built to explore and interact with the Marvel Comics API available at [developer.marvel.com](https://developer.marvel.com). It is designed with the Model-View (MV) architecture pattern in mind, ensuring that the View only receives state updates from the Model when necessary. The application is implemented without additional libraries or dependencies.

## Setup Instructions

To run the application, you need to provide your private and public keys from the Marvel API. These keys should be added to the `Keys.plist` file.

1. Sign up at [developer.marvel.com](https://developer.marvel.com) and get your API keys.
2. Add your Marvel API keys to the `Keys.plist` file in the following format:

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>PublicKey</key>
    <string>YOUR_PUBLIC_KEY</string>
    <key>PrivateKey</key>
    <string>YOUR_PRIVATE_KEY</string>
</dict>
</plist>
```

## Features

- **Comic List**: Displays a list of Marvel Comics.
- **Comic Details**: Shows detailed information about a selected comic.
- **State Management**: Implements a basic MV architecture pattern for state management.

## Known Issues and Improvements

### Issues
- **Title Color Issue**: The title color changes unexpectedly when navigating back from the ComicDetails to ComicList.
- **Pull to Refresh Issue**: The pull to refresh indicator becomes clear when navigating back from ComicDetails to ComicList.

### Improvements
- **Empty Description**: The Comic entity from the API has an empty description. This needs investigation or a design update.
- **Thumbnail Performance**: Implement changeable image sizes in the Thumbnail component for better performance.
- **State Machine**: Consider implementing a state machine for better management of view states.
- **Pagination**: Add pagination support to the ComicList.
- **Loading State**: Implement a loading state for the ComicList.
- **Empty List State**: Implement an empty list state for the ComicList.
- **Previuos and Next buttons state**: Implement update buttons state depending on hasPrevious and hasNext values from model.
- **Read Functions**: Implement `readNow`, `markAsRead`, `addToLibrary`, and `readOffline` functionalities once the business logic is clarified.
- **Search Functionality**: Add a search and filter feature.
- **Caching**: Implement caching for offline access and performance improvements.
- **Test Coverage**: Increase the test coverage to ensure reliability.

## Running the Application

After setting up your API keys, you can run the application using Xcode. Open the project in Xcode and build the application. Ensure that your simulator or connected device has internet access to fetch data from the Marvel API.

## Contributing

If you wish to contribute to the project, feel free to fork the repository and submit a pull request. Ensure that your code follows the existing architecture and is well-documented.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
