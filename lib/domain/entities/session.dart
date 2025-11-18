import 'package:equatable/equatable.dart';
import '../../core/constants/session_status.dart';

class Session extends Equatable {
  final int? idSession;
  final SessionStatus status;
  final String device;
  final String ip;

  const Session({
    this.idSession,
    required this.status,
    required this.device,
    required this.ip,
  });

  Session copyWith({
    int? idSession,
    SessionStatus? status,
    String? device,
    String? ip,
  }) {
    return Session(
      idSession: idSession ?? this.idSession,
      status: status ?? this.status,
      device: device ?? this.device,
      ip: ip ?? this.ip,
    );
  }

  @override
  List<Object?> get props => [
        idSession,
        status,
        device,
        ip,
      ];

  @override
  String toString() {
    return 'Session(idSession: $idSession, status: $status, device: $device, ip: $ip)';
  }
}