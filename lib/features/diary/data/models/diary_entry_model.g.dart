// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDiaryEntryModelCollection on Isar {
  IsarCollection<DiaryEntryModel> get diaryEntryModels => this.collection();
}

const DiaryEntryModelSchema = CollectionSchema(
  name: r'DiaryEntryModel',
  id: -6915924070217806976,
  properties: {
    r'clientId': PropertySchema(
      id: 0,
      name: r'clientId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'encryptedContent': PropertySchema(
      id: 2,
      name: r'encryptedContent',
      type: IsarType.string,
    ),
    r'entryDate': PropertySchema(
      id: 3,
      name: r'entryDate',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 4,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _diaryEntryModelEstimateSize,
  serialize: _diaryEntryModelSerialize,
  deserialize: _diaryEntryModelDeserialize,
  deserializeProp: _diaryEntryModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'clientId': IndexSchema(
      id: 2639372232964765565,
      name: r'clientId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'clientId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'entryDate': IndexSchema(
      id: 4711483602383013270,
      name: r'entryDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'entryDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isSynced': IndexSchema(
      id: -39763503327887510,
      name: r'isSynced',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isSynced',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _diaryEntryModelGetId,
  getLinks: _diaryEntryModelGetLinks,
  attach: _diaryEntryModelAttach,
  version: '3.1.0+1',
);

int _diaryEntryModelEstimateSize(
  DiaryEntryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.clientId.length * 3;
  bytesCount += 3 + object.encryptedContent.length * 3;
  return bytesCount;
}

void _diaryEntryModelSerialize(
  DiaryEntryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.clientId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.encryptedContent);
  writer.writeDateTime(offsets[3], object.entryDate);
  writer.writeBool(offsets[4], object.isDeleted);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeDateTime(offsets[6], object.updatedAt);
}

DiaryEntryModel _diaryEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DiaryEntryModel();
  object.clientId = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.encryptedContent = reader.readString(offsets[2]);
  object.entryDate = reader.readDateTime(offsets[3]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[4]);
  object.isSynced = reader.readBool(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  return object;
}

P _diaryEntryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _diaryEntryModelGetId(DiaryEntryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _diaryEntryModelGetLinks(DiaryEntryModel object) {
  return [];
}

void _diaryEntryModelAttach(
    IsarCollection<dynamic> col, Id id, DiaryEntryModel object) {
  object.id = id;
}

extension DiaryEntryModelByIndex on IsarCollection<DiaryEntryModel> {
  Future<DiaryEntryModel?> getByClientId(String clientId) {
    return getByIndex(r'clientId', [clientId]);
  }

  DiaryEntryModel? getByClientIdSync(String clientId) {
    return getByIndexSync(r'clientId', [clientId]);
  }

  Future<bool> deleteByClientId(String clientId) {
    return deleteByIndex(r'clientId', [clientId]);
  }

  bool deleteByClientIdSync(String clientId) {
    return deleteByIndexSync(r'clientId', [clientId]);
  }

  Future<List<DiaryEntryModel?>> getAllByClientId(List<String> clientIdValues) {
    final values = clientIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'clientId', values);
  }

  List<DiaryEntryModel?> getAllByClientIdSync(List<String> clientIdValues) {
    final values = clientIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'clientId', values);
  }

  Future<int> deleteAllByClientId(List<String> clientIdValues) {
    final values = clientIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'clientId', values);
  }

  int deleteAllByClientIdSync(List<String> clientIdValues) {
    final values = clientIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'clientId', values);
  }

  Future<Id> putByClientId(DiaryEntryModel object) {
    return putByIndex(r'clientId', object);
  }

  Id putByClientIdSync(DiaryEntryModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'clientId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByClientId(List<DiaryEntryModel> objects) {
    return putAllByIndex(r'clientId', objects);
  }

  List<Id> putAllByClientIdSync(List<DiaryEntryModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'clientId', objects, saveLinks: saveLinks);
  }
}

extension DiaryEntryModelQueryWhereSort
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QWhere> {
  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhere> anyEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'entryDate'),
      );
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhere> anyIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isSynced'),
      );
    });
  }
}

extension DiaryEntryModelQueryWhere
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QWhereClause> {
  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      clientIdEqualTo(String clientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientId',
        value: [clientId],
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      clientIdNotEqualTo(String clientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientId',
              lower: [],
              upper: [clientId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientId',
              lower: [clientId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientId',
              lower: [clientId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientId',
              lower: [],
              upper: [clientId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      entryDateEqualTo(DateTime entryDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'entryDate',
        value: [entryDate],
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      entryDateNotEqualTo(DateTime entryDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryDate',
              lower: [],
              upper: [entryDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryDate',
              lower: [entryDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryDate',
              lower: [entryDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryDate',
              lower: [],
              upper: [entryDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      entryDateGreaterThan(
    DateTime entryDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'entryDate',
        lower: [entryDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      entryDateLessThan(
    DateTime entryDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'entryDate',
        lower: [],
        upper: [entryDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      entryDateBetween(
    DateTime lowerEntryDate,
    DateTime upperEntryDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'entryDate',
        lower: [lowerEntryDate],
        includeLower: includeLower,
        upper: [upperEntryDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      isSyncedEqualTo(bool isSynced) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isSynced',
        value: [isSynced],
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterWhereClause>
      isSyncedNotEqualTo(bool isSynced) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [],
              upper: [isSynced],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [isSynced],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [isSynced],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [],
              upper: [isSynced],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DiaryEntryModelQueryFilter
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QFilterCondition> {
  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientId',
        value: '',
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      clientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientId',
        value: '',
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encryptedContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encryptedContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encryptedContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'encryptedContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'encryptedContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'encryptedContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'encryptedContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedContent',
        value: '',
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      encryptedContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encryptedContent',
        value: '',
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      entryDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      entryDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      entryDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      entryDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DiaryEntryModelQueryObject
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QFilterCondition> {}

extension DiaryEntryModelQueryLinks
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QFilterCondition> {}

extension DiaryEntryModelQuerySortBy
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QSortBy> {
  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByClientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientId', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByClientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientId', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByEncryptedContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedContent', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByEncryptedContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedContent', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByEntryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DiaryEntryModelQuerySortThenBy
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QSortThenBy> {
  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByClientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientId', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByClientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientId', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByEncryptedContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedContent', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByEncryptedContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedContent', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByEntryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DiaryEntryModelQueryWhereDistinct
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QDistinct> {
  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QDistinct> distinctByClientId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QDistinct>
      distinctByEncryptedContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encryptedContent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QDistinct>
      distinctByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryDate');
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<DiaryEntryModel, DiaryEntryModel, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension DiaryEntryModelQueryProperty
    on QueryBuilder<DiaryEntryModel, DiaryEntryModel, QQueryProperty> {
  QueryBuilder<DiaryEntryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DiaryEntryModel, String, QQueryOperations> clientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientId');
    });
  }

  QueryBuilder<DiaryEntryModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DiaryEntryModel, String, QQueryOperations>
      encryptedContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encryptedContent');
    });
  }

  QueryBuilder<DiaryEntryModel, DateTime, QQueryOperations>
      entryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryDate');
    });
  }

  QueryBuilder<DiaryEntryModel, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<DiaryEntryModel, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<DiaryEntryModel, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
