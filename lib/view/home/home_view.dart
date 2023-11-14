import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/components/general_exception_widget.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel homeVM = Get.put(HomeViewModel());
  UserPreferenceViewModel userPreferenceViewModel = UserPreferenceViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeVM.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                userPreferenceViewModel.removeUser().then((value) {
                  Get.toNamed(RoutesName.loginView);
                });
              },
              child: const Text("Logout"))
        ],
      ),
      body: Obx(() {
        switch (homeVM.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeVM.error.value == 'No Internet') {
              return InternetExceptionWidget(
                onPress: () {
                  homeVM.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(
                onPress: () {
                  homeVM.refreshApi();
                },
              );
            }

          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeVM.userListModel.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                      homeVM.userListModel.value.data![index].avatar.toString(),
                    )),
                    title: Text(
                        "${homeVM.userListModel.value.data![index].firstName.toString() + " " + homeVM.userListModel.value.data![index].lastName.toString()}"),
                    subtitle: Text(homeVM.userListModel.value.data![index].email
                        .toString()),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
