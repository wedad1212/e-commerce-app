// ignore_for_file: unnecessary_null_comparison

class UserModel {
  String userId = '';
  
  String phone;
  String email;
  String image;
  String name;
  UserModel({
 
    required this.email,
    required this.phone,
    required this.image,
    required this.userId,
    required this.name,
  });

  UserModel fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return UserModel(
          email: '', phone: '', userId: '',  image: '', name: '');
    } else {
      return UserModel(
        userId: map['userId'],
        phone: map['phone'],
        image: map['image'],
        email: map['email'],
        name:map['name']
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
   
      'phone': phone,
      'image': image,
      'name':name,
    };
  }
}
