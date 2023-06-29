import 'package:mobx/mobx.dart';
import 'package:newbankapp/src/model/user.dart';

import '../service/user_service.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final UserService _service = UserService();

  @observable
  User user = User(
    id: 0,
    firstName: '',
    lastName: '',
    cpf: '',
    userToken: '',
    balance: 0,
  );

  @action
  Future<void> register(String firstName, String lastName, String cpf,
      String email, String phone, String password) async {
    try {
      var response = await _service.register(
          firstName, lastName, cpf, email, phone, password);
      user = response;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> login(String email, String password) async {}

  @action
  Future<void> signOut(String email) async {
    try {} catch (e) {}
  }

  @action
  Future<void> changePassword(String email) async {
    try {} catch (e) {}
  }
}
