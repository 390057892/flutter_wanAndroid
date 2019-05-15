class WanAndroidApi {
  ///https://www.wanandroid.com/banner/json
  static const String BANNER = "banner/json"; //获取banner

  ///获取公众号列表
  static const String wxArticleList = "wxarticle/chapters/json";

  ///查看某个公众号历史数据
  ///https://wanandroid.com/wxarticle/list/408/1/json
  static const String somebodyArticleList = "wxarticle/list";

  ///在某个公众号中搜索历史文章
  ///https://wanandroid.com/wxarticle/list/405/1/json?k=Java
  static const String searchArticleList = "wxarticle/list";

  /// 最新项目tab (首页的第二个tab)
  /// http://wanandroid.com/article/listproject/0/json
  static const String newProject = "article/listproject";
}

class BaseUrl {
  static const String wan_android = "https://www.wanandroid.com/";
}