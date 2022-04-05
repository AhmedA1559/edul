import 'package:dio/dio.dart';
import 'package:edul/const.dart';
import 'package:edul/service/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InviteManager {
  final Ref _ref;
  final Dio _dio = Dio(BaseOptions(
    baseUrl: FirebaseConst.REPOSITORY,
  ));

  InviteManager(this._ref);

  Future<void> _refreshToken() async {
    _dio.options.headers["Authorization"] = "Bearer ${await _ref.read(authStateChangesProvider).value!.getIdToken()}";
  }

  createInvite(String groupId) async {
    await _refreshToken();

    final inviteResp = await _dio.get('/createInvite', queryParameters:{
      'listID': groupId
    });

    return inviteResp.data.toString();
  }

  joinInvite(String inviteCode) async {
    await _refreshToken();

    final inviteResp = await _dio.get('/joinInvite', queryParameters:{
      'inviteId': inviteCode
    });

    return inviteResp.statusCode;
  }

}