class AssetsUtils {
  static String getImagePath(String imageName, {String type: 'png'}) {
    return 'assets/images/$imageName.$type';
  }
}
