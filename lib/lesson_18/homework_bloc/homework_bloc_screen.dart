import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hw/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:flutter_hw/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class HomeworkBlocScreen extends StatefulWidget {
  const HomeworkBlocScreen({super.key});

  @override
  State<HomeworkBlocScreen> createState() => HomeworkBlocScreenState();
}

class HomeworkBlocScreenState extends State<HomeworkBlocScreen> {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Лічильник (BLoC)'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 350),
            BlocBuilder<CounterBloc, int>(
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
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                    },
                  child: Text('+', style: TextStyle(fontSize: 30)),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(ResetEvent());
                  },
                  child: Text('Reset', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 170, 203, 230),
                  ),
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: Text('-', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  context.pushNamed(AppRoutesNames.homework11Bloc);
                });
              },
              child: Text('На новий екран'),
            ),
          ],
        ),
      ),
    );
  }
}
