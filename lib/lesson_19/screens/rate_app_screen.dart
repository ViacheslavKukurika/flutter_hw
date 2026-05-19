import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hw/lesson_19/bloc/rate_app_cubit.dart';
import 'package:flutter_hw/lesson_19/widgets/rating_success_snack_bar_content.dart';
import 'package:flutter_hw/lesson_19/widgets/rating_widget.dart';
import 'package:go_router/go_router.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA5E0FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B3D70),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Flutter lab',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocConsumer<RateAppCubit, RateAppState>(
        listenWhen: (previous, current) {
          return previous.status != current.status;
        },
        listener: (context, state) {
          if (state.status == RateAppStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 3),
                backgroundColor: Color(0xFF656565),
                content: RatingSuccessSnackBarContent(),
              ),
            );
            context.pop();
          }
        },
        builder: (context, state) {
          return Align(
            alignment: Alignment.topCenter,
            child: RatingWidget(
              rating: state.rating,
              onRatingChanged: (rating) {
                context.read<RateAppCubit>().selectRating(rating);
              },
              onResetRating: () {
                context.read<RateAppCubit>().resetRating();
              },
              onSubmitRating: () {
                return context.read<RateAppCubit>().submitRating();
              },
              isLoading: state.status == RateAppStatus.loading,
            ),
          );
        },
      ),
    );
  }
}
