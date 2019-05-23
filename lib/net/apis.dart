class WanAndroidApi {
  ///获取banner
  ///https://www.wanandroid.com/banner/json
  static const String BANNER = "banner/json";

  /// 首页文章列表 http://www.wanandroid.com/article/list/0/json
  static const String articleList = "article/list";

  /// 项目列表数据
  /// http://www.wanandroid.com/project/list/1/json?cid=294
  static const String projectList = "project/list";

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

  ///搜索
  ///https://www.wanandroid.com/article/query/0/json?k=书籍
  static const String search = "https://www.wanandroid.com/article/query/0/json";

  static String getPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb = new StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (resType != null && resType.isNotEmpty) {
      sb.write('/$resType');
    }
    return sb.toString();
  }
}

class BaseUrl {
  static const String wan_android = "https://www.wanandroid.com/";
}
