class DataModel {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  DataModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.image,
      required this.credit,
      required this.points,
      required this.token});

  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      image: jsonData['image'],
      points: jsonData['points'],
      credit: jsonData['credit'],
      token: jsonData['token'],
    );
  }
}
//-------------------------------------------------
class LoginModel {
  String status;

  String message;

  List<DataModel> data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      status: jsonData['status'],
      message: jsonData['message'],
      data: (jsonData['data'] as List).map((e) => DataModel.fromJson(e)).toList(),
    );
  }
}
