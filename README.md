# Realtime Messaging app with Laravel 11, React, Tailwind

## Project Features

- Sending and receiving messages in realtime
- Sending emojies
- Send markdown messages
- Deleting your own sent messages
- Load older messages with infinite scroll loading
- Sending all types of files
- Dedicated button to quickly shared images
- Dedicated button to record and send audio files
- Preview on small screen and on full screen of images, videos, audio and PDFs
- Ability to add new users
- Block and Unblock users
- Give and remove admin permissions to users.
- Create Groups and add users
- Edit or delete groups. This will start a background job, so that if the group is large and needs several minutes to be deleted,
  it will be deleted in background and will notify users using websockets.
- Update your own profile details: Name, email, password or profile picture
- Fully responsive UI working on very small devices.

## Demo
You can check the working demo right here: coming soon


## Installation
1. Download or clone the project using Git
1. Navigate into the project's root directory using terminal and execute `code .`
1. Create a new `.env` file, copy all configurations from `.env.example`, and paste them into the new `.env` file. (The `.env.example` configurations are correct temporarily since the database is hosted.)
1. Execute `composer install`
1. Set application encryption key: `php artisan key:generate --ansi`
1. Start the server: `php artisan serve`
1. Open new terminal and execute `npm install` and `npm run dev` to start vite server
1. Open another terminal and execute `php artisan reverb:start` to start Laravel Reverb's local websocket server
1. Open one more new terminal and execute `php artisan queue:work` to start listening for background jobs. This command handles tasks like deleting groups and all the messages in the background.


## 2024 Eindwerk - Full Stack Development -- Mert Sozen
