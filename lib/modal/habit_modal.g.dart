// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_modal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitModalCollection on Isar {
  IsarCollection<HabitModal> get habitModals => this.collection();
}

const HabitModalSchema = CollectionSchema(
  name: r'HabitModal',
  id: 4225345724369929802,
  properties: {
    r'complereDays': PropertySchema(
      id: 0,
      name: r'complereDays',
      type: IsarType.dateTimeList,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _habitModalEstimateSize,
  serialize: _habitModalSerialize,
  deserialize: _habitModalDeserialize,
  deserializeProp: _habitModalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _habitModalGetId,
  getLinks: _habitModalGetLinks,
  attach: _habitModalAttach,
  version: '3.1.0+1',
);

int _habitModalEstimateSize(
  HabitModal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.complereDays.length * 8;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _habitModalSerialize(
  HabitModal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTimeList(offsets[0], object.complereDays);
  writer.writeString(offsets[1], object.name);
}

HabitModal _habitModalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitModal();
  object.complereDays = reader.readDateTimeList(offsets[0]) ?? [];
  object.id = id;
  object.name = reader.readString(offsets[1]);
  return object;
}

P _habitModalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _habitModalGetId(HabitModal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _habitModalGetLinks(HabitModal object) {
  return [];
}

void _habitModalAttach(IsarCollection<dynamic> col, Id id, HabitModal object) {
  object.id = id;
}

extension HabitModalQueryWhereSort
    on QueryBuilder<HabitModal, HabitModal, QWhere> {
  QueryBuilder<HabitModal, HabitModal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HabitModalQueryWhere
    on QueryBuilder<HabitModal, HabitModal, QWhereClause> {
  QueryBuilder<HabitModal, HabitModal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<HabitModal, HabitModal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterWhereClause> idBetween(
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
}

extension HabitModalQueryFilter
    on QueryBuilder<HabitModal, HabitModal, QFilterCondition> {
  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complereDays',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'complereDays',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'complereDays',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'complereDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'complereDays',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'complereDays',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'complereDays',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'complereDays',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'complereDays',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition>
      complereDaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'complereDays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension HabitModalQueryObject
    on QueryBuilder<HabitModal, HabitModal, QFilterCondition> {}

extension HabitModalQueryLinks
    on QueryBuilder<HabitModal, HabitModal, QFilterCondition> {}

extension HabitModalQuerySortBy
    on QueryBuilder<HabitModal, HabitModal, QSortBy> {
  QueryBuilder<HabitModal, HabitModal, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension HabitModalQuerySortThenBy
    on QueryBuilder<HabitModal, HabitModal, QSortThenBy> {
  QueryBuilder<HabitModal, HabitModal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<HabitModal, HabitModal, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension HabitModalQueryWhereDistinct
    on QueryBuilder<HabitModal, HabitModal, QDistinct> {
  QueryBuilder<HabitModal, HabitModal, QDistinct> distinctByComplereDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complereDays');
    });
  }

  QueryBuilder<HabitModal, HabitModal, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension HabitModalQueryProperty
    on QueryBuilder<HabitModal, HabitModal, QQueryProperty> {
  QueryBuilder<HabitModal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HabitModal, List<DateTime>, QQueryOperations>
      complereDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complereDays');
    });
  }

  QueryBuilder<HabitModal, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
