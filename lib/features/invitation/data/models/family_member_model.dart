import '../../domain/entities/family_member_entity.dart';

class FamilyMemberModel extends FamilyMemberEntity {
  const FamilyMemberModel({
    required super.father,
    required super.mother,
    required super.surname,
    super.description,
  });

  factory FamilyMemberModel.fromMap(Map<String, dynamic> map) {
    return FamilyMemberModel(
      father: map['father'] ?? '',
      mother: map['mother'] ?? '',
      surname: map['surname'] ?? '',
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'father': father,
      'mother': mother,
      'surname': surname,
      if (description != null) 'description': description,
    };
  }
}
