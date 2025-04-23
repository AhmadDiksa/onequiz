# OneQuiz

OneQuiz is a Flutter-based quiz application that allows users to enter quiz codes, participate in recent and live quizzes, and track their quiz scores. The app features a clean and modern UI with multiple screens including home, explore, chat, and profile.

## Features

- Enter quiz codes to join quizzes
- View recent quizzes with progress
- Participate in live quizzes with other users
- Quiz gameplay with multiple choice questions
- View quiz results and retry quizzes
- User profile management (basic)

## Screens

- **Home Screen**: Main dashboard with quiz code input, recent quizzes, live quizzes, and navigation to other sections.
- **Quiz Screen**: Interactive quiz interface showing questions, answer options, navigation between questions, and final score.
- **Profile Screen**: User profile management.
- **Explore and Chat Screens**: Placeholder screens for future features.

## Getting Started

### Prerequisites

- Flutter SDK (version 3.7.2 or compatible)
- Dart SDK
- An IDE such as VSCode or Android Studio

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/AhmadDiksa/onequiz
   cd onequiz
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

## Dependencies

- [flutter](https://flutter.dev/)
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [flutter_svg](https://pub.dev/packages/flutter_svg)

## Project Structure

- `lib/main.dart`: App entry point
- `lib/screens/`: Contains app screens like HomeScreen, QuizScreen, ProfileScreen
- `lib/widgets/`: Reusable UI components such as QuizCard, AnswerOption, QuizCodeInput
- `lib/data/`: Data sources for quizzes
- `lib/models/`: Data models like QuestionModel
- `lib/core/`: Theme and utility constants

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

For more information on Flutter development, visit the [official Flutter documentation](https://docs.flutter.dev/).
