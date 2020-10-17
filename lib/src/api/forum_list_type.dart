enum ForumListType { thing, family }

extension ForumListTypeName on ForumListType {
  String name() {
    return toString().split('.').last;
  }
}
