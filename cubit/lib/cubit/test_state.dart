part of 'test_cubit.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class plusplus extends TestState {
  final int val;
  plusplus({required this.val});
}

class minusminus extends TestState {
  final int val;
  minusminus({required this.val});
}
