enum ImagePath{
  profileImage,
  logoImage,
  defaultProfileImage,
  backgroundImage,
}

class AssetsManager {
  static const Map<ImagePath, String> _imagePaths = {
    ImagePath.profileImage: 'assets/images/profile_image.png',
    ImagePath.logoImage: 'assets/images/logo.png',
    ImagePath.defaultProfileImage: 'assets/images/profile_image.png',
    ImagePath.backgroundImage: 'assets/images/background.jpg',
  };

  static String getImagePath(ImagePath image) => _imagePaths[image]!;
  static get logoImage => getImagePath(ImagePath.logoImage);
  static String get defaultProfileImage => getImagePath(ImagePath.defaultProfileImage);
}
