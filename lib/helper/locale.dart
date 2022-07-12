class LocaleUtils {
  static String toCountryName(String countryCode) {
    switch (countryCode) {
      case 'id':
        return 'Indonesia';
      case 'en':
        return 'English';
      default:
        return 'Unknown';
    }
  }
}
