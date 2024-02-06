import 'package:covid19/core/data/dtos/user_model_dto.dart';


class UserModel {
  String? typeDoc;
  String? number;
  String? password;

  UserModel({
     this.typeDoc,
     this.number,
     this.password,
  });

  UserModel.formUserDTO(UserDTO userDTO) {
    typeDoc = userDTO.typeDoc;
    number = userDTO.number;
    password = userDTO.password;
  }


  static UserModel? fromDTO({
    required UserDTO dto,
    required bool hasPassword
  }) {
    if (dto.typeDoc == null || dto.number == null) {
      return null;
    }
    return UserModel(
      typeDoc: dto.typeDoc,
      number: dto.number,
      password: dto.password,
    );
  }
}
