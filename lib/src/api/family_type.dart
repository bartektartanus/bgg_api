enum FamilyType { rpg, rpgperiodical, boardgamefamily }

extension FamilyTypeName on FamilyType {
  String name() {
    return toString().split('.').last;
  }
}
