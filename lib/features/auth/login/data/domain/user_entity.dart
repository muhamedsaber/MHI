class UserEntity {
  final String? token;
  final String? username;
  final String? id;
  final String? password;
  final String? name;
  final String? specialize;
  final String? hospitalId;
  final String? image;
  final String? userCode;
  final String? role;
  final String? hospitalName;
  final String? hospitalAddress;
  final String? hospitalRole;
  final String? hospitalCode;
  final String? birthday;
  final String? height;
  final String? weight;
  final String? address;
  final String? mobileNumber;
  final String? bloodType;
  UserEntity(
 {this.userCode,
      this.hospitalAddress,
      this.hospitalId,
      this.hospitalName,
      this.hospitalRole,
      this.id,
      this.image,
      this.name,
      this.password,
      this.role,
      this.specialize,
      this.token,
      this.username,
      this.hospitalCode,
      this.birthday,
      this.height,
      this.weight,
      this.address,
      this.mobileNumber,
      this.bloodType});
}
