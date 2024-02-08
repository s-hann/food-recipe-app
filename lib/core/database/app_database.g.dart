// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FoodDetailsTable extends FoodDetails
    with TableInfo<$FoodDetailsTable, FoodDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String> idMeal = GeneratedColumn<String>(
      'id_meal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strMealMeta =
      const VerificationMeta('strMeal');
  @override
  late final GeneratedColumn<String> strMeal = GeneratedColumn<String>(
      'str_meal', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  @override
  late final GeneratedColumn<String> strCategory = GeneratedColumn<String>(
      'str_category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strAreaMeta =
      const VerificationMeta('strArea');
  @override
  late final GeneratedColumn<String> strArea = GeneratedColumn<String>(
      'str_area', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strInstructionsMeta =
      const VerificationMeta('strInstructions');
  @override
  late final GeneratedColumn<String> strInstructions = GeneratedColumn<String>(
      'str_instructions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  @override
  late final GeneratedColumn<String> strMealThumb = GeneratedColumn<String>(
      'str_meal_thumb', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ingredientsMeta =
      const VerificationMeta('ingredients');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      ingredients = GeneratedColumn<String>('ingredients', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>?>(
              $FoodDetailsTable.$converteringredients);
  static const VerificationMeta _measuresMeta =
      const VerificationMeta('measures');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> measures =
      GeneratedColumn<String>('measures', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>?>($FoodDetailsTable.$convertermeasures);
  @override
  List<GeneratedColumn> get $columns => [
        idMeal,
        strMeal,
        strCategory,
        strArea,
        strInstructions,
        strMealThumb,
        ingredients,
        measures
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_details';
  @override
  VerificationContext validateIntegrity(Insertable<FoodDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    }
    if (data.containsKey('str_area')) {
      context.handle(_strAreaMeta,
          strArea.isAcceptableOrUnknown(data['str_area']!, _strAreaMeta));
    }
    if (data.containsKey('str_instructions')) {
      context.handle(
          _strInstructionsMeta,
          strInstructions.isAcceptableOrUnknown(
              data['str_instructions']!, _strInstructionsMeta));
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    }
    context.handle(_ingredientsMeta, const VerificationResult.success());
    context.handle(_measuresMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FoodDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodDetail(
      idMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_meal'])!,
      strMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_meal']),
      strCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_category']),
      strArea: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_area']),
      strInstructions: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}str_instructions']),
      strMealThumb: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_meal_thumb']),
      ingredients: $FoodDetailsTable.$converteringredients.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}ingredients'])!),
      measures: $FoodDetailsTable.$convertermeasures.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}measures'])!),
    );
  }

  @override
  $FoodDetailsTable createAlias(String alias) {
    return $FoodDetailsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>?, String> $converteringredients =
      const StringListConverter();
  static TypeConverter<List<String>?, String> $convertermeasures =
      const StringListConverter();
}

class FoodDetail extends DataClass implements Insertable<FoodDetail> {
  final String idMeal;
  final String? strMeal;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final List<String>? ingredients;
  final List<String>? measures;
  const FoodDetail(
      {required this.idMeal,
      this.strMeal,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.ingredients,
      this.measures});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    if (!nullToAbsent || strMeal != null) {
      map['str_meal'] = Variable<String>(strMeal);
    }
    if (!nullToAbsent || strCategory != null) {
      map['str_category'] = Variable<String>(strCategory);
    }
    if (!nullToAbsent || strArea != null) {
      map['str_area'] = Variable<String>(strArea);
    }
    if (!nullToAbsent || strInstructions != null) {
      map['str_instructions'] = Variable<String>(strInstructions);
    }
    if (!nullToAbsent || strMealThumb != null) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb);
    }
    if (!nullToAbsent || ingredients != null) {
      map['ingredients'] = Variable<String>(
          $FoodDetailsTable.$converteringredients.toSql(ingredients));
    }
    if (!nullToAbsent || measures != null) {
      map['measures'] = Variable<String>(
          $FoodDetailsTable.$convertermeasures.toSql(measures));
    }
    return map;
  }

  FoodDetailsCompanion toCompanion(bool nullToAbsent) {
    return FoodDetailsCompanion(
      idMeal: Value(idMeal),
      strMeal: strMeal == null && nullToAbsent
          ? const Value.absent()
          : Value(strMeal),
      strCategory: strCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(strCategory),
      strArea: strArea == null && nullToAbsent
          ? const Value.absent()
          : Value(strArea),
      strInstructions: strInstructions == null && nullToAbsent
          ? const Value.absent()
          : Value(strInstructions),
      strMealThumb: strMealThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strMealThumb),
      ingredients: ingredients == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients),
      measures: measures == null && nullToAbsent
          ? const Value.absent()
          : Value(measures),
    );
  }

  factory FoodDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodDetail(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String?>(json['strMeal']),
      strCategory: serializer.fromJson<String?>(json['strCategory']),
      strArea: serializer.fromJson<String?>(json['strArea']),
      strInstructions: serializer.fromJson<String?>(json['strInstructions']),
      strMealThumb: serializer.fromJson<String?>(json['strMealThumb']),
      ingredients: serializer.fromJson<List<String>?>(json['ingredients']),
      measures: serializer.fromJson<List<String>?>(json['measures']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String?>(strMeal),
      'strCategory': serializer.toJson<String?>(strCategory),
      'strArea': serializer.toJson<String?>(strArea),
      'strInstructions': serializer.toJson<String?>(strInstructions),
      'strMealThumb': serializer.toJson<String?>(strMealThumb),
      'ingredients': serializer.toJson<List<String>?>(ingredients),
      'measures': serializer.toJson<List<String>?>(measures),
    };
  }

  FoodDetail copyWith(
          {String? idMeal,
          Value<String?> strMeal = const Value.absent(),
          Value<String?> strCategory = const Value.absent(),
          Value<String?> strArea = const Value.absent(),
          Value<String?> strInstructions = const Value.absent(),
          Value<String?> strMealThumb = const Value.absent(),
          Value<List<String>?> ingredients = const Value.absent(),
          Value<List<String>?> measures = const Value.absent()}) =>
      FoodDetail(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal.present ? strMeal.value : this.strMeal,
        strCategory: strCategory.present ? strCategory.value : this.strCategory,
        strArea: strArea.present ? strArea.value : this.strArea,
        strInstructions: strInstructions.present
            ? strInstructions.value
            : this.strInstructions,
        strMealThumb:
            strMealThumb.present ? strMealThumb.value : this.strMealThumb,
        ingredients: ingredients.present ? ingredients.value : this.ingredients,
        measures: measures.present ? measures.value : this.measures,
      );
  @override
  String toString() {
    return (StringBuffer('FoodDetail(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('ingredients: $ingredients, ')
          ..write('measures: $measures')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMeal, strMeal, strCategory, strArea,
      strInstructions, strMealThumb, ingredients, measures);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodDetail &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strCategory == this.strCategory &&
          other.strArea == this.strArea &&
          other.strInstructions == this.strInstructions &&
          other.strMealThumb == this.strMealThumb &&
          other.ingredients == this.ingredients &&
          other.measures == this.measures);
}

class FoodDetailsCompanion extends UpdateCompanion<FoodDetail> {
  final Value<String> idMeal;
  final Value<String?> strMeal;
  final Value<String?> strCategory;
  final Value<String?> strArea;
  final Value<String?> strInstructions;
  final Value<String?> strMealThumb;
  final Value<List<String>?> ingredients;
  final Value<List<String>?> measures;
  final Value<int> rowid;
  const FoodDetailsCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strArea = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.strMealThumb = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.measures = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoodDetailsCompanion.insert({
    required String idMeal,
    this.strMeal = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strArea = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.strMealThumb = const Value.absent(),
    required List<String>? ingredients,
    required List<String>? measures,
    this.rowid = const Value.absent(),
  })  : idMeal = Value(idMeal),
        ingredients = Value(ingredients),
        measures = Value(measures);
  static Insertable<FoodDetail> custom({
    Expression<String>? idMeal,
    Expression<String>? strMeal,
    Expression<String>? strCategory,
    Expression<String>? strArea,
    Expression<String>? strInstructions,
    Expression<String>? strMealThumb,
    Expression<String>? ingredients,
    Expression<String>? measures,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strCategory != null) 'str_category': strCategory,
      if (strArea != null) 'str_area': strArea,
      if (strInstructions != null) 'str_instructions': strInstructions,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
      if (ingredients != null) 'ingredients': ingredients,
      if (measures != null) 'measures': measures,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoodDetailsCompanion copyWith(
      {Value<String>? idMeal,
      Value<String?>? strMeal,
      Value<String?>? strCategory,
      Value<String?>? strArea,
      Value<String?>? strInstructions,
      Value<String?>? strMealThumb,
      Value<List<String>?>? ingredients,
      Value<List<String>?>? measures,
      Value<int>? rowid}) {
    return FoodDetailsCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strCategory: strCategory ?? this.strCategory,
      strArea: strArea ?? this.strArea,
      strInstructions: strInstructions ?? this.strInstructions,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      ingredients: ingredients ?? this.ingredients,
      measures: measures ?? this.measures,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strArea.present) {
      map['str_area'] = Variable<String>(strArea.value);
    }
    if (strInstructions.present) {
      map['str_instructions'] = Variable<String>(strInstructions.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(
          $FoodDetailsTable.$converteringredients.toSql(ingredients.value));
    }
    if (measures.present) {
      map['measures'] = Variable<String>(
          $FoodDetailsTable.$convertermeasures.toSql(measures.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodDetailsCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('ingredients: $ingredients, ')
          ..write('measures: $measures, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $FoodDetailsTable foodDetails = $FoodDetailsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foodDetails];
}
