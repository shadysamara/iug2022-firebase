class IugUser {
  String? id;
  String fName;
  String lName;
  String email;
  String city;
  String password;
  IugUser(
      {
         this.id,
        required this.fName,
      required this.lName,
      required this.email,
      required this.city,
      required this.password});
  toMap() {
    return {'fName': fName, "lName": lName, "email": email, "city": city};
  }
}
