// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$userAtom = Atom(name: 'UserStoreBase.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('UserStoreBase.register', context: context);

  @override
  Future<void> register(String firstName, String lastName, String cpf,
      String email, String phone, String password) {
    return _$registerAsyncAction.run(
        () => super.register(firstName, lastName, cpf, email, phone, password));
  }

  late final _$loginAsyncAction =
      AsyncAction('UserStoreBase.login', context: context);

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$signOutAsyncAction =
      AsyncAction('UserStoreBase.signOut', context: context);

  @override
  Future<void> signOut(String email) {
    return _$signOutAsyncAction.run(() => super.signOut(email));
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('UserStoreBase.changePassword', context: context);

  @override
  Future<void> changePassword(String email) {
    return _$changePasswordAsyncAction.run(() => super.changePassword(email));
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
