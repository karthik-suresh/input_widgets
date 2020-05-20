class Utils {
  // The function will be replaced by api fetched from backend
  static List<dynamic> getFlattenedRenderedSurvey(dynamic questionGroup,
      {String parentKey}) {
    if (questionGroup == null) return null;
    dynamic flatRenderedList = [];
    for (final item in questionGroup['items']) {
      if (item['items'] == null) {
        flatRenderedList.add(item);
      } else {
        flatRenderedList.addAll(getFlattenedRenderedSurvey(item));
      }
    }
    return flatRenderedList.toList();
  }

  static getEnglishPartsFromContent(List content) {
    getPartsByCode(content, "en");
  }

  static getPartsByCode(dynamic content, String code) {
    dynamic localisedObject = content.firstWhere(
        (localizedObject) => localizedObject['code'] == code, orElse: () {
      print('No content found');
      return null;
    });
    String parts = (localisedObject == null)
        ? 'No content found'
        : localisedObject['parts'].join();
    return parts;
  }

  static getItemComponentContentByRole(dynamic itemComponents, String role,
      {String code = "en"}) {
    dynamic component = itemComponents
        .firstWhere((comp) => comp['role'] == role, orElse: () => null);
    if (component == null ||
        ((component['displayCondition'] != null) &&
            (component['displayCondition'] == false))) {
      return null;
    }
    return getPartsByCode(component['content'], code);
  }

  static getQuestionList(List surveySingleItem) {
    List<String> questions = [];
    surveySingleItem.forEach((item) {
      String question =
          getItemComponentContentByRole(item['components']['items'], 'title');
      questions.add(question);
    });
    return questions;
  }
}
