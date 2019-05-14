import 'package:flutter_wan_android/constants/constants.dart';
import 'package:flutter_wan_android/model/protocol/banner_resp.dart';
import 'package:flutter_wan_android/model/protocol/base_resp.dart';
import 'package:flutter_wan_android/net/apis.dart';
import 'package:flutter_wan_android/net/dio_driver.dart';

class NetService {
  Future<List<BannerResp>> getBanner() async {
    BaseResp<List> baseResp = await DioDriver().postData<List>(
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
}
