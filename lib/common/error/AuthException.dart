enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  unknown,
}

class AuthException {
  static handleException(e) {
    print(e);
    var status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.unknown;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Le format de l'adresse mail semble incorrect.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Identifiant ou mot de passe incorrect.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "Identifiant ou mot de passe incorrect.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "L'utilisateur de cet email a été désactivé.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Trop de requêtes. Réessayez plus tard.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Cette méthode d'authentification n'est pas autorisée.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            "Cet email est déjà utilisé. Veuillez vous connecter ou réinitialiser votre mot de passe.";
        break;
      default:
        errorMessage = "Certaines informations sont incomplètes.";
    }

    return errorMessage;
  }
}
