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
}
