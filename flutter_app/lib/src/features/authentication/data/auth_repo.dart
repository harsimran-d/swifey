import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    hide Options;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swifey/src/features/authentication/application/fake_auth_service.dart';

import '../domain/app_user.dart';

part 'auth_repo.g.dart';

class AuthRepo {
  AuthRepo({required this.dio, required this.storage});
  final Dio dio;
  final FlutterSecureStorage storage;
  AppUser? _appUser;

  AppUser? get currentUser => _appUser;
  final _authStateController = StreamController<AppUser?>.broadcast();
  Stream<AppUser?> authStateChanges() => _authStateController.stream;

  Future<void> logOut() async {
    storage.delete(key: 'user');
    _appUser = null;
    _authStateController.add(null);
  }

  Future<bool> getSignedInUser() async {
    final userRaw = await storage.read(key: 'user');
    if (userRaw == null) return false;
    try {
      final userDecoded = json.decode(userRaw) as Map<String, dynamic>;
      final user = AppUser.fromJson(userDecoded);
      _appUser = user;
      _authStateController.add(_appUser);
      return true;
    } catch (e) {
      print("Failed to decode user data: $e");
      return false;
    }
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    print("Login user with $firstName, $lastName, $password");
    // TODO: Call the backend api
    return false;
  }

  Future<bool> sendVerificationEmail({required String email}) async {
    // TODO: Send the reques to backend to send verification email
    print("Verification email sent to $email");
    return true;
  }

  Future<bool> verifyOtp({required String otp}) async {
    // TODO: Send the reques to backend to send verification email
    print("Verify OTP on the backedn  $otp");
    return true;
  }

  Future<bool> signInWithFakeUser() async {
    final user = FakeAuthService.fakeAppUser;
    _appUser = user;
    await storage.write(key: 'user', value: json.encode(user.toJson()));
    print("success signin with fake user");
    _authStateController.add(_appUser);
    return true;
  }

  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await dio
          .post('/signin', data: {"email": email, "password": password});

      if (response.data['message'] == "User found") {
        final user =
            AppUser.fromJson(response.data['data'] as Map<String, dynamic>);
        _appUser = user;
        await storage.write(key: 'user', value: json.encode(user.toJson()));
        print("success signin");
        _authStateController.add(_appUser);
        return true;
      }
    } catch (e) {
      if (e is DioException) {
        print("Error during sign-in:");
        print('$e');
      } else {
        print("Unexpected error: $e");
      }
      return false;
    }

    return false;
  }

  Future<void> signOut() async {
    await logOut();
  }
}

@Riverpod(keepAlive: true)
Dio dioRepo(Ref ref) {
  if (kDebugMode) {
    final options = BaseOptions(
      headers: {"Content-Type": 'application/json'},
      baseUrl: 'http://localhost:3000/api/mobile',
    );
    return Dio(options);
  }
  throw UnimplementedError('Dio for production not setup.');
}

@Riverpod(keepAlive: true)
FlutterSecureStorage ssRepo(Ref ref) {
  return const FlutterSecureStorage();
}

@Riverpod(keepAlive: true)
AuthRepo authRepo(Ref ref) {
  final dio = ref.watch(dioRepoProvider);
  final ss = ref.watch(ssRepoProvider);
  return AuthRepo(
    dio: dio,
    storage: ss,
  );
}

@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(Ref ref) {
  final authRepo = ref.watch(authRepoProvider);
  return authRepo.authStateChanges();
}
