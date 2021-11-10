import 'package:cubit/cubit/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  int val = 1;
  @override
  Widget build(BuildContext context) {
    print("this is builder method ${val}");
    val += 1;
    return BlocProvider(
        create: (_) => TestCubit(),
        child: BlocBuilder<TestCubit, TestState>(
            builder: (BuildContext context, state) {
          final test = context.read<TestCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text("hello world"),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        test.incrcrease();
                      },
                      icon: Icon(Icons.plus_one)),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("${test.val}"),
                  ),
                  IconButton(
                      onPressed: () {
                        test.decrease();
                      },
                      icon: Icon(Icons.exposure_minus_1)),
                ],
              ),
            ),
          );
        }));
  }
}
