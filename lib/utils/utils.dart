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

  static getEnglishPartsFromContent(dynamic content) {
    getPartsByCode(content, "en");
  }

  static getPartsByCode(dynamic content, String code) {
    dynamic localisedObject = content
        .where((localizedObject) => localizedObject['code'] == code)
        .toList();
    String parts = localisedObject[0]['parts'].join();
    return parts;
  }
}
