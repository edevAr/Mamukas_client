enum UserStatus {
  active('active'),
  inactive('inactive'),
  pendingActivation('pending_activation');

  const UserStatus(this.value);
  final String value;

  static UserStatus fromString(String status) {
    switch (status) {
      case 'active':
        return UserStatus.active;
      case 'inactive':
        return UserStatus.inactive;
      case 'pending_activation':
        return UserStatus.pendingActivation;
      default:
        throw ArgumentError('Invalid user status: $status');
    }
  }

  @override
  String toString() => value;
}