import 'family_member_model.dart';
import '../../domain/entities/family_entity.dart';

class FamilyModel extends FamilyEntity {
  const FamilyModel({
    required super.bride,
    required super.groom,
  });

  factory FamilyModel.fromMap(Map<String, dynamic> map) {
    return FamilyModel(
      bride: FamilyMemberModel.fromMap(map['bride']),
      groom: FamilyMemberModel.fromMap(map['groom']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bride': (bride as FamilyMemberModel).toMap(),
      'groom': (groom as FamilyMemberModel).toMap(),
    };
  }
}
