import '../user_database_provider.dart';

class User {
  int id;
  int role;
  String roleName;
  String roleDescription;
  String entityType;
  String entityId;
  String entityName;
  String userId;
  String first;
  String last;
  String photo;
  String refreshToken;
  String accessToken;
  String subcriptionToken;

  User(
      {this.id,
      this.role,
      this.roleName,
      this.roleDescription,
      this.entityType,
      this.entityId,
      this.entityName,
      this.userId,
      this.first,
      this.last,
      this.photo,
      this.refreshToken,
      this.accessToken,
      this.subcriptionToken});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      UserProvider.ROLE: role,
      UserProvider.ROLE_NAME: roleName,
      UserProvider.ROLE_DESCRIPTION: roleDescription,
      UserProvider.ENTITY_NAME: entityName,
      UserProvider.ENTITY_ID: entityId,
      UserProvider.ENTITY_TYPE: entityType,
      UserProvider.USER_ID: userId,
      UserProvider.FIRST: first,
      UserProvider.LAST: last,
      UserProvider.PHOTO: photo,
      UserProvider.REFRESH_TOKEN: refreshToken,
      UserProvider.ACCESS_TOKEN: accessToken,
      UserProvider.SUBCRIPTION_TOKEN: subcriptionToken,
    };

    if (id != null) {
      map[UserProvider.COLUMN_ID] = id;
    }

    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map[UserProvider.COLUMN_ID];
    role = map[UserProvider.ROLE];
    roleName = map[UserProvider.ROLE_NAME];
    roleDescription = map[UserProvider.ROLE_DESCRIPTION];
    entityType = map[UserProvider.ENTITY_TYPE];
    entityId = map[UserProvider.ENTITY_ID];
    entityName = map[UserProvider.ENTITY_NAME];
    userId = map[UserProvider.USER_ID];
    first = map[UserProvider.FIRST];
    last = map[UserProvider.LAST];
    photo = map[UserProvider.PHOTO];
    refreshToken = map[UserProvider.REFRESH_TOKEN];
    accessToken = map[UserProvider.ACCESS_TOKEN];
    subcriptionToken = map[UserProvider.SUBCRIPTION_TOKEN];
  }
}
