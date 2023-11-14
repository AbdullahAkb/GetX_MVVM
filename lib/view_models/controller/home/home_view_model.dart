import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userListModel = UserListModel().obs;

  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserListModel(UserListModel _value) => userListModel.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi() {
    _api.userListApi().then(
      (value) {
        setRxRequestStatus(Status.COMPLETED);
        setUserListModel(value);
      },
    ).onError(
      (error, stackTrace) {
        print(error);
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
      },
    );
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then(
      (value) {
        setRxRequestStatus(Status.COMPLETED);
        setUserListModel(value);
      },
    ).onError(
      (error, stackTrace) {
        print(error);
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
      },
    );
  }
}