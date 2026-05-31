import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hw/lesson_22/error_handling_homework/data/repository/fake_user_repository.dart';
import 'package:flutter_hw/lesson_22/error_handling_homework/presentation/cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.repository) : super(UserProfileLoading());

  final FakeUserRepository repository;

  Future<void> loadUserProfile({bool shouldFail = true}) async {
    emit(UserProfileLoading());

    try {
      final user = await repository.getUserProfile(shouldFail);

      emit(UserProfileLoaded(user));
    } on CustomServerError catch (error) {
      emit(UserProfileServerError(error.message));
    } catch (_) {
      emit(const UserProfileUnknownError('Something went wrong'));
    }
  }
}
