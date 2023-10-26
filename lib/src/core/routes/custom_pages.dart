import 'package:get/get.dart';
import 'package:your_matter/src/views/views.dart';

List<GetPage<dynamic>> customGetPages = [
  GetPage(name: '/home', page: () => HomePage()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/logon', page: () => const LogonPage()),
  GetPage(name: '/account', page: () => const AccountPage()),
  GetPage(name: '/recoveryPass', page: () => const RecoveryPassPage()),
];