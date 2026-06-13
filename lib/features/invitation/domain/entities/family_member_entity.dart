class FamilyMemberEntity {
  final String father;
  final String mother;
  final String surname;
  final String? description;

  const FamilyMemberEntity({
    required this.father,
    required this.mother,
    required this.surname,
    this.description,
  });
}
