import 'package:swifey/src/features/authentication/domain/app_user.dart';

class FakeAuthService {
  static final fakeAppUser = AppUser(
      id: '1',
      name: 'Harsimranjit Dhaliwal',
      email: 'harsimranyadu@gmail.com',
      token: 'randomtokenforharsimran');
}
