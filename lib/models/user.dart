enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({
    this.id,
    this.name,
    this.apelido,
    this.email,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR,
    this.createdAt,
    this.carteira,
  });
  String id;
  String name;
  String apelido;
  String email;
  String phone;
  String password;
  UserType type;
  DateTime createdAt;
  double carteira;

  @override
  String toString() {
    return 'User{id: $id, name: $name, apelido: $apelido, email: $email, phone: $phone, password: $password, type: $type, createdAt: $createdAt, $carteira}';
  }
}
