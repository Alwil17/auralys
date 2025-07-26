// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String welcomeTo(String appName) {
    return 'Welcome to \n$appName';
  }

  @override
  String get appSlogan => 'Your opinion matters, \nRate smarter, Live better !';

  @override
  String get getStarted => 'Get Started';

  @override
  String get logIn => 'LogIn';

  @override
  String get loginNow => 'Log in';

  @override
  String get yourEmail => 'Your mail address';

  @override
  String get forgotPassword => 'Forgot your password?';

  @override
  String get noAccount => 'Don\'t have an account yet?';

  @override
  String get registerNow => 'Register now';

  @override
  String get registering => 'Register';

  @override
  String get register => 'Register';

  @override
  String get fullname => 'Full name';

  @override
  String get enterName => 'Enter your full name';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get alreadyAccount => 'Already have an account?';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get submit => 'Submit';

  @override
  String get password => 'Password';

  @override
  String get passwordText => 'Change Password';

  @override
  String get emailValidatorMessage => 'Please enter a valid email address';

  @override
  String get fieldValidatorMessage =>
      'Please enter a valid and non-empty value for this field';

  @override
  String get welcome => 'Welcome';

  @override
  String get makeASearch => 'Search something...';

  @override
  String get recommandedForYou => 'Recommanded for you';

  @override
  String get noItemFound => 'No item for now.';

  @override
  String get recentlyRated => 'Recently rated';

  @override
  String get itemNotFound => 'The item was not found.';

  @override
  String get rateNow => 'Rate Now';

  @override
  String get about => 'About';

  @override
  String get reviews => 'Reviews';

  @override
  String get reviewsInProgress => 'Reviews section under construction';

  @override
  String get description => 'Description';

  @override
  String get leaveAComment => 'Leave a comment (Optional)';

  @override
  String get cancel => 'Cancel';

  @override
  String get rate => 'Rate';

  @override
  String get noReviewsYet => 'No reviews yet.';

  @override
  String get delete => 'Delete';

  @override
  String get deleteMyReview => 'Delete my review';

  @override
  String get edit => 'Edit';

  @override
  String get editMyReview => 'Edit my review';

  @override
  String get confirmDeleteTitle => 'Confirm Deletion';

  @override
  String get confirmDeleteMessage =>
      'Are you sure you want to delete your review?';

  @override
  String get deleteSuccess => 'Your review was deleted.';

  @override
  String get deleteError => 'Could not delete your review.';

  @override
  String get comments => 'Comments';

  @override
  String get reviewsAndComments => 'Reviews and Comments';

  @override
  String get noNotifLabel => 'No notifications yet';

  @override
  String get noNotifText =>
      'Your notifications will appear here once you receive some.';

  @override
  String get disconnect => 'Disconnect';

  @override
  String get share => 'Share';

  @override
  String get learnMore => 'Learn More';

  @override
  String get seeYouSoon => 'See you soon!';

  @override
  String get close => 'Close';

  @override
  String get editMyProfile => 'Edit my profile';

  @override
  String get confirmExit => 'Confirm Exit';

  @override
  String get confirmExitMessage =>
      'Are you sure you want to exit the application?';

  @override
  String get exit => 'Exit';

  @override
  String get confirmDisconnect => 'Confirm Disconnect';

  @override
  String get confirmDisconnectMessage => 'Are you sure you want to disconnect?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get disconnectedSuccessfully =>
      'You have been disconnected successfully.';

  @override
  String get rateAverage => 'Rate Average';

  @override
  String get filter => 'Filter';

  @override
  String get filterByTag => 'Filter by tag';

  @override
  String get filterByCategory => 'Filter by category';

  @override
  String get sortOrder => 'Sort Order';

  @override
  String get ascending => 'Ascending';

  @override
  String get descending => 'Descending';

  @override
  String get applyFilters => 'Apply Filters';

  @override
  String get explore => 'Explore';

  @override
  String get myReviews => 'My Reviews';

  @override
  String get summary => 'Summary';

  @override
  String get perCategory => 'Per Category';

  @override
  String get perRating => 'Per Rating';

  @override
  String get myStats => 'My Stats';

  @override
  String get myActivity => 'My Activity';

  @override
  String get viewAll => 'View All';

  @override
  String get settings => 'Settings';

  @override
  String get account => 'Account';

  @override
  String get changePassword => 'Change Password';

  @override
  String get logout => 'Logout';

  @override
  String get appearance => 'Appearance';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get appVersion => 'App Version';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get end => 'Finish';

  @override
  String selectThe(String selectOption) {
    return 'Select the $selectOption...';
  }

  @override
  String get french => 'French';

  @override
  String get english => 'English';

  @override
  String languageValue(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'fr': 'French',
      'en': 'English',
      'other': 'Unknow',
    });
    return '$_temp0';
  }

  @override
  String get exitApp => 'Exit the application';

  @override
  String get exitConfirmation =>
      'Are you sure you want to exit the application?';

  @override
  String get notifications => 'Notifications';

  @override
  String get noNotifications => 'No notifications for now.';

  @override
  String get fillAllFields => 'Please fill in all fields.';

  @override
  String get unknownError => 'An unknown error occurred.';

  @override
  String get error => 'Error';

  @override
  String get registerSuccess => 'Registration successful!';

  @override
  String get loginSuccess => 'Login successful!';

  @override
  String get loading => 'Loading...';

  @override
  String get errorLoadingApp => 'Error when loading the application';

  @override
  String get otherOptions => 'Other options';

  @override
  String get deleteAccount => 'Delete my account';

  @override
  String get deleteAccountConfirmation =>
      'Are you sure you want to delete your account?';

  @override
  String get permanentDelete => 'Permanent deletion';

  @override
  String get deleteAccountMessage =>
      'This action is irreversible. All your data will be permanently deleted.';

  @override
  String get deleteAccountSuccess =>
      'Your account has been successfully deleted.';

  @override
  String get shareApp => 'Share the application with your loved ones';

  @override
  String get shareMessage =>
      'Discover Rate Master, your app for rating and sharing experiences! Download it here';

  @override
  String get aboutApp => 'About Rate Master';

  @override
  String get appDescription =>
      'Rate Master is an application that allows you to rate and share your experiences with others. Whether it\'s a restaurant, a movie, or any other experience, Rate Master helps you express your opinion and discover what others think.';

  @override
  String get functionalities => 'Main functionalities';

  @override
  String get addReviewFrom1To5 => 'Add a review from 1 to 5 stars';

  @override
  String get viewStats => 'View the statistics of your ratings';

  @override
  String get editPreferences => 'Edit your preferences';

  @override
  String get datasPrivateAndSecure =>
      'Your data is private and secure with us. We do not share your information with third parties.';

  @override
  String get termsAndConditions => 'Terms and Conditions';

  @override
  String get accountDeletion => 'Account Deletion';

  @override
  String get childProtection => 'Child Protection';

  @override
  String get profileUpdated => 'Your profile has been updated successfully.';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get emailHint => 'test@example.com';

  @override
  String get enterEmail => 'Enter your email address';

  @override
  String get invalidEmail => 'Invalid email address';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters long';

  @override
  String get goBack => 'Go back';

  @override
  String get passwordHint => '********';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get underConstruction => 'This section is under construction';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get registerFailed => 'Registration failed';
}
