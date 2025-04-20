abstract class EmailAuthRepositoryAbs {
  Future<bool> signUp(
      {required String emailAddress,
      required String password,
      required String name});
  Future<bool> signIn({
    required String emailAddress,
    required String password,
  });
}
