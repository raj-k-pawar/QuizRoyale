class AppStrings {
  AppStrings._();

  // ── General ───────────────────────────────────────────────────────────────
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String retry = 'Try Again';
  static const String back = 'Back';
  static const String next = 'Next';
  static const String done = 'Done';
  static const String save = 'Save';
  static const String loading = 'Loading…';
  static const String error = 'Oops!';

  // ── Auth ──────────────────────────────────────────────────────────────────
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String signOut = 'Sign Out';
  static const String emailHint = 'Your email';
  static const String passwordHint = 'Password';
  static const String usernameHint = 'Pick a cool username';
  static const String forgotPassword = 'Forgot password?';
  static const String noAccount = "Don't have an account? ";
  static const String hasAccount = 'Already have an account? ';
  static const String guestPlay = 'Play as Guest';

  // ── Home ──────────────────────────────────────────────────────────────────
  static const String playNow = 'Play Now!';
  static const String createGame = 'Create Game';
  static const String joinGame = 'Join Game';
  static const String quickMatch = 'Quick Match';

  // ── Lobby ─────────────────────────────────────────────────────────────────
  static const String waitingForPlayers = 'Waiting for players…';
  static const String startGame = 'Start Game!';
  static const String copyCode = 'Copy Code';
  static const String shareCode = 'Share Code';
  static const String codeCopied = 'Game code copied!';
  static const String inviteFriends = 'Invite Friends';
  static const String roomCode = 'Room Code';
  static const String players = 'Players';
  static const String ready = 'Ready!';
  static const String notReady = 'Not Ready';

  // ── Game ──────────────────────────────────────────────────────────────────
  static const String question = 'Question';
  static const String timeLeft = 'Time Left';
  static const String yourScore = 'Your Score';
  static const String correctAnswer = 'Correct! 🎉';
  static const String wrongAnswer = 'Wrong! 😬';
  static const String timesUp = "Time's Up!";
  static const String streakLabel = '🔥 Streak';
  static const String bonusPoints = '+{points} Bonus!';

  // ── Results ───────────────────────────────────────────────────────────────
  static const String winner = '🏆 Winner!';
  static const String youWon = 'You Won!';
  static const String youLost = 'Better luck next time!';
  static const String finalScores = 'Final Scores';
  static const String playAgain = 'Play Again';
  static const String backToHome = 'Back to Home';
  static const String xpEarned = 'XP Earned';

  // ── Profile ───────────────────────────────────────────────────────────────
  static const String myProfile = 'My Profile';
  static const String totalWins = 'Total Wins';
  static const String totalGames = 'Total Games';
  static const String winRate = 'Win Rate';
  static const String bestStreak = 'Best Streak';
  static const String level = 'Level';

  // ── Leaderboard ───────────────────────────────────────────────────────────
  static const String leaderboard = 'Leaderboard';
  static const String topPlayers = 'Top Players';
  static const String thisWeek = 'This Week';
  static const String allTime = 'All Time';
  static const String rank = 'Rank';

  // ── Settings ─────────────────────────────────────────────────────────────
  static const String settings = 'Settings';
  static const String sound = 'Sound';
  static const String haptics = 'Haptics';
  static const String notifications = 'Notifications';
  static const String about = 'About';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsOfService = 'Terms of Service';

  // ── Errors ────────────────────────────────────────────────────────────────
  static const String networkError = 'No internet connection.\nPlease check your connection and try again.';
  static const String serverError = 'Server hiccup!\nOur team is on it. Please try again.';
  static const String gameNotFound = 'Game not found.\nIt may have ended or the code is wrong.';
  static const String gameFullError = 'This game is full!\nFind another or create your own.';
  static const String authError = 'Sign-in failed.\nPlease check your details and try again.';
  static const String unknownError = 'Something went wrong.\nPlease try again.';
}
