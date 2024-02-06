import 'package:covid19/core/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model_dto.g.dart';
@JsonSerializable()
class UserDTO{
  String? typeDoc;
  String? number;
  String? password;

  UserDTO({
     this.typeDoc,
     this.number,
     this.password,
  });

  factory UserDTO.fromModel({ required UserModel model }) {
    return UserDTO(
      typeDoc: model.typeDoc,
      number: model.number,
      password: model.password,
    );
  }

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}