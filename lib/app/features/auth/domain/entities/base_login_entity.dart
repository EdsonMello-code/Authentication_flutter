abstract class BaseLoginEntity {
  final String email;
  final String name;
  final String token;

  final int id;

  const BaseLoginEntity(
      {required this.email,
      required this.name,
      required this.token,
      required this.id});
}
