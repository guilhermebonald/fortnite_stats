// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fortnite_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FortniteController on _FortniteControllerBase, Store {
  final _$dataAtom = Atom(name: '_FortniteControllerBase.data');

  @override
  FortniteModel get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(FortniteModel value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$nickNameAtom = Atom(name: '_FortniteControllerBase.nickName');

  @override
  String get nickName {
    _$nickNameAtom.reportRead();
    return super.nickName;
  }

  @override
  set nickName(String value) {
    _$nickNameAtom.reportWrite(value, super.nickName, () {
      super.nickName = value;
    });
  }

  final _$platformAtom = Atom(name: '_FortniteControllerBase.platform');

  @override
  String get platform {
    _$platformAtom.reportRead();
    return super.platform;
  }

  @override
  set platform(String value) {
    _$platformAtom.reportWrite(value, super.platform, () {
      super.platform = value;
    });
  }

  final _$_FortniteControllerBaseActionController =
      ActionController(name: '_FortniteControllerBase');

  @override
  dynamic _setData(FortniteModel value) {
    final _$actionInfo = _$_FortniteControllerBaseActionController.startAction(
        name: '_FortniteControllerBase._setData');
    try {
      return super._setData(value);
    } finally {
      _$_FortniteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic bridgeNickName(String value) {
    final _$actionInfo = _$_FortniteControllerBaseActionController.startAction(
        name: '_FortniteControllerBase.bridgeNickName');
    try {
      return super.bridgeNickName(value);
    } finally {
      _$_FortniteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlatform(String value) {
    final _$actionInfo = _$_FortniteControllerBaseActionController.startAction(
        name: '_FortniteControllerBase.setPlatform');
    try {
      return super.setPlatform(value);
    } finally {
      _$_FortniteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
nickName: ${nickName},
platform: ${platform}
    ''';
  }
}
