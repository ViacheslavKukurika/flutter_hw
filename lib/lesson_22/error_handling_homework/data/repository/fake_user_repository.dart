import 'package:flutter_hw/lesson_22/error_handling_homework/data/repository/entity/user_entity.dart';

class FakeUserRepository {
  Future<UserEntity> getUserProfile(bool shouldFail) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));

      if (shouldFail) {
        throw Exception('Server is temporarily unavailable');
      }

      return UserEntity(id: '1', name: 'Test User');
    } on Exception catch (error) {
      if (error.toString().contains('Server is temporarily unavailable')) {
        throw const CustomServerError();
      }

      rethrow;
    }
  }
}

class CustomServerError implements Exception {
  const CustomServerError([
    this.message = 'Server is temporarily unavailable',
  ]);

  final String message;

  @override
  String toString() => message;
}
