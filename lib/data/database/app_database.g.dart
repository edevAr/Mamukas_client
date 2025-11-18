// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserModelsTable extends UserModels
    with TableInfo<$UserModelsTable, UserModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
    'id_user',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ciMeta = const VerificationMeta('ci');
  @override
  late final GeneratedColumn<String> ci = GeneratedColumn<String>(
    'ci',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    check: () => ComparableExpr(age).isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<UserStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UserStatus>($UserModelsTable.$converterstatus);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Gender?, String> gender =
      GeneratedColumn<String>(
        'gender',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Gender?>($UserModelsTable.$convertergendern);
  @override
  List<GeneratedColumn> get $columns => [
    idUser,
    username,
    password,
    name,
    lastName,
    ci,
    age,
    status,
    email,
    gender,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_user')) {
      context.handle(
        _idUserMeta,
        idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta),
      );
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('ci')) {
      context.handle(_ciMeta, ci.isAcceptableOrUnknown(data['ci']!, _ciMeta));
    } else if (isInserting) {
      context.missing(_ciMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUser};
  @override
  UserModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserModel(
      idUser: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_user'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      ci: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ci'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      status: $UserModelsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      gender: $UserModelsTable.$convertergendern.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gender'],
        ),
      ),
    );
  }

  @override
  $UserModelsTable createAlias(String alias) {
    return $UserModelsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserStatus, String, String> $converterstatus =
      const EnumNameConverter<UserStatus>(UserStatus.values);
  static JsonTypeConverter2<Gender, String, String> $convertergender =
      const EnumNameConverter<Gender>(Gender.values);
  static JsonTypeConverter2<Gender?, String?, String?> $convertergendern =
      JsonTypeConverter2.asNullable($convertergender);
}

class UserModel extends DataClass implements Insertable<UserModel> {
  final int idUser;
  final String username;
  final String password;
  final String name;
  final String lastName;
  final String ci;
  final int age;
  final UserStatus status;
  final String? email;
  final Gender? gender;
  const UserModel({
    required this.idUser,
    required this.username,
    required this.password,
    required this.name,
    required this.lastName,
    required this.ci,
    required this.age,
    required this.status,
    this.email,
    this.gender,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_user'] = Variable<int>(idUser);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['name'] = Variable<String>(name);
    map['last_name'] = Variable<String>(lastName);
    map['ci'] = Variable<String>(ci);
    map['age'] = Variable<int>(age);
    {
      map['status'] = Variable<String>(
        $UserModelsTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(
        $UserModelsTable.$convertergendern.toSql(gender),
      );
    }
    return map;
  }

  UserModelsCompanion toCompanion(bool nullToAbsent) {
    return UserModelsCompanion(
      idUser: Value(idUser),
      username: Value(username),
      password: Value(password),
      name: Value(name),
      lastName: Value(lastName),
      ci: Value(ci),
      age: Value(age),
      status: Value(status),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
    );
  }

  factory UserModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserModel(
      idUser: serializer.fromJson<int>(json['idUser']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      name: serializer.fromJson<String>(json['name']),
      lastName: serializer.fromJson<String>(json['lastName']),
      ci: serializer.fromJson<String>(json['ci']),
      age: serializer.fromJson<int>(json['age']),
      status: $UserModelsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      email: serializer.fromJson<String?>(json['email']),
      gender: $UserModelsTable.$convertergendern.fromJson(
        serializer.fromJson<String?>(json['gender']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUser': serializer.toJson<int>(idUser),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'name': serializer.toJson<String>(name),
      'lastName': serializer.toJson<String>(lastName),
      'ci': serializer.toJson<String>(ci),
      'age': serializer.toJson<int>(age),
      'status': serializer.toJson<String>(
        $UserModelsTable.$converterstatus.toJson(status),
      ),
      'email': serializer.toJson<String?>(email),
      'gender': serializer.toJson<String?>(
        $UserModelsTable.$convertergendern.toJson(gender),
      ),
    };
  }

  UserModel copyWith({
    int? idUser,
    String? username,
    String? password,
    String? name,
    String? lastName,
    String? ci,
    int? age,
    UserStatus? status,
    Value<String?> email = const Value.absent(),
    Value<Gender?> gender = const Value.absent(),
  }) => UserModel(
    idUser: idUser ?? this.idUser,
    username: username ?? this.username,
    password: password ?? this.password,
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    ci: ci ?? this.ci,
    age: age ?? this.age,
    status: status ?? this.status,
    email: email.present ? email.value : this.email,
    gender: gender.present ? gender.value : this.gender,
  );
  UserModel copyWithCompanion(UserModelsCompanion data) {
    return UserModel(
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      name: data.name.present ? data.name.value : this.name,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      ci: data.ci.present ? data.ci.value : this.ci,
      age: data.age.present ? data.age.value : this.age,
      status: data.status.present ? data.status.value : this.status,
      email: data.email.present ? data.email.value : this.email,
      gender: data.gender.present ? data.gender.value : this.gender,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserModel(')
          ..write('idUser: $idUser, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('ci: $ci, ')
          ..write('age: $age, ')
          ..write('status: $status, ')
          ..write('email: $email, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idUser,
    username,
    password,
    name,
    lastName,
    ci,
    age,
    status,
    email,
    gender,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          other.idUser == this.idUser &&
          other.username == this.username &&
          other.password == this.password &&
          other.name == this.name &&
          other.lastName == this.lastName &&
          other.ci == this.ci &&
          other.age == this.age &&
          other.status == this.status &&
          other.email == this.email &&
          other.gender == this.gender);
}

class UserModelsCompanion extends UpdateCompanion<UserModel> {
  final Value<int> idUser;
  final Value<String> username;
  final Value<String> password;
  final Value<String> name;
  final Value<String> lastName;
  final Value<String> ci;
  final Value<int> age;
  final Value<UserStatus> status;
  final Value<String?> email;
  final Value<Gender?> gender;
  const UserModelsCompanion({
    this.idUser = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.ci = const Value.absent(),
    this.age = const Value.absent(),
    this.status = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
  });
  UserModelsCompanion.insert({
    this.idUser = const Value.absent(),
    required String username,
    required String password,
    required String name,
    required String lastName,
    required String ci,
    required int age,
    required UserStatus status,
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
  }) : username = Value(username),
       password = Value(password),
       name = Value(name),
       lastName = Value(lastName),
       ci = Value(ci),
       age = Value(age),
       status = Value(status);
  static Insertable<UserModel> custom({
    Expression<int>? idUser,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? name,
    Expression<String>? lastName,
    Expression<String>? ci,
    Expression<int>? age,
    Expression<String>? status,
    Expression<String>? email,
    Expression<String>? gender,
  }) {
    return RawValuesInsertable({
      if (idUser != null) 'id_user': idUser,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (name != null) 'name': name,
      if (lastName != null) 'last_name': lastName,
      if (ci != null) 'ci': ci,
      if (age != null) 'age': age,
      if (status != null) 'status': status,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
    });
  }

  UserModelsCompanion copyWith({
    Value<int>? idUser,
    Value<String>? username,
    Value<String>? password,
    Value<String>? name,
    Value<String>? lastName,
    Value<String>? ci,
    Value<int>? age,
    Value<UserStatus>? status,
    Value<String?>? email,
    Value<Gender?>? gender,
  }) {
    return UserModelsCompanion(
      idUser: idUser ?? this.idUser,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      ci: ci ?? this.ci,
      age: age ?? this.age,
      status: status ?? this.status,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (ci.present) {
      map['ci'] = Variable<String>(ci.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $UserModelsTable.$converterstatus.toSql(status.value),
      );
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(
        $UserModelsTable.$convertergendern.toSql(gender.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserModelsCompanion(')
          ..write('idUser: $idUser, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('ci: $ci, ')
          ..write('age: $age, ')
          ..write('status: $status, ')
          ..write('email: $email, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

class $SaleModelsTable extends SaleModels
    with TableInfo<$SaleModelsTable, SaleModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idSaleMeta = const VerificationMeta('idSale');
  @override
  late final GeneratedColumn<int> idSale = GeneratedColumn<int>(
    'id_sale',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idEmployeeMeta = const VerificationMeta(
    'idEmployee',
  );
  @override
  late final GeneratedColumn<int> idEmployee = GeneratedColumn<int>(
    'id_employee',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idProductMeta = const VerificationMeta(
    'idProduct',
  );
  @override
  late final GeneratedColumn<int> idProduct = GeneratedColumn<int>(
    'id_product',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    check: () => ComparableExpr(amount).isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idClientMeta = const VerificationMeta(
    'idClient',
  );
  @override
  late final GeneratedColumn<int> idClient = GeneratedColumn<int>(
    'id_client',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    check: () => ComparableExpr(subtotal).isBiggerOrEqualValue(0),
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
    'total',
    aliasedName,
    false,
    check: () => ComparableExpr(total).isBiggerOrEqualValue(0),
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cashDiscountMeta = const VerificationMeta(
    'cashDiscount',
  );
  @override
  late final GeneratedColumn<double> cashDiscount = GeneratedColumn<double>(
    'cash_discount',
    aliasedName,
    false,
    check: () => ComparableExpr(cashDiscount).isBiggerOrEqualValue(0),
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idSale,
    idEmployee,
    idProduct,
    amount,
    idClient,
    subtotal,
    total,
    cashDiscount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales';
  @override
  VerificationContext validateIntegrity(
    Insertable<SaleModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_sale')) {
      context.handle(
        _idSaleMeta,
        idSale.isAcceptableOrUnknown(data['id_sale']!, _idSaleMeta),
      );
    }
    if (data.containsKey('id_employee')) {
      context.handle(
        _idEmployeeMeta,
        idEmployee.isAcceptableOrUnknown(data['id_employee']!, _idEmployeeMeta),
      );
    } else if (isInserting) {
      context.missing(_idEmployeeMeta);
    }
    if (data.containsKey('id_product')) {
      context.handle(
        _idProductMeta,
        idProduct.isAcceptableOrUnknown(data['id_product']!, _idProductMeta),
      );
    } else if (isInserting) {
      context.missing(_idProductMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('id_client')) {
      context.handle(
        _idClientMeta,
        idClient.isAcceptableOrUnknown(data['id_client']!, _idClientMeta),
      );
    } else if (isInserting) {
      context.missing(_idClientMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('cash_discount')) {
      context.handle(
        _cashDiscountMeta,
        cashDiscount.isAcceptableOrUnknown(
          data['cash_discount']!,
          _cashDiscountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cashDiscountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idSale};
  @override
  SaleModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleModel(
      idSale: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_sale'],
      )!,
      idEmployee: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_employee'],
      )!,
      idProduct: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_product'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      idClient: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_client'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total'],
      )!,
      cashDiscount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cash_discount'],
      )!,
    );
  }

  @override
  $SaleModelsTable createAlias(String alias) {
    return $SaleModelsTable(attachedDatabase, alias);
  }
}

class SaleModel extends DataClass implements Insertable<SaleModel> {
  final int idSale;
  final int idEmployee;
  final int idProduct;
  final int amount;
  final int idClient;
  final double subtotal;
  final double total;
  final double cashDiscount;
  const SaleModel({
    required this.idSale,
    required this.idEmployee,
    required this.idProduct,
    required this.amount,
    required this.idClient,
    required this.subtotal,
    required this.total,
    required this.cashDiscount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_sale'] = Variable<int>(idSale);
    map['id_employee'] = Variable<int>(idEmployee);
    map['id_product'] = Variable<int>(idProduct);
    map['amount'] = Variable<int>(amount);
    map['id_client'] = Variable<int>(idClient);
    map['subtotal'] = Variable<double>(subtotal);
    map['total'] = Variable<double>(total);
    map['cash_discount'] = Variable<double>(cashDiscount);
    return map;
  }

  SaleModelsCompanion toCompanion(bool nullToAbsent) {
    return SaleModelsCompanion(
      idSale: Value(idSale),
      idEmployee: Value(idEmployee),
      idProduct: Value(idProduct),
      amount: Value(amount),
      idClient: Value(idClient),
      subtotal: Value(subtotal),
      total: Value(total),
      cashDiscount: Value(cashDiscount),
    );
  }

  factory SaleModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleModel(
      idSale: serializer.fromJson<int>(json['idSale']),
      idEmployee: serializer.fromJson<int>(json['idEmployee']),
      idProduct: serializer.fromJson<int>(json['idProduct']),
      amount: serializer.fromJson<int>(json['amount']),
      idClient: serializer.fromJson<int>(json['idClient']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      total: serializer.fromJson<double>(json['total']),
      cashDiscount: serializer.fromJson<double>(json['cashDiscount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idSale': serializer.toJson<int>(idSale),
      'idEmployee': serializer.toJson<int>(idEmployee),
      'idProduct': serializer.toJson<int>(idProduct),
      'amount': serializer.toJson<int>(amount),
      'idClient': serializer.toJson<int>(idClient),
      'subtotal': serializer.toJson<double>(subtotal),
      'total': serializer.toJson<double>(total),
      'cashDiscount': serializer.toJson<double>(cashDiscount),
    };
  }

  SaleModel copyWith({
    int? idSale,
    int? idEmployee,
    int? idProduct,
    int? amount,
    int? idClient,
    double? subtotal,
    double? total,
    double? cashDiscount,
  }) => SaleModel(
    idSale: idSale ?? this.idSale,
    idEmployee: idEmployee ?? this.idEmployee,
    idProduct: idProduct ?? this.idProduct,
    amount: amount ?? this.amount,
    idClient: idClient ?? this.idClient,
    subtotal: subtotal ?? this.subtotal,
    total: total ?? this.total,
    cashDiscount: cashDiscount ?? this.cashDiscount,
  );
  SaleModel copyWithCompanion(SaleModelsCompanion data) {
    return SaleModel(
      idSale: data.idSale.present ? data.idSale.value : this.idSale,
      idEmployee: data.idEmployee.present
          ? data.idEmployee.value
          : this.idEmployee,
      idProduct: data.idProduct.present ? data.idProduct.value : this.idProduct,
      amount: data.amount.present ? data.amount.value : this.amount,
      idClient: data.idClient.present ? data.idClient.value : this.idClient,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      total: data.total.present ? data.total.value : this.total,
      cashDiscount: data.cashDiscount.present
          ? data.cashDiscount.value
          : this.cashDiscount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleModel(')
          ..write('idSale: $idSale, ')
          ..write('idEmployee: $idEmployee, ')
          ..write('idProduct: $idProduct, ')
          ..write('amount: $amount, ')
          ..write('idClient: $idClient, ')
          ..write('subtotal: $subtotal, ')
          ..write('total: $total, ')
          ..write('cashDiscount: $cashDiscount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idSale,
    idEmployee,
    idProduct,
    amount,
    idClient,
    subtotal,
    total,
    cashDiscount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleModel &&
          other.idSale == this.idSale &&
          other.idEmployee == this.idEmployee &&
          other.idProduct == this.idProduct &&
          other.amount == this.amount &&
          other.idClient == this.idClient &&
          other.subtotal == this.subtotal &&
          other.total == this.total &&
          other.cashDiscount == this.cashDiscount);
}

class SaleModelsCompanion extends UpdateCompanion<SaleModel> {
  final Value<int> idSale;
  final Value<int> idEmployee;
  final Value<int> idProduct;
  final Value<int> amount;
  final Value<int> idClient;
  final Value<double> subtotal;
  final Value<double> total;
  final Value<double> cashDiscount;
  const SaleModelsCompanion({
    this.idSale = const Value.absent(),
    this.idEmployee = const Value.absent(),
    this.idProduct = const Value.absent(),
    this.amount = const Value.absent(),
    this.idClient = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.total = const Value.absent(),
    this.cashDiscount = const Value.absent(),
  });
  SaleModelsCompanion.insert({
    this.idSale = const Value.absent(),
    required int idEmployee,
    required int idProduct,
    required int amount,
    required int idClient,
    required double subtotal,
    required double total,
    required double cashDiscount,
  }) : idEmployee = Value(idEmployee),
       idProduct = Value(idProduct),
       amount = Value(amount),
       idClient = Value(idClient),
       subtotal = Value(subtotal),
       total = Value(total),
       cashDiscount = Value(cashDiscount);
  static Insertable<SaleModel> custom({
    Expression<int>? idSale,
    Expression<int>? idEmployee,
    Expression<int>? idProduct,
    Expression<int>? amount,
    Expression<int>? idClient,
    Expression<double>? subtotal,
    Expression<double>? total,
    Expression<double>? cashDiscount,
  }) {
    return RawValuesInsertable({
      if (idSale != null) 'id_sale': idSale,
      if (idEmployee != null) 'id_employee': idEmployee,
      if (idProduct != null) 'id_product': idProduct,
      if (amount != null) 'amount': amount,
      if (idClient != null) 'id_client': idClient,
      if (subtotal != null) 'subtotal': subtotal,
      if (total != null) 'total': total,
      if (cashDiscount != null) 'cash_discount': cashDiscount,
    });
  }

  SaleModelsCompanion copyWith({
    Value<int>? idSale,
    Value<int>? idEmployee,
    Value<int>? idProduct,
    Value<int>? amount,
    Value<int>? idClient,
    Value<double>? subtotal,
    Value<double>? total,
    Value<double>? cashDiscount,
  }) {
    return SaleModelsCompanion(
      idSale: idSale ?? this.idSale,
      idEmployee: idEmployee ?? this.idEmployee,
      idProduct: idProduct ?? this.idProduct,
      amount: amount ?? this.amount,
      idClient: idClient ?? this.idClient,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      cashDiscount: cashDiscount ?? this.cashDiscount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idSale.present) {
      map['id_sale'] = Variable<int>(idSale.value);
    }
    if (idEmployee.present) {
      map['id_employee'] = Variable<int>(idEmployee.value);
    }
    if (idProduct.present) {
      map['id_product'] = Variable<int>(idProduct.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (idClient.present) {
      map['id_client'] = Variable<int>(idClient.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (cashDiscount.present) {
      map['cash_discount'] = Variable<double>(cashDiscount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleModelsCompanion(')
          ..write('idSale: $idSale, ')
          ..write('idEmployee: $idEmployee, ')
          ..write('idProduct: $idProduct, ')
          ..write('amount: $amount, ')
          ..write('idClient: $idClient, ')
          ..write('subtotal: $subtotal, ')
          ..write('total: $total, ')
          ..write('cashDiscount: $cashDiscount')
          ..write(')'))
        .toString();
  }
}

class $OrderEntryModelsTable extends OrderEntryModels
    with TableInfo<$OrderEntryModelsTable, OrderEntryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderEntryModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOrderMeta = const VerificationMeta(
    'idOrder',
  );
  @override
  late final GeneratedColumn<int> idOrder = GeneratedColumn<int>(
    'id_order',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idProviderMeta = const VerificationMeta(
    'idProvider',
  );
  @override
  late final GeneratedColumn<int> idProvider = GeneratedColumn<int>(
    'id_provider',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [idOrder, date, status, idProvider];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderEntryModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_order')) {
      context.handle(
        _idOrderMeta,
        idOrder.isAcceptableOrUnknown(data['id_order']!, _idOrderMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('id_provider')) {
      context.handle(
        _idProviderMeta,
        idProvider.isAcceptableOrUnknown(data['id_provider']!, _idProviderMeta),
      );
    } else if (isInserting) {
      context.missing(_idProviderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOrder};
  @override
  OrderEntryModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderEntryModel(
      idOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_order'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      idProvider: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_provider'],
      )!,
    );
  }

  @override
  $OrderEntryModelsTable createAlias(String alias) {
    return $OrderEntryModelsTable(attachedDatabase, alias);
  }
}

class OrderEntryModel extends DataClass implements Insertable<OrderEntryModel> {
  final int idOrder;
  final DateTime date;
  final String status;
  final int idProvider;
  const OrderEntryModel({
    required this.idOrder,
    required this.date,
    required this.status,
    required this.idProvider,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_order'] = Variable<int>(idOrder);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    map['id_provider'] = Variable<int>(idProvider);
    return map;
  }

  OrderEntryModelsCompanion toCompanion(bool nullToAbsent) {
    return OrderEntryModelsCompanion(
      idOrder: Value(idOrder),
      date: Value(date),
      status: Value(status),
      idProvider: Value(idProvider),
    );
  }

  factory OrderEntryModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderEntryModel(
      idOrder: serializer.fromJson<int>(json['idOrder']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
      idProvider: serializer.fromJson<int>(json['idProvider']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOrder': serializer.toJson<int>(idOrder),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
      'idProvider': serializer.toJson<int>(idProvider),
    };
  }

  OrderEntryModel copyWith({
    int? idOrder,
    DateTime? date,
    String? status,
    int? idProvider,
  }) => OrderEntryModel(
    idOrder: idOrder ?? this.idOrder,
    date: date ?? this.date,
    status: status ?? this.status,
    idProvider: idProvider ?? this.idProvider,
  );
  OrderEntryModel copyWithCompanion(OrderEntryModelsCompanion data) {
    return OrderEntryModel(
      idOrder: data.idOrder.present ? data.idOrder.value : this.idOrder,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
      idProvider: data.idProvider.present
          ? data.idProvider.value
          : this.idProvider,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderEntryModel(')
          ..write('idOrder: $idOrder, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('idProvider: $idProvider')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idOrder, date, status, idProvider);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderEntryModel &&
          other.idOrder == this.idOrder &&
          other.date == this.date &&
          other.status == this.status &&
          other.idProvider == this.idProvider);
}

class OrderEntryModelsCompanion extends UpdateCompanion<OrderEntryModel> {
  final Value<int> idOrder;
  final Value<DateTime> date;
  final Value<String> status;
  final Value<int> idProvider;
  const OrderEntryModelsCompanion({
    this.idOrder = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
    this.idProvider = const Value.absent(),
  });
  OrderEntryModelsCompanion.insert({
    this.idOrder = const Value.absent(),
    required DateTime date,
    required String status,
    required int idProvider,
  }) : date = Value(date),
       status = Value(status),
       idProvider = Value(idProvider);
  static Insertable<OrderEntryModel> custom({
    Expression<int>? idOrder,
    Expression<DateTime>? date,
    Expression<String>? status,
    Expression<int>? idProvider,
  }) {
    return RawValuesInsertable({
      if (idOrder != null) 'id_order': idOrder,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
      if (idProvider != null) 'id_provider': idProvider,
    });
  }

  OrderEntryModelsCompanion copyWith({
    Value<int>? idOrder,
    Value<DateTime>? date,
    Value<String>? status,
    Value<int>? idProvider,
  }) {
    return OrderEntryModelsCompanion(
      idOrder: idOrder ?? this.idOrder,
      date: date ?? this.date,
      status: status ?? this.status,
      idProvider: idProvider ?? this.idProvider,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOrder.present) {
      map['id_order'] = Variable<int>(idOrder.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (idProvider.present) {
      map['id_provider'] = Variable<int>(idProvider.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderEntryModelsCompanion(')
          ..write('idOrder: $idOrder, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('idProvider: $idProvider')
          ..write(')'))
        .toString();
  }
}

class $OrderOutputModelsTable extends OrderOutputModels
    with TableInfo<$OrderOutputModelsTable, OrderOutputModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderOutputModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOrderMeta = const VerificationMeta(
    'idOrder',
  );
  @override
  late final GeneratedColumn<int> idOrder = GeneratedColumn<int>(
    'id_order',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idCustomerMeta = const VerificationMeta(
    'idCustomer',
  );
  @override
  late final GeneratedColumn<int> idCustomer = GeneratedColumn<int>(
    'id_customer',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [idOrder, date, status, idCustomer];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_outputs';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderOutputModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_order')) {
      context.handle(
        _idOrderMeta,
        idOrder.isAcceptableOrUnknown(data['id_order']!, _idOrderMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('id_customer')) {
      context.handle(
        _idCustomerMeta,
        idCustomer.isAcceptableOrUnknown(data['id_customer']!, _idCustomerMeta),
      );
    } else if (isInserting) {
      context.missing(_idCustomerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOrder};
  @override
  OrderOutputModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderOutputModel(
      idOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_order'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      idCustomer: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_customer'],
      )!,
    );
  }

  @override
  $OrderOutputModelsTable createAlias(String alias) {
    return $OrderOutputModelsTable(attachedDatabase, alias);
  }
}

class OrderOutputModel extends DataClass
    implements Insertable<OrderOutputModel> {
  final int idOrder;
  final DateTime date;
  final String status;
  final int idCustomer;
  const OrderOutputModel({
    required this.idOrder,
    required this.date,
    required this.status,
    required this.idCustomer,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_order'] = Variable<int>(idOrder);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    map['id_customer'] = Variable<int>(idCustomer);
    return map;
  }

  OrderOutputModelsCompanion toCompanion(bool nullToAbsent) {
    return OrderOutputModelsCompanion(
      idOrder: Value(idOrder),
      date: Value(date),
      status: Value(status),
      idCustomer: Value(idCustomer),
    );
  }

  factory OrderOutputModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderOutputModel(
      idOrder: serializer.fromJson<int>(json['idOrder']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
      idCustomer: serializer.fromJson<int>(json['idCustomer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOrder': serializer.toJson<int>(idOrder),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
      'idCustomer': serializer.toJson<int>(idCustomer),
    };
  }

  OrderOutputModel copyWith({
    int? idOrder,
    DateTime? date,
    String? status,
    int? idCustomer,
  }) => OrderOutputModel(
    idOrder: idOrder ?? this.idOrder,
    date: date ?? this.date,
    status: status ?? this.status,
    idCustomer: idCustomer ?? this.idCustomer,
  );
  OrderOutputModel copyWithCompanion(OrderOutputModelsCompanion data) {
    return OrderOutputModel(
      idOrder: data.idOrder.present ? data.idOrder.value : this.idOrder,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
      idCustomer: data.idCustomer.present
          ? data.idCustomer.value
          : this.idCustomer,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderOutputModel(')
          ..write('idOrder: $idOrder, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('idCustomer: $idCustomer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idOrder, date, status, idCustomer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderOutputModel &&
          other.idOrder == this.idOrder &&
          other.date == this.date &&
          other.status == this.status &&
          other.idCustomer == this.idCustomer);
}

class OrderOutputModelsCompanion extends UpdateCompanion<OrderOutputModel> {
  final Value<int> idOrder;
  final Value<DateTime> date;
  final Value<String> status;
  final Value<int> idCustomer;
  const OrderOutputModelsCompanion({
    this.idOrder = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
    this.idCustomer = const Value.absent(),
  });
  OrderOutputModelsCompanion.insert({
    this.idOrder = const Value.absent(),
    required DateTime date,
    required String status,
    required int idCustomer,
  }) : date = Value(date),
       status = Value(status),
       idCustomer = Value(idCustomer);
  static Insertable<OrderOutputModel> custom({
    Expression<int>? idOrder,
    Expression<DateTime>? date,
    Expression<String>? status,
    Expression<int>? idCustomer,
  }) {
    return RawValuesInsertable({
      if (idOrder != null) 'id_order': idOrder,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
      if (idCustomer != null) 'id_customer': idCustomer,
    });
  }

  OrderOutputModelsCompanion copyWith({
    Value<int>? idOrder,
    Value<DateTime>? date,
    Value<String>? status,
    Value<int>? idCustomer,
  }) {
    return OrderOutputModelsCompanion(
      idOrder: idOrder ?? this.idOrder,
      date: date ?? this.date,
      status: status ?? this.status,
      idCustomer: idCustomer ?? this.idCustomer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOrder.present) {
      map['id_order'] = Variable<int>(idOrder.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (idCustomer.present) {
      map['id_customer'] = Variable<int>(idCustomer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderOutputModelsCompanion(')
          ..write('idOrder: $idOrder, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('idCustomer: $idCustomer')
          ..write(')'))
        .toString();
  }
}

class $OrderDetailModelsTable extends OrderDetailModels
    with TableInfo<$OrderDetailModelsTable, OrderDetailModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderDetailModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDetailMeta = const VerificationMeta(
    'idDetail',
  );
  @override
  late final GeneratedColumn<int> idDetail = GeneratedColumn<int>(
    'id_detail',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idOrderMeta = const VerificationMeta(
    'idOrder',
  );
  @override
  late final GeneratedColumn<int> idOrder = GeneratedColumn<int>(
    'id_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    check: () => ComparableExpr(amount).isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [idDetail, idOrder, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_details';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderDetailModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_detail')) {
      context.handle(
        _idDetailMeta,
        idDetail.isAcceptableOrUnknown(data['id_detail']!, _idDetailMeta),
      );
    }
    if (data.containsKey('id_order')) {
      context.handle(
        _idOrderMeta,
        idOrder.isAcceptableOrUnknown(data['id_order']!, _idOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_idOrderMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDetail};
  @override
  OrderDetailModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderDetailModel(
      idDetail: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_detail'],
      )!,
      idOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_order'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $OrderDetailModelsTable createAlias(String alias) {
    return $OrderDetailModelsTable(attachedDatabase, alias);
  }
}

class OrderDetailModel extends DataClass
    implements Insertable<OrderDetailModel> {
  final int idDetail;
  final int idOrder;
  final int amount;
  const OrderDetailModel({
    required this.idDetail,
    required this.idOrder,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_detail'] = Variable<int>(idDetail);
    map['id_order'] = Variable<int>(idOrder);
    map['amount'] = Variable<int>(amount);
    return map;
  }

  OrderDetailModelsCompanion toCompanion(bool nullToAbsent) {
    return OrderDetailModelsCompanion(
      idDetail: Value(idDetail),
      idOrder: Value(idOrder),
      amount: Value(amount),
    );
  }

  factory OrderDetailModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderDetailModel(
      idDetail: serializer.fromJson<int>(json['idDetail']),
      idOrder: serializer.fromJson<int>(json['idOrder']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDetail': serializer.toJson<int>(idDetail),
      'idOrder': serializer.toJson<int>(idOrder),
      'amount': serializer.toJson<int>(amount),
    };
  }

  OrderDetailModel copyWith({int? idDetail, int? idOrder, int? amount}) =>
      OrderDetailModel(
        idDetail: idDetail ?? this.idDetail,
        idOrder: idOrder ?? this.idOrder,
        amount: amount ?? this.amount,
      );
  OrderDetailModel copyWithCompanion(OrderDetailModelsCompanion data) {
    return OrderDetailModel(
      idDetail: data.idDetail.present ? data.idDetail.value : this.idDetail,
      idOrder: data.idOrder.present ? data.idOrder.value : this.idOrder,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderDetailModel(')
          ..write('idDetail: $idDetail, ')
          ..write('idOrder: $idOrder, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idDetail, idOrder, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderDetailModel &&
          other.idDetail == this.idDetail &&
          other.idOrder == this.idOrder &&
          other.amount == this.amount);
}

class OrderDetailModelsCompanion extends UpdateCompanion<OrderDetailModel> {
  final Value<int> idDetail;
  final Value<int> idOrder;
  final Value<int> amount;
  const OrderDetailModelsCompanion({
    this.idDetail = const Value.absent(),
    this.idOrder = const Value.absent(),
    this.amount = const Value.absent(),
  });
  OrderDetailModelsCompanion.insert({
    this.idDetail = const Value.absent(),
    required int idOrder,
    required int amount,
  }) : idOrder = Value(idOrder),
       amount = Value(amount);
  static Insertable<OrderDetailModel> custom({
    Expression<int>? idDetail,
    Expression<int>? idOrder,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (idDetail != null) 'id_detail': idDetail,
      if (idOrder != null) 'id_order': idOrder,
      if (amount != null) 'amount': amount,
    });
  }

  OrderDetailModelsCompanion copyWith({
    Value<int>? idDetail,
    Value<int>? idOrder,
    Value<int>? amount,
  }) {
    return OrderDetailModelsCompanion(
      idDetail: idDetail ?? this.idDetail,
      idOrder: idOrder ?? this.idOrder,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDetail.present) {
      map['id_detail'] = Variable<int>(idDetail.value);
    }
    if (idOrder.present) {
      map['id_order'] = Variable<int>(idOrder.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderDetailModelsCompanion(')
          ..write('idDetail: $idDetail, ')
          ..write('idOrder: $idOrder, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $CustomerModelsTable extends CustomerModels
    with TableInfo<$CustomerModelsTable, CustomerModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nitMeta = const VerificationMeta('nit');
  @override
  late final GeneratedColumn<String> nit = GeneratedColumn<String>(
    'nit',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [customerId, name, lastName, nit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomerModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('nit')) {
      context.handle(
        _nitMeta,
        nit.isAcceptableOrUnknown(data['nit']!, _nitMeta),
      );
    } else if (isInserting) {
      context.missing(_nitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {customerId};
  @override
  CustomerModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerModel(
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      nit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nit'],
      )!,
    );
  }

  @override
  $CustomerModelsTable createAlias(String alias) {
    return $CustomerModelsTable(attachedDatabase, alias);
  }
}

class CustomerModel extends DataClass implements Insertable<CustomerModel> {
  final int customerId;
  final String name;
  final String lastName;
  final String nit;
  const CustomerModel({
    required this.customerId,
    required this.name,
    required this.lastName,
    required this.nit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['customer_id'] = Variable<int>(customerId);
    map['name'] = Variable<String>(name);
    map['last_name'] = Variable<String>(lastName);
    map['nit'] = Variable<String>(nit);
    return map;
  }

  CustomerModelsCompanion toCompanion(bool nullToAbsent) {
    return CustomerModelsCompanion(
      customerId: Value(customerId),
      name: Value(name),
      lastName: Value(lastName),
      nit: Value(nit),
    );
  }

  factory CustomerModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerModel(
      customerId: serializer.fromJson<int>(json['customerId']),
      name: serializer.fromJson<String>(json['name']),
      lastName: serializer.fromJson<String>(json['lastName']),
      nit: serializer.fromJson<String>(json['nit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'customerId': serializer.toJson<int>(customerId),
      'name': serializer.toJson<String>(name),
      'lastName': serializer.toJson<String>(lastName),
      'nit': serializer.toJson<String>(nit),
    };
  }

  CustomerModel copyWith({
    int? customerId,
    String? name,
    String? lastName,
    String? nit,
  }) => CustomerModel(
    customerId: customerId ?? this.customerId,
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    nit: nit ?? this.nit,
  );
  CustomerModel copyWithCompanion(CustomerModelsCompanion data) {
    return CustomerModel(
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      name: data.name.present ? data.name.value : this.name,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      nit: data.nit.present ? data.nit.value : this.nit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerModel(')
          ..write('customerId: $customerId, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('nit: $nit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(customerId, name, lastName, nit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerModel &&
          other.customerId == this.customerId &&
          other.name == this.name &&
          other.lastName == this.lastName &&
          other.nit == this.nit);
}

class CustomerModelsCompanion extends UpdateCompanion<CustomerModel> {
  final Value<int> customerId;
  final Value<String> name;
  final Value<String> lastName;
  final Value<String> nit;
  const CustomerModelsCompanion({
    this.customerId = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.nit = const Value.absent(),
  });
  CustomerModelsCompanion.insert({
    this.customerId = const Value.absent(),
    required String name,
    required String lastName,
    required String nit,
  }) : name = Value(name),
       lastName = Value(lastName),
       nit = Value(nit);
  static Insertable<CustomerModel> custom({
    Expression<int>? customerId,
    Expression<String>? name,
    Expression<String>? lastName,
    Expression<String>? nit,
  }) {
    return RawValuesInsertable({
      if (customerId != null) 'customer_id': customerId,
      if (name != null) 'name': name,
      if (lastName != null) 'last_name': lastName,
      if (nit != null) 'nit': nit,
    });
  }

  CustomerModelsCompanion copyWith({
    Value<int>? customerId,
    Value<String>? name,
    Value<String>? lastName,
    Value<String>? nit,
  }) {
    return CustomerModelsCompanion(
      customerId: customerId ?? this.customerId,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      nit: nit ?? this.nit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (nit.present) {
      map['nit'] = Variable<String>(nit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerModelsCompanion(')
          ..write('customerId: $customerId, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('nit: $nit')
          ..write(')'))
        .toString();
  }
}

class $SessionModelsTable extends SessionModels
    with TableInfo<$SessionModelsTable, SessionModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idSessionMeta = const VerificationMeta(
    'idSession',
  );
  @override
  late final GeneratedColumn<int> idSession = GeneratedColumn<int>(
    'id_session',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deviceMeta = const VerificationMeta('device');
  @override
  late final GeneratedColumn<String> device = GeneratedColumn<String>(
    'device',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ipMeta = const VerificationMeta('ip');
  @override
  late final GeneratedColumn<String> ip = GeneratedColumn<String>(
    'ip',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 7,
      maxTextLength: 45,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [idSession, status, device, ip];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_session')) {
      context.handle(
        _idSessionMeta,
        idSession.isAcceptableOrUnknown(data['id_session']!, _idSessionMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('device')) {
      context.handle(
        _deviceMeta,
        device.isAcceptableOrUnknown(data['device']!, _deviceMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceMeta);
    }
    if (data.containsKey('ip')) {
      context.handle(_ipMeta, ip.isAcceptableOrUnknown(data['ip']!, _ipMeta));
    } else if (isInserting) {
      context.missing(_ipMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idSession};
  @override
  SessionModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionModel(
      idSession: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_session'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      device: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device'],
      )!,
      ip: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ip'],
      )!,
    );
  }

  @override
  $SessionModelsTable createAlias(String alias) {
    return $SessionModelsTable(attachedDatabase, alias);
  }
}

class SessionModel extends DataClass implements Insertable<SessionModel> {
  final int idSession;
  final String status;
  final String device;
  final String ip;
  const SessionModel({
    required this.idSession,
    required this.status,
    required this.device,
    required this.ip,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_session'] = Variable<int>(idSession);
    map['status'] = Variable<String>(status);
    map['device'] = Variable<String>(device);
    map['ip'] = Variable<String>(ip);
    return map;
  }

  SessionModelsCompanion toCompanion(bool nullToAbsent) {
    return SessionModelsCompanion(
      idSession: Value(idSession),
      status: Value(status),
      device: Value(device),
      ip: Value(ip),
    );
  }

  factory SessionModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionModel(
      idSession: serializer.fromJson<int>(json['idSession']),
      status: serializer.fromJson<String>(json['status']),
      device: serializer.fromJson<String>(json['device']),
      ip: serializer.fromJson<String>(json['ip']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idSession': serializer.toJson<int>(idSession),
      'status': serializer.toJson<String>(status),
      'device': serializer.toJson<String>(device),
      'ip': serializer.toJson<String>(ip),
    };
  }

  SessionModel copyWith({
    int? idSession,
    String? status,
    String? device,
    String? ip,
  }) => SessionModel(
    idSession: idSession ?? this.idSession,
    status: status ?? this.status,
    device: device ?? this.device,
    ip: ip ?? this.ip,
  );
  SessionModel copyWithCompanion(SessionModelsCompanion data) {
    return SessionModel(
      idSession: data.idSession.present ? data.idSession.value : this.idSession,
      status: data.status.present ? data.status.value : this.status,
      device: data.device.present ? data.device.value : this.device,
      ip: data.ip.present ? data.ip.value : this.ip,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionModel(')
          ..write('idSession: $idSession, ')
          ..write('status: $status, ')
          ..write('device: $device, ')
          ..write('ip: $ip')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idSession, status, device, ip);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionModel &&
          other.idSession == this.idSession &&
          other.status == this.status &&
          other.device == this.device &&
          other.ip == this.ip);
}

class SessionModelsCompanion extends UpdateCompanion<SessionModel> {
  final Value<int> idSession;
  final Value<String> status;
  final Value<String> device;
  final Value<String> ip;
  const SessionModelsCompanion({
    this.idSession = const Value.absent(),
    this.status = const Value.absent(),
    this.device = const Value.absent(),
    this.ip = const Value.absent(),
  });
  SessionModelsCompanion.insert({
    this.idSession = const Value.absent(),
    required String status,
    required String device,
    required String ip,
  }) : status = Value(status),
       device = Value(device),
       ip = Value(ip);
  static Insertable<SessionModel> custom({
    Expression<int>? idSession,
    Expression<String>? status,
    Expression<String>? device,
    Expression<String>? ip,
  }) {
    return RawValuesInsertable({
      if (idSession != null) 'id_session': idSession,
      if (status != null) 'status': status,
      if (device != null) 'device': device,
      if (ip != null) 'ip': ip,
    });
  }

  SessionModelsCompanion copyWith({
    Value<int>? idSession,
    Value<String>? status,
    Value<String>? device,
    Value<String>? ip,
  }) {
    return SessionModelsCompanion(
      idSession: idSession ?? this.idSession,
      status: status ?? this.status,
      device: device ?? this.device,
      ip: ip ?? this.ip,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idSession.present) {
      map['id_session'] = Variable<int>(idSession.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (device.present) {
      map['device'] = Variable<String>(device.value);
    }
    if (ip.present) {
      map['ip'] = Variable<String>(ip.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionModelsCompanion(')
          ..write('idSession: $idSession, ')
          ..write('status: $status, ')
          ..write('device: $device, ')
          ..write('ip: $ip')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserModelsTable userModels = $UserModelsTable(this);
  late final $SaleModelsTable saleModels = $SaleModelsTable(this);
  late final $OrderEntryModelsTable orderEntryModels = $OrderEntryModelsTable(
    this,
  );
  late final $OrderOutputModelsTable orderOutputModels =
      $OrderOutputModelsTable(this);
  late final $OrderDetailModelsTable orderDetailModels =
      $OrderDetailModelsTable(this);
  late final $CustomerModelsTable customerModels = $CustomerModelsTable(this);
  late final $SessionModelsTable sessionModels = $SessionModelsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userModels,
    saleModels,
    orderEntryModels,
    orderOutputModels,
    orderDetailModels,
    customerModels,
    sessionModels,
  ];
}

typedef $$UserModelsTableCreateCompanionBuilder =
    UserModelsCompanion Function({
      Value<int> idUser,
      required String username,
      required String password,
      required String name,
      required String lastName,
      required String ci,
      required int age,
      required UserStatus status,
      Value<String?> email,
      Value<Gender?> gender,
    });
typedef $$UserModelsTableUpdateCompanionBuilder =
    UserModelsCompanion Function({
      Value<int> idUser,
      Value<String> username,
      Value<String> password,
      Value<String> name,
      Value<String> lastName,
      Value<String> ci,
      Value<int> age,
      Value<UserStatus> status,
      Value<String?> email,
      Value<Gender?> gender,
    });

class $$UserModelsTableFilterComposer
    extends Composer<_$AppDatabase, $UserModelsTable> {
  $$UserModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idUser => $composableBuilder(
    column: $table.idUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ci => $composableBuilder(
    column: $table.ci,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UserStatus, UserStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Gender?, Gender, String> get gender =>
      $composableBuilder(
        column: $table.gender,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$UserModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserModelsTable> {
  $$UserModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idUser => $composableBuilder(
    column: $table.idUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ci => $composableBuilder(
    column: $table.ci,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserModelsTable> {
  $$UserModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idUser =>
      $composableBuilder(column: $table.idUser, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get ci =>
      $composableBuilder(column: $table.ci, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Gender?, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);
}

class $$UserModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserModelsTable,
          UserModel,
          $$UserModelsTableFilterComposer,
          $$UserModelsTableOrderingComposer,
          $$UserModelsTableAnnotationComposer,
          $$UserModelsTableCreateCompanionBuilder,
          $$UserModelsTableUpdateCompanionBuilder,
          (
            UserModel,
            BaseReferences<_$AppDatabase, $UserModelsTable, UserModel>,
          ),
          UserModel,
          PrefetchHooks Function()
        > {
  $$UserModelsTableTableManager(_$AppDatabase db, $UserModelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idUser = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> ci = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<UserStatus> status = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<Gender?> gender = const Value.absent(),
              }) => UserModelsCompanion(
                idUser: idUser,
                username: username,
                password: password,
                name: name,
                lastName: lastName,
                ci: ci,
                age: age,
                status: status,
                email: email,
                gender: gender,
              ),
          createCompanionCallback:
              ({
                Value<int> idUser = const Value.absent(),
                required String username,
                required String password,
                required String name,
                required String lastName,
                required String ci,
                required int age,
                required UserStatus status,
                Value<String?> email = const Value.absent(),
                Value<Gender?> gender = const Value.absent(),
              }) => UserModelsCompanion.insert(
                idUser: idUser,
                username: username,
                password: password,
                name: name,
                lastName: lastName,
                ci: ci,
                age: age,
                status: status,
                email: email,
                gender: gender,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserModelsTable,
      UserModel,
      $$UserModelsTableFilterComposer,
      $$UserModelsTableOrderingComposer,
      $$UserModelsTableAnnotationComposer,
      $$UserModelsTableCreateCompanionBuilder,
      $$UserModelsTableUpdateCompanionBuilder,
      (UserModel, BaseReferences<_$AppDatabase, $UserModelsTable, UserModel>),
      UserModel,
      PrefetchHooks Function()
    >;
typedef $$SaleModelsTableCreateCompanionBuilder =
    SaleModelsCompanion Function({
      Value<int> idSale,
      required int idEmployee,
      required int idProduct,
      required int amount,
      required int idClient,
      required double subtotal,
      required double total,
      required double cashDiscount,
    });
typedef $$SaleModelsTableUpdateCompanionBuilder =
    SaleModelsCompanion Function({
      Value<int> idSale,
      Value<int> idEmployee,
      Value<int> idProduct,
      Value<int> amount,
      Value<int> idClient,
      Value<double> subtotal,
      Value<double> total,
      Value<double> cashDiscount,
    });

class $$SaleModelsTableFilterComposer
    extends Composer<_$AppDatabase, $SaleModelsTable> {
  $$SaleModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idSale => $composableBuilder(
    column: $table.idSale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idEmployee => $composableBuilder(
    column: $table.idEmployee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idProduct => $composableBuilder(
    column: $table.idProduct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idClient => $composableBuilder(
    column: $table.idClient,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cashDiscount => $composableBuilder(
    column: $table.cashDiscount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SaleModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleModelsTable> {
  $$SaleModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idSale => $composableBuilder(
    column: $table.idSale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idEmployee => $composableBuilder(
    column: $table.idEmployee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idProduct => $composableBuilder(
    column: $table.idProduct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idClient => $composableBuilder(
    column: $table.idClient,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cashDiscount => $composableBuilder(
    column: $table.cashDiscount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SaleModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleModelsTable> {
  $$SaleModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idSale =>
      $composableBuilder(column: $table.idSale, builder: (column) => column);

  GeneratedColumn<int> get idEmployee => $composableBuilder(
    column: $table.idEmployee,
    builder: (column) => column,
  );

  GeneratedColumn<int> get idProduct =>
      $composableBuilder(column: $table.idProduct, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get idClient =>
      $composableBuilder(column: $table.idClient, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<double> get cashDiscount => $composableBuilder(
    column: $table.cashDiscount,
    builder: (column) => column,
  );
}

class $$SaleModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SaleModelsTable,
          SaleModel,
          $$SaleModelsTableFilterComposer,
          $$SaleModelsTableOrderingComposer,
          $$SaleModelsTableAnnotationComposer,
          $$SaleModelsTableCreateCompanionBuilder,
          $$SaleModelsTableUpdateCompanionBuilder,
          (
            SaleModel,
            BaseReferences<_$AppDatabase, $SaleModelsTable, SaleModel>,
          ),
          SaleModel,
          PrefetchHooks Function()
        > {
  $$SaleModelsTableTableManager(_$AppDatabase db, $SaleModelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SaleModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SaleModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SaleModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idSale = const Value.absent(),
                Value<int> idEmployee = const Value.absent(),
                Value<int> idProduct = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> idClient = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> total = const Value.absent(),
                Value<double> cashDiscount = const Value.absent(),
              }) => SaleModelsCompanion(
                idSale: idSale,
                idEmployee: idEmployee,
                idProduct: idProduct,
                amount: amount,
                idClient: idClient,
                subtotal: subtotal,
                total: total,
                cashDiscount: cashDiscount,
              ),
          createCompanionCallback:
              ({
                Value<int> idSale = const Value.absent(),
                required int idEmployee,
                required int idProduct,
                required int amount,
                required int idClient,
                required double subtotal,
                required double total,
                required double cashDiscount,
              }) => SaleModelsCompanion.insert(
                idSale: idSale,
                idEmployee: idEmployee,
                idProduct: idProduct,
                amount: amount,
                idClient: idClient,
                subtotal: subtotal,
                total: total,
                cashDiscount: cashDiscount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SaleModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SaleModelsTable,
      SaleModel,
      $$SaleModelsTableFilterComposer,
      $$SaleModelsTableOrderingComposer,
      $$SaleModelsTableAnnotationComposer,
      $$SaleModelsTableCreateCompanionBuilder,
      $$SaleModelsTableUpdateCompanionBuilder,
      (SaleModel, BaseReferences<_$AppDatabase, $SaleModelsTable, SaleModel>),
      SaleModel,
      PrefetchHooks Function()
    >;
typedef $$OrderEntryModelsTableCreateCompanionBuilder =
    OrderEntryModelsCompanion Function({
      Value<int> idOrder,
      required DateTime date,
      required String status,
      required int idProvider,
    });
typedef $$OrderEntryModelsTableUpdateCompanionBuilder =
    OrderEntryModelsCompanion Function({
      Value<int> idOrder,
      Value<DateTime> date,
      Value<String> status,
      Value<int> idProvider,
    });

class $$OrderEntryModelsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderEntryModelsTable> {
  $$OrderEntryModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idOrder => $composableBuilder(
    column: $table.idOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idProvider => $composableBuilder(
    column: $table.idProvider,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderEntryModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderEntryModelsTable> {
  $$OrderEntryModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idOrder => $composableBuilder(
    column: $table.idOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idProvider => $composableBuilder(
    column: $table.idProvider,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderEntryModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderEntryModelsTable> {
  $$OrderEntryModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idOrder =>
      $composableBuilder(column: $table.idOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get idProvider => $composableBuilder(
    column: $table.idProvider,
    builder: (column) => column,
  );
}

class $$OrderEntryModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderEntryModelsTable,
          OrderEntryModel,
          $$OrderEntryModelsTableFilterComposer,
          $$OrderEntryModelsTableOrderingComposer,
          $$OrderEntryModelsTableAnnotationComposer,
          $$OrderEntryModelsTableCreateCompanionBuilder,
          $$OrderEntryModelsTableUpdateCompanionBuilder,
          (
            OrderEntryModel,
            BaseReferences<
              _$AppDatabase,
              $OrderEntryModelsTable,
              OrderEntryModel
            >,
          ),
          OrderEntryModel,
          PrefetchHooks Function()
        > {
  $$OrderEntryModelsTableTableManager(
    _$AppDatabase db,
    $OrderEntryModelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderEntryModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderEntryModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderEntryModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idOrder = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> idProvider = const Value.absent(),
              }) => OrderEntryModelsCompanion(
                idOrder: idOrder,
                date: date,
                status: status,
                idProvider: idProvider,
              ),
          createCompanionCallback:
              ({
                Value<int> idOrder = const Value.absent(),
                required DateTime date,
                required String status,
                required int idProvider,
              }) => OrderEntryModelsCompanion.insert(
                idOrder: idOrder,
                date: date,
                status: status,
                idProvider: idProvider,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderEntryModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderEntryModelsTable,
      OrderEntryModel,
      $$OrderEntryModelsTableFilterComposer,
      $$OrderEntryModelsTableOrderingComposer,
      $$OrderEntryModelsTableAnnotationComposer,
      $$OrderEntryModelsTableCreateCompanionBuilder,
      $$OrderEntryModelsTableUpdateCompanionBuilder,
      (
        OrderEntryModel,
        BaseReferences<_$AppDatabase, $OrderEntryModelsTable, OrderEntryModel>,
      ),
      OrderEntryModel,
      PrefetchHooks Function()
    >;
typedef $$OrderOutputModelsTableCreateCompanionBuilder =
    OrderOutputModelsCompanion Function({
      Value<int> idOrder,
      required DateTime date,
      required String status,
      required int idCustomer,
    });
typedef $$OrderOutputModelsTableUpdateCompanionBuilder =
    OrderOutputModelsCompanion Function({
      Value<int> idOrder,
      Value<DateTime> date,
      Value<String> status,
      Value<int> idCustomer,
    });

class $$OrderOutputModelsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderOutputModelsTable> {
  $$OrderOutputModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idOrder => $composableBuilder(
    column: $table.idOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idCustomer => $composableBuilder(
    column: $table.idCustomer,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderOutputModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderOutputModelsTable> {
  $$OrderOutputModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idOrder => $composableBuilder(
    column: $table.idOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idCustomer => $composableBuilder(
    column: $table.idCustomer,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderOutputModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderOutputModelsTable> {
  $$OrderOutputModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idOrder =>
      $composableBuilder(column: $table.idOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get idCustomer => $composableBuilder(
    column: $table.idCustomer,
    builder: (column) => column,
  );
}

class $$OrderOutputModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderOutputModelsTable,
          OrderOutputModel,
          $$OrderOutputModelsTableFilterComposer,
          $$OrderOutputModelsTableOrderingComposer,
          $$OrderOutputModelsTableAnnotationComposer,
          $$OrderOutputModelsTableCreateCompanionBuilder,
          $$OrderOutputModelsTableUpdateCompanionBuilder,
          (
            OrderOutputModel,
            BaseReferences<
              _$AppDatabase,
              $OrderOutputModelsTable,
              OrderOutputModel
            >,
          ),
          OrderOutputModel,
          PrefetchHooks Function()
        > {
  $$OrderOutputModelsTableTableManager(
    _$AppDatabase db,
    $OrderOutputModelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderOutputModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderOutputModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderOutputModelsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> idOrder = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> idCustomer = const Value.absent(),
              }) => OrderOutputModelsCompanion(
                idOrder: idOrder,
                date: date,
                status: status,
                idCustomer: idCustomer,
              ),
          createCompanionCallback:
              ({
                Value<int> idOrder = const Value.absent(),
                required DateTime date,
                required String status,
                required int idCustomer,
              }) => OrderOutputModelsCompanion.insert(
                idOrder: idOrder,
                date: date,
                status: status,
                idCustomer: idCustomer,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderOutputModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderOutputModelsTable,
      OrderOutputModel,
      $$OrderOutputModelsTableFilterComposer,
      $$OrderOutputModelsTableOrderingComposer,
      $$OrderOutputModelsTableAnnotationComposer,
      $$OrderOutputModelsTableCreateCompanionBuilder,
      $$OrderOutputModelsTableUpdateCompanionBuilder,
      (
        OrderOutputModel,
        BaseReferences<
          _$AppDatabase,
          $OrderOutputModelsTable,
          OrderOutputModel
        >,
      ),
      OrderOutputModel,
      PrefetchHooks Function()
    >;
typedef $$OrderDetailModelsTableCreateCompanionBuilder =
    OrderDetailModelsCompanion Function({
      Value<int> idDetail,
      required int idOrder,
      required int amount,
    });
typedef $$OrderDetailModelsTableUpdateCompanionBuilder =
    OrderDetailModelsCompanion Function({
      Value<int> idDetail,
      Value<int> idOrder,
      Value<int> amount,
    });

class $$OrderDetailModelsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderDetailModelsTable> {
  $$OrderDetailModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idDetail => $composableBuilder(
    column: $table.idDetail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idOrder => $composableBuilder(
    column: $table.idOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderDetailModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderDetailModelsTable> {
  $$OrderDetailModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idDetail => $composableBuilder(
    column: $table.idDetail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idOrder => $composableBuilder(
    column: $table.idOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderDetailModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderDetailModelsTable> {
  $$OrderDetailModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idDetail =>
      $composableBuilder(column: $table.idDetail, builder: (column) => column);

  GeneratedColumn<int> get idOrder =>
      $composableBuilder(column: $table.idOrder, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
}

class $$OrderDetailModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderDetailModelsTable,
          OrderDetailModel,
          $$OrderDetailModelsTableFilterComposer,
          $$OrderDetailModelsTableOrderingComposer,
          $$OrderDetailModelsTableAnnotationComposer,
          $$OrderDetailModelsTableCreateCompanionBuilder,
          $$OrderDetailModelsTableUpdateCompanionBuilder,
          (
            OrderDetailModel,
            BaseReferences<
              _$AppDatabase,
              $OrderDetailModelsTable,
              OrderDetailModel
            >,
          ),
          OrderDetailModel,
          PrefetchHooks Function()
        > {
  $$OrderDetailModelsTableTableManager(
    _$AppDatabase db,
    $OrderDetailModelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderDetailModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderDetailModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderDetailModelsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> idDetail = const Value.absent(),
                Value<int> idOrder = const Value.absent(),
                Value<int> amount = const Value.absent(),
              }) => OrderDetailModelsCompanion(
                idDetail: idDetail,
                idOrder: idOrder,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> idDetail = const Value.absent(),
                required int idOrder,
                required int amount,
              }) => OrderDetailModelsCompanion.insert(
                idDetail: idDetail,
                idOrder: idOrder,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderDetailModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderDetailModelsTable,
      OrderDetailModel,
      $$OrderDetailModelsTableFilterComposer,
      $$OrderDetailModelsTableOrderingComposer,
      $$OrderDetailModelsTableAnnotationComposer,
      $$OrderDetailModelsTableCreateCompanionBuilder,
      $$OrderDetailModelsTableUpdateCompanionBuilder,
      (
        OrderDetailModel,
        BaseReferences<
          _$AppDatabase,
          $OrderDetailModelsTable,
          OrderDetailModel
        >,
      ),
      OrderDetailModel,
      PrefetchHooks Function()
    >;
typedef $$CustomerModelsTableCreateCompanionBuilder =
    CustomerModelsCompanion Function({
      Value<int> customerId,
      required String name,
      required String lastName,
      required String nit,
    });
typedef $$CustomerModelsTableUpdateCompanionBuilder =
    CustomerModelsCompanion Function({
      Value<int> customerId,
      Value<String> name,
      Value<String> lastName,
      Value<String> nit,
    });

class $$CustomerModelsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerModelsTable> {
  $$CustomerModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nit => $composableBuilder(
    column: $table.nit,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomerModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerModelsTable> {
  $$CustomerModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nit => $composableBuilder(
    column: $table.nit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomerModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerModelsTable> {
  $$CustomerModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get nit =>
      $composableBuilder(column: $table.nit, builder: (column) => column);
}

class $$CustomerModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomerModelsTable,
          CustomerModel,
          $$CustomerModelsTableFilterComposer,
          $$CustomerModelsTableOrderingComposer,
          $$CustomerModelsTableAnnotationComposer,
          $$CustomerModelsTableCreateCompanionBuilder,
          $$CustomerModelsTableUpdateCompanionBuilder,
          (
            CustomerModel,
            BaseReferences<_$AppDatabase, $CustomerModelsTable, CustomerModel>,
          ),
          CustomerModel,
          PrefetchHooks Function()
        > {
  $$CustomerModelsTableTableManager(
    _$AppDatabase db,
    $CustomerModelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> customerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> nit = const Value.absent(),
              }) => CustomerModelsCompanion(
                customerId: customerId,
                name: name,
                lastName: lastName,
                nit: nit,
              ),
          createCompanionCallback:
              ({
                Value<int> customerId = const Value.absent(),
                required String name,
                required String lastName,
                required String nit,
              }) => CustomerModelsCompanion.insert(
                customerId: customerId,
                name: name,
                lastName: lastName,
                nit: nit,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomerModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomerModelsTable,
      CustomerModel,
      $$CustomerModelsTableFilterComposer,
      $$CustomerModelsTableOrderingComposer,
      $$CustomerModelsTableAnnotationComposer,
      $$CustomerModelsTableCreateCompanionBuilder,
      $$CustomerModelsTableUpdateCompanionBuilder,
      (
        CustomerModel,
        BaseReferences<_$AppDatabase, $CustomerModelsTable, CustomerModel>,
      ),
      CustomerModel,
      PrefetchHooks Function()
    >;
typedef $$SessionModelsTableCreateCompanionBuilder =
    SessionModelsCompanion Function({
      Value<int> idSession,
      required String status,
      required String device,
      required String ip,
    });
typedef $$SessionModelsTableUpdateCompanionBuilder =
    SessionModelsCompanion Function({
      Value<int> idSession,
      Value<String> status,
      Value<String> device,
      Value<String> ip,
    });

class $$SessionModelsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionModelsTable> {
  $$SessionModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idSession => $composableBuilder(
    column: $table.idSession,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get device => $composableBuilder(
    column: $table.device,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ip => $composableBuilder(
    column: $table.ip,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionModelsTable> {
  $$SessionModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idSession => $composableBuilder(
    column: $table.idSession,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get device => $composableBuilder(
    column: $table.device,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ip => $composableBuilder(
    column: $table.ip,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionModelsTable> {
  $$SessionModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idSession =>
      $composableBuilder(column: $table.idSession, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get device =>
      $composableBuilder(column: $table.device, builder: (column) => column);

  GeneratedColumn<String> get ip =>
      $composableBuilder(column: $table.ip, builder: (column) => column);
}

class $$SessionModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionModelsTable,
          SessionModel,
          $$SessionModelsTableFilterComposer,
          $$SessionModelsTableOrderingComposer,
          $$SessionModelsTableAnnotationComposer,
          $$SessionModelsTableCreateCompanionBuilder,
          $$SessionModelsTableUpdateCompanionBuilder,
          (
            SessionModel,
            BaseReferences<_$AppDatabase, $SessionModelsTable, SessionModel>,
          ),
          SessionModel,
          PrefetchHooks Function()
        > {
  $$SessionModelsTableTableManager(_$AppDatabase db, $SessionModelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idSession = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> device = const Value.absent(),
                Value<String> ip = const Value.absent(),
              }) => SessionModelsCompanion(
                idSession: idSession,
                status: status,
                device: device,
                ip: ip,
              ),
          createCompanionCallback:
              ({
                Value<int> idSession = const Value.absent(),
                required String status,
                required String device,
                required String ip,
              }) => SessionModelsCompanion.insert(
                idSession: idSession,
                status: status,
                device: device,
                ip: ip,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionModelsTable,
      SessionModel,
      $$SessionModelsTableFilterComposer,
      $$SessionModelsTableOrderingComposer,
      $$SessionModelsTableAnnotationComposer,
      $$SessionModelsTableCreateCompanionBuilder,
      $$SessionModelsTableUpdateCompanionBuilder,
      (
        SessionModel,
        BaseReferences<_$AppDatabase, $SessionModelsTable, SessionModel>,
      ),
      SessionModel,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserModelsTableTableManager get userModels =>
      $$UserModelsTableTableManager(_db, _db.userModels);
  $$SaleModelsTableTableManager get saleModels =>
      $$SaleModelsTableTableManager(_db, _db.saleModels);
  $$OrderEntryModelsTableTableManager get orderEntryModels =>
      $$OrderEntryModelsTableTableManager(_db, _db.orderEntryModels);
  $$OrderOutputModelsTableTableManager get orderOutputModels =>
      $$OrderOutputModelsTableTableManager(_db, _db.orderOutputModels);
  $$OrderDetailModelsTableTableManager get orderDetailModels =>
      $$OrderDetailModelsTableTableManager(_db, _db.orderDetailModels);
  $$CustomerModelsTableTableManager get customerModels =>
      $$CustomerModelsTableTableManager(_db, _db.customerModels);
  $$SessionModelsTableTableManager get sessionModels =>
      $$SessionModelsTableTableManager(_db, _db.sessionModels);
}
