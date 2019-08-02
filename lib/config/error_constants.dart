class ErrorConstants {
  // TAGS
  static const String service = "[SERVICE]";
  static const String localization = "[LOCALIZATION]";
  static const String globalStateManager = "[GLOBALSTATEMANAGER]";
  static const String jsonParse = "[JSONPARSE]";
  static const String general = "[GENERAL]";

  // ERROR MESSAGES
  // - SERVICE
  static const String statusCodeError = "Status code is not 200 !";
  static const String emptyResponseBodyError = "Response body is empty !";

  // - LOCALIZATION
  static const String emptyLocalizationValuesError = "Localization values are empty !";

  // - GLOBAL STATE MANAGER
  static const String failedToRemoveCurrentUser = "Failed to remove currentUser from globalStateManager";

  // - JSON PARSE
  static const String failedToParseAccessToken =  "Failed to parse accessToken !";

  // - GENERAL
  static const String failedToInitializeApp = "Failed to initialize app !";

  // FULL MESSAGES
  // - SERVICE
  static const String serviceStatusCodeError = service + statusCodeError;
  static const String serviceEmptyResponseBodyError = service + emptyResponseBodyError;

  // - LOCALIZATION
  static const String localizationEmptyLocalizationValuesError = localization + emptyLocalizationValuesError;

  // - GLOBAL STATE MANAGER
  static const String globalStateManagerFailedToRemoveCurrentUser = globalStateManager + failedToRemoveCurrentUser;

  // - JSON PARSE
  static const String jsonFailedToParseAccessToken =  jsonParse + failedToParseAccessToken;

  // - GENERAL
  static const String generalFailedToInitializeApp = general + failedToInitializeApp;
}