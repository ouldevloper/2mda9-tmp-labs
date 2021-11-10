import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  int val = 0;
  TestCubit() : super(TestInitial());

  Future<void> incrcrease() async {
    val += 1;
    emit(plusplus(val: val));
  }

  Future<void> decrease() async {
    val -= 1;
    emit(minusminus(val: val));
  }
}
