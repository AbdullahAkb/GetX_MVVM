import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/res/app_url/app_urls.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiServices.getApi(AppUrls.userListApiUrl);
    return UserListModel.fromJson(response);
  }
}
