import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_interface_record.g.dart';

abstract class UserInterfaceRecord
    implements Built<UserInterfaceRecord, UserInterfaceRecordBuilder> {
  static Serializer<UserInterfaceRecord> get serializer =>
      _$userInterfaceRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'What_You_Think')
  String get whatYouThink;

  @nullable
  @BuiltValueField(wireName: 'Age')
  String get age;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'City')
  String get city;

  @nullable
  @BuiltValueField(wireName: 'State')
  String get state;

  @nullable
  @BuiltValueField(wireName: 'ProfileDescription')
  String get profileDescription;

  @nullable
  @BuiltValueField(wireName: 'Height')
  String get height;

  @nullable
  @BuiltValueField(wireName: 'Kids')
  String get kids;

  @nullable
  String get wantKids;

  @nullable
  String get mStatus;

  @nullable
  @BuiltValueField(wireName: 'Denomination')
  String get denomination;

  @nullable
  @BuiltValueField(wireName: 'Church')
  String get church;

  @nullable
  @BuiltValueField(wireName: 'Ocupation')
  String get ocupation;

  @nullable
  @BuiltValueField(wireName: 'Level_of_Study')
  String get levelOfStudy;

  @nullable
  @BuiltValueField(wireName: 'where_grew_up')
  String get whereGrewUp;

  @nullable
  @BuiltValueField(wireName: 'User_Lenguage')
  String get userLenguage;

  @nullable
  @BuiltValueField(wireName: 'Drink')
  String get drink;

  @nullable
  @BuiltValueField(wireName: 'Smoke')
  String get smoke;

  @nullable
  @BuiltValueField(wireName: 'First_Date_Plan')
  String get firstDatePlan;

  @nullable
  @BuiltValueField(wireName: 'What_Do_You_Like_To_do')
  String get whatDoYouLikeToDo;

  @nullable
  @BuiltValueField(wireName: 'Gender')
  String get gender;

  @nullable
  @BuiltValueField(wireName: 'R_Goal')
  String get rGoal;

  @nullable
  @BuiltValueField(wireName: 'Mile_Distance')
  String get mileDistance;

  @nullable
  DocumentReference get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  DocumentReference get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  DocumentReference get photoUrl;

  @nullable
  DocumentReference get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DocumentReference get createdTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserInterfaceRecordBuilder builder) => builder
    ..whatYouThink = ''
    ..age = ''
    ..phoneNumber = ''
    ..city = ''
    ..state = ''
    ..profileDescription = ''
    ..height = ''
    ..kids = ''
    ..wantKids = ''
    ..mStatus = ''
    ..denomination = ''
    ..church = ''
    ..ocupation = ''
    ..levelOfStudy = ''
    ..whereGrewUp = ''
    ..userLenguage = ''
    ..drink = ''
    ..smoke = ''
    ..firstDatePlan = ''
    ..whatDoYouLikeToDo = ''
    ..gender = ''
    ..rGoal = ''
    ..mileDistance = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User_Interface');

  static Stream<UserInterfaceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserInterfaceRecord._();
  factory UserInterfaceRecord(
          [void Function(UserInterfaceRecordBuilder) updates]) =
      _$UserInterfaceRecord;

  static UserInterfaceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserInterfaceRecordData({
  String whatYouThink,
  String age,
  String phoneNumber,
  String city,
  String state,
  String profileDescription,
  String height,
  String kids,
  String wantKids,
  String mStatus,
  String denomination,
  String church,
  String ocupation,
  String levelOfStudy,
  String whereGrewUp,
  String userLenguage,
  String drink,
  String smoke,
  String firstDatePlan,
  String whatDoYouLikeToDo,
  String gender,
  String rGoal,
  String mileDistance,
  DocumentReference email,
  DocumentReference displayName,
  DocumentReference photoUrl,
  DocumentReference uid,
  DocumentReference createdTime,
}) =>
    serializers.toFirestore(
        UserInterfaceRecord.serializer,
        UserInterfaceRecord((u) => u
          ..whatYouThink = whatYouThink
          ..age = age
          ..phoneNumber = phoneNumber
          ..city = city
          ..state = state
          ..profileDescription = profileDescription
          ..height = height
          ..kids = kids
          ..wantKids = wantKids
          ..mStatus = mStatus
          ..denomination = denomination
          ..church = church
          ..ocupation = ocupation
          ..levelOfStudy = levelOfStudy
          ..whereGrewUp = whereGrewUp
          ..userLenguage = userLenguage
          ..drink = drink
          ..smoke = smoke
          ..firstDatePlan = firstDatePlan
          ..whatDoYouLikeToDo = whatDoYouLikeToDo
          ..gender = gender
          ..rGoal = rGoal
          ..mileDistance = mileDistance
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime));
