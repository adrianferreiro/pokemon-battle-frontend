abstract class Either<L, R> {
  T fold<T>(T Function(L left) leftFn, T Function(R right) rightFn);
  bool isLeft();
  bool isRight();
}

class Left<L, R> extends Either<L, R> {
  final L value;
  Left(this.value);
  @override
  T fold<T>(T Function(L left) leftFn, T Function(R right) rightFn) =>
      leftFn(value);
  @override
  bool isLeft() => true;
  @override
  bool isRight() => false;
}

class Right<L, R> extends Either<L, R> {
  final R value;
  Right(this.value);
  @override
  T fold<T>(T Function(L left) leftFn, T Function(R right) rightFn) =>
      rightFn(value);
  @override
  bool isLeft() => false;
  @override
  bool isRight() => true;
}
