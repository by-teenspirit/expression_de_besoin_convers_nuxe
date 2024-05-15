import 'package:get/get.dart';

import '../../../services/remote_service.dart';

class HomeController extends GetxController {
  List<List<String>> foundContact = [];

  final isLoading = true.obs;

  getDatas() async {
    isLoading.value = true;

    List<List<String>> listStr = [];
    var response = await RemoteService().request(
        "GET", "/api/v2/contact?page=1&size=10", true, {}, {}, Get.context!);
    if (response is List<dynamic>) {
      var ranknbr = 1;
      for (var item in response) {
        listStr.add([
          ranknbr.toString(),
          item["firstname"] + " " + item["lastname"],
          item["email"].toString()
        ]);
      }
    }
    foundContact = listStr;

    // var response = await RemoteService().request("GET", "/api/v2/generic/scan?condition=scan.id_user_app=${MyApp.user!.id} AND scan.deleted = 0", true, {}, {}, Get.context!);
    // if (response != null){
    //   countScan1.value = response.length.toString();
    // }

    // response = await RemoteService().request("GET", "/api/v2/generic/v_ranking?sort=v_ranking.rank,asc&condition=v_ranking.month = ${DateTime.now().month} AND v_ranking.year = ${DateTime.now().year}", true, {}, {}, Get.context!);
    // if (response is List<dynamic>) {
    //   var ranknbr = 1;
    //   for(var item in response){
    //     if (item["user_id"].toString() == MyApp.user!.id.toString()){
    //       scanCountMonth.value = item["rank"].toString();
    //       rankMonth.value = ranknbr.toString();
    //     }
    //     ranknbr++;
    //   }
    // }

    // response = await RemoteService().request("GET", "/api/v2/generic/news?condition=news.deleted=0", true, {}, {}, Get.context!);
    // List<News> dataNews = [];
    // if (response != null){
    //   for (var item in response) {
    //     var c = News.fromJson(item);
    //     dataNews.add(c);
    //   }
    // }
    // modelNews = dataNews;

    // response = await RemoteService().request("GET", "/api/v2/generic/challenge?condition=challenge.status=32 AND challenge.deleted = 0 AND challenge.start_date >= NOW() AND challenge.end_date <= NOW()", true, {}, {}, Get.context!);
    // List<Challenge> dataChallenge = [];
    // if (response != null){
    //   for (var item in response) {
    //     var c = Challenge.fromJson(item);
    //     dataChallenge.add(c);
    //   }
    // }
    // modelChallenge = dataChallenge;

    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getDatas();
  }
}
