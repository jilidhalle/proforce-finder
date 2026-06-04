# ProForce Finder

Flutter Web site for ProForce Finder, a construction staffing and recruiting landing page for global projects.

## Tech Stack

- Flutter Web / Dart
- Material UI widgets with a custom theme under `lib/src/theme/`
- Firebase Core is initialized in `lib/main.dart`
- Firebase Hosting serves the built web app from `build/web`
- Web3Forms forwards contact form submissions by email

## Project Structure

- `lib/main.dart` initializes Flutter and Firebase.
- `lib/src/app.dart` defines the `MaterialApp` title, theme, and home page.
- `lib/src/pages/home_page.dart` assembles the page sections.
- `lib/src/sections/` contains the main landing page sections.
- `lib/src/widgets/` contains shared layout/navigation/button widgets.
- `lib/src/services/contact_form_service.dart` submits contact form data.
- `lib/src/config/app_config.dart` stores environment-backed app config.
- `assets/` contains images used by the Flutter app.
- `web/` contains browser/PWA files such as `index.html`, `manifest.json`, favicon, and app icons.

## Contact Form

The contact form is implemented in `lib/src/sections/contact_section.dart`.

Submissions are sent directly from Flutter Web to Web3Forms:

```txt
Flutter contact form -> https://api.web3forms.com/submit -> recipient inbox
```

The Web3Forms integration lives in `lib/src/services/contact_form_service.dart`.

The access key is read from `WEB3FORMS_KEY` through `String.fromEnvironment` in `lib/src/config/app_config.dart`.

Local run with a specific key:

```bash
flutter run -d chrome --dart-define=WEB3FORMS_KEY=your_key_here
```

Production build with a specific key:

```bash
flutter build web --dart-define=WEB3FORMS_KEY=client_key_here
```

Current behavior:

- Required fields: name, email address, message
- Optional field: business / organization
- Email format validation
- Message minimum length validation
- Submit button disables while sending
- Success and failure messages are shown with `SnackBar`
- Form clears after a successful submission

There is no custom backend, SMTP server, SendGrid, Mailgun, or Firebase Function for email forwarding.

## Logo And Browser Icons

The site logo source asset is:

```txt
assets/proforce-logo.png
```

This asset is used in the app navigation bar via `lib/src/widgets/site_navigation.dart`.

The browser/PWA icon files were generated from the same logo:

- `web/favicon.png`
- `web/icons/Icon-192.png`
- `web/icons/Icon-512.png`
- `web/icons/Icon-maskable-192.png`
- `web/icons/Icon-maskable-512.png`

The PWA manifest branding is set in `web/manifest.json`:

- App name: `ProForce Finder`
- Short name: `ProForce`
- Theme color: `#101927`
- Background color: `#101927`

## Recent Changes

- Added `assets/proforce-logo.png`.
- Replaced the app bar's placeholder engineering icon with the ProForce logo.
- Replaced the default Flutter browser/PWA icons with ProForce logo icons.
- Updated `web/manifest.json` from default Flutter metadata to ProForce Finder branding.
- Removed the placeholder contact details container from the contact section.
- Confirmed the email forwarding platform is Web3Forms.

## Build

Build the Flutter web app:

```bash
flutter build web
```

Build with the Web3Forms key:

```bash
flutter build web --dart-define=WEB3FORMS_KEY=client_key_here
```

## Deploy

Firebase Hosting is configured in `firebase.json` to serve `build/web` and rewrite all routes to `index.html`.

Deploy hosting:

```bash
firebase deploy --only hosting
```

## Verification

Useful checks before deploy:

```bash
dart format lib
flutter analyze
flutter build web --dart-define=WEB3FORMS_KEY=client_key_here
```
