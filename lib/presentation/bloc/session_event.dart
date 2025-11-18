import 'package:equatable/equatable.dart';
import '../../domain/entities/session.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class LoadAllSessions extends SessionEvent {}

class LoadSessionById extends SessionEvent {
  final int id;

  const LoadSessionById(this.id);

  @override
  List<Object> get props => [id];
}

class LoadSessionsByStatus extends SessionEvent {
  final String status;

  const LoadSessionsByStatus(this.status);

  @override
  List<Object> get props => [status];
}

class LoadSessionsByDevice extends SessionEvent {
  final String device;

  const LoadSessionsByDevice(this.device);

  @override
  List<Object> get props => [device];
}

class LoadSessionsByIp extends SessionEvent {
  final String ip;

  const LoadSessionsByIp(this.ip);

  @override
  List<Object> get props => [ip];
}

class LoadActiveSessions extends SessionEvent {}

class CreateSession extends SessionEvent {
  final Session session;

  const CreateSession(this.session);

  @override
  List<Object> get props => [session];
}

class UpdateSession extends SessionEvent {
  final Session session;

  const UpdateSession(this.session);

  @override
  List<Object> get props => [session];
}

class DeleteSession extends SessionEvent {
  final int id;

  const DeleteSession(this.id);

  @override
  List<Object> get props => [id];
}

class DeactivateAllSessions extends SessionEvent {}

class DeactivateSessionsByDevice extends SessionEvent {
  final String device;

  const DeactivateSessionsByDevice(this.device);

  @override
  List<Object> get props => [device];
}