import 'package:ibaza_mock_data/features/auth/data/models/authenticated_user.dart';
import 'package:hive/hive.dart';

void registerAdapters() {
  Hive.registerAdapter(AuthenticatedUserModelAdapter());
}
