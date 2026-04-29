abstract class Failures {
  final String message;
  const Failures({required this.message});
}

class DatabaseFailure extends Failures {
  DatabaseFailure({required super.message});
}
