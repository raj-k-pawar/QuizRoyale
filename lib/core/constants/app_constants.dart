class AppConstants {
  AppConstants._();

  // ── App ───────────────────────────────────────────────────────────────────
  static const String appName = 'Quiz Royale';
  static const String appTagline = 'Battle. Learn. Conquer.';
  static const String appVersion = '1.0.0';

  // ── Firebase Collections ──────────────────────────────────────────────────
  static const String usersCollection = 'users';
  static const String gamesCollection = 'games';
  static const String questionsCollection = 'questions';
  static const String categoriesCollection = 'categories';
  static const String leaderboardCollection = 'leaderboard';
  static const String lobbiesCollection = 'lobbies';

  // ── Realtime DB Paths ─────────────────────────────────────────────────────
  static const String activeGamesPath = 'activeGames';
  static const String lobbiesPath = 'lobbies';
  static const String presencePath = 'presence';

  // ── Game Rules ────────────────────────────────────────────────────────────
  static const int maxPlayersPerGame = 6;
  static const int minPlayersToStart = 2;
  static const int questionsPerRound = 10;
  static const int secondsPerQuestion = 15;
  static const int basePointsCorrect = 100;
  static const int speedBonusMax = 50;
  static const int streakBonusMultiplier = 10;
  static const int maxStreakBonus = 100;

  // ── Animation ─────────────────────────────────────────────────────────────
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration transitionDuration = Duration(milliseconds: 300);

  // ── Storage Keys ─────────────────────────────────────────────────────────
  static const String prefKeyUserId = 'user_id';
  static const String prefKeyUsername = 'username';
  static const String prefKeySoundEnabled = 'sound_enabled';
  static const String prefKeyHapticsEnabled = 'haptics_enabled';
  static const String prefKeyFirstLaunch = 'first_launch';

  // ── Asset Paths ───────────────────────────────────────────────────────────
  static const String logoPath = 'assets/images/logo.png';
  static const String splashAnimPath = 'assets/animations/splash.json';
  static const String loadingAnimPath = 'assets/animations/loading.json';
  static const String crownAnimPath = 'assets/animations/crown.json';
  static const String confettiAnimPath = 'assets/animations/confetti.json';
  static const String wrongAnimPath = 'assets/animations/wrong.json';
  static const String correctAnimPath = 'assets/animations/correct.json';
}
