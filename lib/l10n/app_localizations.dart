import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @welcomeTo.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue sur '**
  String get welcomeTo;

  /// No description provided for @appSlogan.
  ///
  /// In fr, this message translates to:
  /// **'Votre compagnon IA pour l\'équilibre émotionnel et la sérénité au quotidien 🌿'**
  String get appSlogan;

  /// No description provided for @getStarted.
  ///
  /// In fr, this message translates to:
  /// **'Rejoindre l\'aventure'**
  String get getStarted;

  /// No description provided for @logIn.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get logIn;

  /// No description provided for @loginNow.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get loginNow;

  /// No description provided for @yourEmail.
  ///
  /// In fr, this message translates to:
  /// **'Votre adresse mail'**
  String get yourEmail;

  /// No description provided for @forgotPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ?'**
  String get forgotPassword;

  /// No description provided for @noAccount.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de compte ?'**
  String get noAccount;

  /// No description provided for @registerNow.
  ///
  /// In fr, this message translates to:
  /// **'S\'inscrire maintenant'**
  String get registerNow;

  /// No description provided for @registering.
  ///
  /// In fr, this message translates to:
  /// **'Inscription'**
  String get registering;

  /// No description provided for @register.
  ///
  /// In fr, this message translates to:
  /// **'S\'inscrire'**
  String get register;

  /// No description provided for @fullname.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get fullname;

  /// No description provided for @enterName.
  ///
  /// In fr, this message translates to:
  /// **'Saisir votre nom complet'**
  String get enterName;

  /// No description provided for @confirmPassword.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le mot de passe'**
  String get confirmPassword;

  /// No description provided for @alreadyAccount.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez déjà un compte ?'**
  String get alreadyAccount;

  /// No description provided for @resetPassword.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser le mot de passe'**
  String get resetPassword;

  /// No description provided for @submit.
  ///
  /// In fr, this message translates to:
  /// **'Soumettre'**
  String get submit;

  /// No description provided for @password.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get password;

  /// No description provided for @passwordText.
  ///
  /// In fr, this message translates to:
  /// **'Changer mot de passe'**
  String get passwordText;

  /// No description provided for @emailValidatorMessage.
  ///
  /// In fr, this message translates to:
  /// **'Veillez entrez une adresse email valide !'**
  String get emailValidatorMessage;

  /// No description provided for @fieldValidatorMessage.
  ///
  /// In fr, this message translates to:
  /// **'Veillez valeur valide pour ce champ'**
  String get fieldValidatorMessage;

  /// No description provided for @welcome.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue'**
  String get welcome;

  /// No description provided for @makeASearch.
  ///
  /// In fr, this message translates to:
  /// **'Faire une recherche...'**
  String get makeASearch;

  /// No description provided for @recommandedForYou.
  ///
  /// In fr, this message translates to:
  /// **'Recommandés pour vous'**
  String get recommandedForYou;

  /// No description provided for @noItemFound.
  ///
  /// In fr, this message translates to:
  /// **'Aucun élément pour le moment.'**
  String get noItemFound;

  /// No description provided for @recentlyRated.
  ///
  /// In fr, this message translates to:
  /// **'Récemment notés'**
  String get recentlyRated;

  /// No description provided for @itemNotFound.
  ///
  /// In fr, this message translates to:
  /// **'L\'élément n\'a pas été trouvé.'**
  String get itemNotFound;

  /// No description provided for @rateNow.
  ///
  /// In fr, this message translates to:
  /// **'Noter maintenant'**
  String get rateNow;

  /// No description provided for @about.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get about;

  /// No description provided for @reviews.
  ///
  /// In fr, this message translates to:
  /// **'Avis'**
  String get reviews;

  /// No description provided for @reviewsInProgress.
  ///
  /// In fr, this message translates to:
  /// **'Section des commentaires en cours de construction'**
  String get reviewsInProgress;

  /// No description provided for @description.
  ///
  /// In fr, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @leaveAComment.
  ///
  /// In fr, this message translates to:
  /// **'Écrire un commentaire (Optionnel)'**
  String get leaveAComment;

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @rate.
  ///
  /// In fr, this message translates to:
  /// **'Noter'**
  String get rate;

  /// No description provided for @noReviewsYet.
  ///
  /// In fr, this message translates to:
  /// **'Aucun commentaire pour le moment.'**
  String get noReviewsYet;

  /// No description provided for @delete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get delete;

  /// No description provided for @deleteMyReview.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer mon avis'**
  String get deleteMyReview;

  /// No description provided for @edit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get edit;

  /// No description provided for @editMyReview.
  ///
  /// In fr, this message translates to:
  /// **'Modifier mon avis'**
  String get editMyReview;

  /// No description provided for @confirmDeleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Confirmation de suppression'**
  String get confirmDeleteTitle;

  /// No description provided for @confirmDeleteMessage.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir supprimer votre avis ?'**
  String get confirmDeleteMessage;

  /// No description provided for @deleteSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Votre avis a été supprimé.'**
  String get deleteSuccess;

  /// No description provided for @deleteError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de supprimer votre avis.'**
  String get deleteError;

  /// No description provided for @comments.
  ///
  /// In fr, this message translates to:
  /// **'Commentaires'**
  String get comments;

  /// No description provided for @reviewsAndComments.
  ///
  /// In fr, this message translates to:
  /// **'Avis et commentaires'**
  String get reviewsAndComments;

  /// No description provided for @noNotifLabel.
  ///
  /// In fr, this message translates to:
  /// **'Aucune notification pour le moment'**
  String get noNotifLabel;

  /// No description provided for @noNotifText.
  ///
  /// In fr, this message translates to:
  /// **'Vos notifications apparaitrons ici une fois que vous en recevrez.'**
  String get noNotifText;

  /// No description provided for @disconnect.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get disconnect;

  /// No description provided for @share.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get share;

  /// No description provided for @learnMore.
  ///
  /// In fr, this message translates to:
  /// **'En savoir plus'**
  String get learnMore;

  /// No description provided for @seeYouSoon.
  ///
  /// In fr, this message translates to:
  /// **'À bientôt !'**
  String get seeYouSoon;

  /// No description provided for @close.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get close;

  /// No description provided for @editMyProfile.
  ///
  /// In fr, this message translates to:
  /// **'Modifier mon profil'**
  String get editMyProfile;

  /// No description provided for @confirmExit.
  ///
  /// In fr, this message translates to:
  /// **'Confirmation de sortie'**
  String get confirmExit;

  /// No description provided for @confirmExitMessage.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir quitter l\'application ?'**
  String get confirmExitMessage;

  /// No description provided for @exit.
  ///
  /// In fr, this message translates to:
  /// **'Quitter'**
  String get exit;

  /// No description provided for @confirmDisconnect.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer la déconnexion'**
  String get confirmDisconnect;

  /// No description provided for @confirmDisconnectMessage.
  ///
  /// In fr, this message translates to:
  /// **'Voulez-vous vraiment vous déconnecter ?'**
  String get confirmDisconnectMessage;

  /// No description provided for @yes.
  ///
  /// In fr, this message translates to:
  /// **'Oui'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In fr, this message translates to:
  /// **'Non'**
  String get no;

  /// No description provided for @disconnectedSuccessfully.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez été déconnecté avec succès.'**
  String get disconnectedSuccessfully;

  /// No description provided for @rateAverage.
  ///
  /// In fr, this message translates to:
  /// **'Note moyenne'**
  String get rateAverage;

  /// No description provided for @filter.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer'**
  String get filter;

  /// No description provided for @filterByTag.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer par tag'**
  String get filterByTag;

  /// No description provided for @filterByCategory.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer par catégorie'**
  String get filterByCategory;

  /// No description provided for @sortOrder.
  ///
  /// In fr, this message translates to:
  /// **'Ordre de tri'**
  String get sortOrder;

  /// No description provided for @ascending.
  ///
  /// In fr, this message translates to:
  /// **'Croissant'**
  String get ascending;

  /// No description provided for @descending.
  ///
  /// In fr, this message translates to:
  /// **'Décroissant'**
  String get descending;

  /// No description provided for @applyFilters.
  ///
  /// In fr, this message translates to:
  /// **'Appliquer les filtres'**
  String get applyFilters;

  /// No description provided for @explore.
  ///
  /// In fr, this message translates to:
  /// **'Explorer'**
  String get explore;

  /// No description provided for @myReviews.
  ///
  /// In fr, this message translates to:
  /// **'Mes avis'**
  String get myReviews;

  /// No description provided for @summary.
  ///
  /// In fr, this message translates to:
  /// **'Résumé'**
  String get summary;

  /// No description provided for @perCategory.
  ///
  /// In fr, this message translates to:
  /// **'Par catégorie'**
  String get perCategory;

  /// No description provided for @perRating.
  ///
  /// In fr, this message translates to:
  /// **'Par note'**
  String get perRating;

  /// No description provided for @myStats.
  ///
  /// In fr, this message translates to:
  /// **'Mes statistiques'**
  String get myStats;

  /// No description provided for @myActivity.
  ///
  /// In fr, this message translates to:
  /// **'Mon activité'**
  String get myActivity;

  /// No description provided for @viewAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout voir'**
  String get viewAll;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settings;

  /// No description provided for @account.
  ///
  /// In fr, this message translates to:
  /// **'Compte'**
  String get account;

  /// No description provided for @changePassword.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le mot de passe'**
  String get changePassword;

  /// No description provided for @logout.
  ///
  /// In fr, this message translates to:
  /// **'Déconnexion'**
  String get logout;

  /// No description provided for @appearance.
  ///
  /// In fr, this message translates to:
  /// **'Apparence'**
  String get appearance;

  /// No description provided for @darkMode.
  ///
  /// In fr, this message translates to:
  /// **'Mode sombre'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get language;

  /// No description provided for @appVersion.
  ///
  /// In fr, this message translates to:
  /// **'Version de l\'app'**
  String get appVersion;

  /// No description provided for @privacyPolicy.
  ///
  /// In fr, this message translates to:
  /// **'Politique de confidentialité'**
  String get privacyPolicy;

  /// No description provided for @contactSupport.
  ///
  /// In fr, this message translates to:
  /// **'Contacter le support'**
  String get contactSupport;

  /// No description provided for @end.
  ///
  /// In fr, this message translates to:
  /// **'Terminer'**
  String get end;

  /// Label de l'option de sélection.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez la {selectOption}...'**
  String selectThe(String selectOption);

  /// No description provided for @french.
  ///
  /// In fr, this message translates to:
  /// **'Français'**
  String get french;

  /// No description provided for @english.
  ///
  /// In fr, this message translates to:
  /// **'Anglais'**
  String get english;

  /// Le label correspondant à la langue
  ///
  /// In fr, this message translates to:
  /// **'{code, select, fr{Français} en{Anglais} other{Inconnu}}'**
  String languageValue(String code);

  /// No description provided for @exitApp.
  ///
  /// In fr, this message translates to:
  /// **'Quitter l\'application'**
  String get exitApp;

  /// No description provided for @exitConfirmation.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir quitter l\'application ?'**
  String get exitConfirmation;

  /// No description provided for @notifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @noNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Aucune notification pour le moment.'**
  String get noNotifications;

  /// No description provided for @fillAllFields.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez remplir tous les champs.'**
  String get fillAllFields;

  /// No description provided for @unknownError.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur inconnue est survenue.'**
  String get unknownError;

  /// No description provided for @error.
  ///
  /// In fr, this message translates to:
  /// **'Erreur'**
  String get error;

  /// No description provided for @registerSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Inscription réussie'**
  String get registerSuccess;

  /// No description provided for @loginSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Connexion réussie'**
  String get loginSuccess;

  /// No description provided for @loading.
  ///
  /// In fr, this message translates to:
  /// **'Chargement...'**
  String get loading;

  /// No description provided for @errorLoadingApp.
  ///
  /// In fr, this message translates to:
  /// **'Erreur lors du chargement de l\'application'**
  String get errorLoadingApp;

  /// No description provided for @otherOptions.
  ///
  /// In fr, this message translates to:
  /// **'Autres options'**
  String get otherOptions;

  /// No description provided for @deleteAccount.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer mon compte'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirmation.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir supprimer votre compte ?'**
  String get deleteAccountConfirmation;

  /// No description provided for @permanentDelete.
  ///
  /// In fr, this message translates to:
  /// **'Suppression permanente'**
  String get permanentDelete;

  /// No description provided for @deleteAccountMessage.
  ///
  /// In fr, this message translates to:
  /// **'Cette action supprimera définitivement votre compte et toutes vos données. \nÊtes-vous sûr de vouloir continuer ?'**
  String get deleteAccountMessage;

  /// No description provided for @deleteAccountSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Votre compte a été supprimé avec succès.'**
  String get deleteAccountSuccess;

  /// No description provided for @shareApp.
  ///
  /// In fr, this message translates to:
  /// **'Partagez l\'application avec vos proches'**
  String get shareApp;

  /// No description provided for @shareMessage.
  ///
  /// In fr, this message translates to:
  /// **'Découvrez Rate Master, votre application pour noter et partager vos expériences ! Téléchargez-la ici'**
  String get shareMessage;

  /// No description provided for @aboutApp.
  ///
  /// In fr, this message translates to:
  /// **'À propos de Rate Master'**
  String get aboutApp;

  /// No description provided for @appDescription.
  ///
  /// In fr, this message translates to:
  /// **'Rate Master est une application qui vous permet de noter et de partager vos expériences sur des produits, lieux et services avec d\'autres utilisateurs. \nNous croyons que chaque avis compte et peut aider les autres à faire des choix éclairés. \nRejoignez notre communauté et commencez à partager vos expériences dès aujourd\'hui !'**
  String get appDescription;

  /// No description provided for @functionalities.
  ///
  /// In fr, this message translates to:
  /// **'Fonctionnalités principales'**
  String get functionalities;

  /// No description provided for @addReviewFrom1To5.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un note de 1 à 5 étoiles'**
  String get addReviewFrom1To5;

  /// No description provided for @viewStats.
  ///
  /// In fr, this message translates to:
  /// **'Voir les statistiques de vos notes'**
  String get viewStats;

  /// No description provided for @editPreferences.
  ///
  /// In fr, this message translates to:
  /// **'Modifier vos préférences'**
  String get editPreferences;

  /// No description provided for @datasPrivateAndSecure.
  ///
  /// In fr, this message translates to:
  /// **'Vos données sont privées et stockées de manière sécurisée. \nNous ne partageons pas vos informations personnelles avec des tiers.'**
  String get datasPrivateAndSecure;

  /// No description provided for @termsAndConditions.
  ///
  /// In fr, this message translates to:
  /// **'Conditions générales d\'utilisation'**
  String get termsAndConditions;

  /// No description provided for @accountDeletion.
  ///
  /// In fr, this message translates to:
  /// **'Suppression de compte'**
  String get accountDeletion;

  /// No description provided for @childProtection.
  ///
  /// In fr, this message translates to:
  /// **'Protection des enfants'**
  String get childProtection;

  /// No description provided for @profileUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Votre profil a été mis à jour avec succès.'**
  String get profileUpdated;

  /// No description provided for @saveChanges.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer les modifications'**
  String get saveChanges;

  /// No description provided for @emailHint.
  ///
  /// In fr, this message translates to:
  /// **'test@exemple.com'**
  String get emailHint;

  /// No description provided for @enterEmail.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre adresse e-mail'**
  String get enterEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In fr, this message translates to:
  /// **'Adresse e-mail invalide'**
  String get invalidEmail;

  /// No description provided for @enterPassword.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre mot de passe'**
  String get enterPassword;

  /// No description provided for @passwordTooShort.
  ///
  /// In fr, this message translates to:
  /// **'Le mot de passe doit contenir au moins 6 caractères'**
  String get passwordTooShort;

  /// No description provided for @goBack.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get goBack;

  /// No description provided for @passwordHint.
  ///
  /// In fr, this message translates to:
  /// **'********'**
  String get passwordHint;

  /// No description provided for @showPassword.
  ///
  /// In fr, this message translates to:
  /// **'Afficher le mot de passe'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In fr, this message translates to:
  /// **'Masquer le mot de passe'**
  String get hidePassword;

  /// No description provided for @underConstruction.
  ///
  /// In fr, this message translates to:
  /// **'Cette section est en cours de construction'**
  String get underConstruction;

  /// No description provided for @loginFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la connexion'**
  String get loginFailed;

  /// No description provided for @registerFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec de l\'inscription'**
  String get registerFailed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
