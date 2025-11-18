enum SessionStatus {
  active('Active'),
  inactive('Inactive');

  const SessionStatus(this.value);
  final String value;

  static SessionStatus fromString(String status) {
    switch (status) {
      case 'Active':
        return SessionStatus.active;
      case 'Inactive':
        return SessionStatus.inactive;
      default:
        throw ArgumentError('Invalid session status: $status');
    }
  }

  @override
  String toString() => value;
}