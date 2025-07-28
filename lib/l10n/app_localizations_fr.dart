// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get welcomeTo => 'Bienvenue sur ';

  @override
  String get appSlogan =>
      'Votre compagnon IA pour l\'équilibre émotionnel et la sérénité au quotidien 🌿';

  @override
  String get getStarted => 'Rejoindre l\'aventure';

  @override
  String get logIn => 'Connexion';

  @override
  String get loginNow => 'Se connecter';

  @override
  String get yourEmail => 'Votre adresse mail';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get noAccount => 'Pas encore de compte ?';

  @override
  String get registerNow => 'S\'inscrire maintenant';

  @override
  String get registering => 'Inscription';

  @override
  String get register => 'S\'inscrire';

  @override
  String get fullname => 'Nom complet';

  @override
  String get enterName => 'Saisir votre nom complet';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get alreadyAccount => 'Vous avez déjà un compte ?';

  @override
  String get resetPassword => 'Réinitialiser le mot de passe';

  @override
  String get submit => 'Soumettre';

  @override
  String get password => 'Mot de passe';

  @override
  String get passwordText => 'Changer mot de passe';

  @override
  String get emailValidatorMessage =>
      'Veillez entrez une adresse email valide !';

  @override
  String get fieldValidatorMessage => 'Veillez valeur valide pour ce champ';

  @override
  String get welcome => 'Bienvenue';

  @override
  String get makeASearch => 'Faire une recherche...';

  @override
  String get recommandedForYou => 'Recommandés pour vous';

  @override
  String get noItemFound => 'Aucun élément pour le moment.';

  @override
  String get recentlyRated => 'Récemment notés';

  @override
  String get itemNotFound => 'L\'élément n\'a pas été trouvé.';

  @override
  String get rateNow => 'Noter maintenant';

  @override
  String get about => 'À propos';

  @override
  String get reviews => 'Avis';

  @override
  String get reviewsInProgress =>
      'Section des commentaires en cours de construction';

  @override
  String get description => 'Description';

  @override
  String get leaveAComment => 'Écrire un commentaire (Optionnel)';

  @override
  String get cancel => 'Annuler';

  @override
  String get rate => 'Noter';

  @override
  String get noReviewsYet => 'Aucun commentaire pour le moment.';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteMyReview => 'Supprimer mon avis';

  @override
  String get edit => 'Modifier';

  @override
  String get editMyReview => 'Modifier mon avis';

  @override
  String get confirmDeleteTitle => 'Confirmation de suppression';

  @override
  String get confirmDeleteMessage =>
      'Êtes-vous sûr de vouloir supprimer votre avis ?';

  @override
  String get deleteSuccess => 'Votre avis a été supprimé.';

  @override
  String get deleteError => 'Impossible de supprimer votre avis.';

  @override
  String get comments => 'Commentaires';

  @override
  String get reviewsAndComments => 'Avis et commentaires';

  @override
  String get noNotifLabel => 'Aucune notification pour le moment';

  @override
  String get noNotifText =>
      'Vos notifications apparaitrons ici une fois que vous en recevrez.';

  @override
  String get disconnect => 'Se déconnecter';

  @override
  String get share => 'Partager';

  @override
  String get learnMore => 'En savoir plus';

  @override
  String get seeYouSoon => 'À bientôt !';

  @override
  String get close => 'Fermer';

  @override
  String get editMyProfile => 'Modifier mon profil';

  @override
  String get confirmExit => 'Confirmation de sortie';

  @override
  String get confirmExitMessage =>
      'Êtes-vous sûr de vouloir quitter l\'application ?';

  @override
  String get exit => 'Quitter';

  @override
  String get confirmDisconnect => 'Confirmer la déconnexion';

  @override
  String get confirmDisconnectMessage =>
      'Voulez-vous vraiment vous déconnecter ?';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get disconnectedSuccessfully =>
      'Vous avez été déconnecté avec succès.';

  @override
  String get rateAverage => 'Note moyenne';

  @override
  String get filter => 'Filtrer';

  @override
  String get filterByTag => 'Filtrer par tag';

  @override
  String get filterByCategory => 'Filtrer par catégorie';

  @override
  String get sortOrder => 'Ordre de tri';

  @override
  String get ascending => 'Croissant';

  @override
  String get descending => 'Décroissant';

  @override
  String get applyFilters => 'Appliquer les filtres';

  @override
  String get explore => 'Explorer';

  @override
  String get myReviews => 'Mes avis';

  @override
  String get summary => 'Résumé';

  @override
  String get perCategory => 'Par catégorie';

  @override
  String get perRating => 'Par note';

  @override
  String get myStats => 'Mes statistiques';

  @override
  String get myActivity => 'Mon activité';

  @override
  String get viewAll => 'Tout voir';

  @override
  String get settings => 'Paramètres';

  @override
  String get account => 'Compte';

  @override
  String get changePassword => 'Modifier le mot de passe';

  @override
  String get logout => 'Déconnexion';

  @override
  String get appearance => 'Apparence';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get language => 'Langue';

  @override
  String get appVersion => 'Version de l\'app';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get contactSupport => 'Contacter le support';

  @override
  String get end => 'Terminer';

  @override
  String selectThe(String selectOption) {
    return 'Sélectionnez la $selectOption...';
  }

  @override
  String get french => 'Français';

  @override
  String get english => 'Anglais';

  @override
  String languageValue(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'fr': 'Français',
      'en': 'Anglais',
      'other': 'Inconnu',
    });
    return '$_temp0';
  }

  @override
  String get exitApp => 'Quitter l\'application';

  @override
  String get exitConfirmation =>
      'Êtes-vous sûr de vouloir quitter l\'application ?';

  @override
  String get notifications => 'Notifications';

  @override
  String get noNotifications => 'Aucune notification pour le moment.';

  @override
  String get fillAllFields => 'Veuillez remplir tous les champs.';

  @override
  String get unknownError => 'Une erreur inconnue est survenue.';

  @override
  String get error => 'Erreur';

  @override
  String get registerSuccess => 'Inscription réussie';

  @override
  String get loginSuccess => 'Connexion réussie';

  @override
  String get loading => 'Chargement...';

  @override
  String get errorLoadingApp => 'Erreur lors du chargement de l\'application';

  @override
  String get otherOptions => 'Autres options';

  @override
  String get deleteAccount => 'Supprimer mon compte';

  @override
  String get deleteAccountConfirmation =>
      'Êtes-vous sûr de vouloir supprimer votre compte ?';

  @override
  String get permanentDelete => 'Suppression permanente';

  @override
  String get deleteAccountMessage =>
      'Cette action supprimera définitivement votre compte et toutes vos données. \nÊtes-vous sûr de vouloir continuer ?';

  @override
  String get deleteAccountSuccess => 'Votre compte a été supprimé avec succès.';

  @override
  String get shareApp => 'Partagez l\'application avec vos proches';

  @override
  String get shareMessage =>
      'Découvrez Rate Master, votre application pour noter et partager vos expériences ! Téléchargez-la ici';

  @override
  String get aboutApp => 'À propos de Rate Master';

  @override
  String get appDescription =>
      'Rate Master est une application qui vous permet de noter et de partager vos expériences sur des produits, lieux et services avec d\'autres utilisateurs. \nNous croyons que chaque avis compte et peut aider les autres à faire des choix éclairés. \nRejoignez notre communauté et commencez à partager vos expériences dès aujourd\'hui !';

  @override
  String get functionalities => 'Fonctionnalités principales';

  @override
  String get addReviewFrom1To5 => 'Ajouter un note de 1 à 5 étoiles';

  @override
  String get viewStats => 'Voir les statistiques de vos notes';

  @override
  String get editPreferences => 'Modifier vos préférences';

  @override
  String get datasPrivateAndSecure =>
      'Vos données sont privées et stockées de manière sécurisée. \nNous ne partageons pas vos informations personnelles avec des tiers.';

  @override
  String get termsAndConditions => 'Conditions générales d\'utilisation';

  @override
  String get accountDeletion => 'Suppression de compte';

  @override
  String get childProtection => 'Protection des enfants';

  @override
  String get profileUpdated => 'Votre profil a été mis à jour avec succès.';

  @override
  String get saveChanges => 'Enregistrer les modifications';

  @override
  String get emailHint => 'test@exemple.com';

  @override
  String get enterEmail => 'Entrez votre adresse e-mail';

  @override
  String get invalidEmail => 'Adresse e-mail invalide';

  @override
  String get enterPassword => 'Entrez votre mot de passe';

  @override
  String get passwordTooShort =>
      'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get goBack => 'Retour';

  @override
  String get passwordHint => '********';

  @override
  String get showPassword => 'Afficher le mot de passe';

  @override
  String get hidePassword => 'Masquer le mot de passe';

  @override
  String get underConstruction => 'Cette section est en cours de construction';

  @override
  String get loginFailed => 'Échec de la connexion';

  @override
  String get registerFailed => 'Échec de l\'inscription';
}
