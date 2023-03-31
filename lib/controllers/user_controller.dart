import 'package:food_delivery/models/response_model.dart';
import 'package:get/get.dart';

import '../data/repository/user_repo.dart';

import '../models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({
    required this.userRepo,
  });
  UserModel? _userModel;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  // late UserModel _userModel;
  // UserModel get userModel => _userModel;

  UserModel? get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successsfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
