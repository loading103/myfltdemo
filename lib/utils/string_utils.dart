

class StringUtil {
  ///跳转页面
  static String getImages(String? str) {
      if(str==null || str.isEmpty ){
        return "";
      }
      var split = str.split(",");
      return split[0];

  }

}