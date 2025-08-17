enum ImageGetBy { asset, network, file, memory }

enum ButtonColor {
  primary,
  secondary,
  danger,
  proccess,
  success,
  warning,
  bg,
  bgOpposite,
  white,
  black,
}

enum ButtonType { filled, outline, text, ghost }

enum ButtonSize { sm, md, lg }

enum TextSize {
  small,
  small_1,
  normal,
  size_2,
  size_3,
  size_4,
  size_5,
  size_6,
  size_7,
  size_8,
}

enum RadiusEnum { sm, md, lg, xl, xxl }

enum RedirectApp { selfCare, customerPoint }

enum BgGradient { linearPrimaryLightTopBottom }

class MobileRegExp {
  static String noSpace = r"\s\b|\b\s";
  static String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String phone = r'(\+84|84|0)(3|5|7|8|9|1(2|6|8|9))[0-9]{8}\b';
  static String number = r'^[0-9]+$';

  static String iframe = r'(?:<iframe[^>]*)(?:(?:\/>)|(?:>.*?<\/iframe>))';
  static String iframeYoutubeEmbed =
      r'<iframe[^>]*src\s*=\s*"?https?:\/\/[^\s"\/]*youtube.com(?:\/[^\s"]*)?"?[^>]*>.*?<\/iframe>';

  // static String iframeYoutubeEmbed =
  //     r'(((&lt;)|\<)iframe.*((https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}))){1}.*(?:\/iframe((&gt;)|>)))(?=(.*(((&lt;)|\<)iframe)))';
}

class SearchParamsKey {
  static String orderBy = 'orderBy';
  static String orderDesc = 'orderDesc';
  static String limit = 'pageSize';
  static String page = 'pageNumber';
  static String search = 'search';
  static String isActive = 'is_active';
}
