import 'package:flutter_wan_android/constants/constants.dart';
import 'package:flutter_wan_android/model/protocol/article_resp.dart';
import 'package:flutter_wan_android/model/protocol/banner_resp.dart';
import 'package:flutter_wan_android/model/protocol/base_resp.dart';
import 'package:flutter_wan_android/net/apis.dart';
import 'package:flutter_wan_android/net/dio_driver.dart';

class NetService {

  factory NetService() => _getInstance();
  static NetService _instance;

  static NetService _getInstance(){
    if (_instance == null) {
      _instance = new NetService._init();
    }
    return _instance;
  }

  NetService._init();

  Future<List<BannerResp>> getBanner() async {
    BaseResp<List> baseResp = await DioDriver().getData<List>(
         WanAndroidApi.BANNER);
    List<BannerResp> bannerList;
    if (baseResp.errorCode != HttpCode.http_success) {
      return new Future.error(baseResp.errorMsg);
    }
    if (baseResp.data != null) {
      bannerList = baseResp.data.map((value) {
        return BannerResp.fromJson(value);
      }).toList();
    }
    return bannerList;
  }


  Future<List<ArticleResp>> getArticleList() async{
    List<ArticleResp> articleList;

    return articleList;
  }

}
