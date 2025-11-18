enum Gender {
  male('Male'),
  female('Female'),
  other('Other');

  const Gender(this.value);
  final String value;

  String get displayName {
    switch (this) {
      case Gender.male:
        return 'Masculino';
      case Gender.female:
        return 'Femenino';
      case Gender.other:
        return 'Otro';
    }
  }

  static Gender fromString(String gender) {
    switch (gender) {
      case 'Male':
        return Gender.male;
      case 'Female':
        return Gender.female;
      case 'Other':
        return Gender.other;
      default:
        throw ArgumentError('Invalid gender: $gender');
    }
  }

  @override
  String toString() => value;
}