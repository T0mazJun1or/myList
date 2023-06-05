import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/user_model.dart';
import '../repositories/users_repository.dart';

class UserController extends GetxController {
  final user = UserRepository();
  RxList<UserModel> listUsers = RxList<UserModel>([]);
  RxBool isLoading = false.obs;

  Future getUsers() async {
    isLoading.value = true;
    List<UserModel> result = await user.getAll();
    if (result.isNotEmpty) {
      listUsers.assignAll(result);
    } else {
      print("Error");
    }
    isLoading.value = false;
  }
}
