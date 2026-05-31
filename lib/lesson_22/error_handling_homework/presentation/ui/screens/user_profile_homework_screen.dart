import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hw/lesson_22/error_handling_homework/data/repository/entity/user_entity.dart';
import 'package:flutter_hw/lesson_22/error_handling_homework/presentation/cubit/user_profile_cubit.dart';
import 'package:flutter_hw/lesson_22/error_handling_homework/presentation/cubit/user_profile_state.dart';

class UserProfileHomeworkScreen extends StatefulWidget {
  const UserProfileHomeworkScreen({super.key});

  @override
  State<UserProfileHomeworkScreen> createState() =>
      _UserProfileHomeworkScreenState();
}

class _UserProfileHomeworkScreenState extends State<UserProfileHomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile Homework')),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return switch (state) {
            UserProfileLoading() => const Center(
              child: CircularProgressIndicator(),
            ),

            UserProfileLoaded() => _LoadedProfileWidget(user: state.user),

            UserProfileServerError() => _ErrorProfileWidget(
              title: 'Помилка сервера',
              message: state.message,
              onRetry: () {
                context.read<UserProfileCubit>().loadUserProfile(
                  shouldFail: false,
                );
              },
            ),

            UserProfileUnknownError() => _ErrorProfileWidget(
              title: 'Невідома помилка',
              message: state.message,
              onRetry: () {
                context.read<UserProfileCubit>().loadUserProfile(
                  shouldFail: false,
                );
              },
            ),
          };
        },
      ),
    );
  }
}

class _LoadedProfileWidget extends StatelessWidget {
  const _LoadedProfileWidget({required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text('ID: ${user.id}'),
                const SizedBox(height: 16),
                const Text(
                  'Профіль успішно завантажено!',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorProfileWidget extends StatelessWidget {
  const _ErrorProfileWidget({
    required this.title,
    required this.message,
    required this.onRetry,
  });

  final String title;
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 56,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: onRetry,
                  child: const Text('Спробувати знову'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
