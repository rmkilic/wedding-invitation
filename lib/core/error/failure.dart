class Failure {
  final String message;

  const Failure(this.message);
}

class RemoteConfigFailure
    extends Failure {

  const RemoteConfigFailure()
      : super(
          'Davetiye bilgileri alınamadı.',
        );
}