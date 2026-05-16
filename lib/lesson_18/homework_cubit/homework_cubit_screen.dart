import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hw/lesson_18/homework_cubit/counter_cubit.dart';
import 'package:flutter_hw/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class HomeworkCubitScreen extends StatelessWidget {
  const HomeworkCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Лічильник (Cubit)'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 350),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 227, 136, 130),
                  ),
                  onPressed: () => context.read<CounterCubit>().increment(),
                  child: Text('+', style: TextStyle(fontSize: 30)),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().reset(),
                  child: Text('Reset', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 170, 203, 230),
                  ),
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  child: Text('-', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoutesNames.homework11Cubit);
              },
              child: Text('На новий екран'),
            ),
          ],
        ),
      ),
    );
  }
}
