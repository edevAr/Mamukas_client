import 'package:equatable/equatable.dart';
import '../../domain/entities/session.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class SessionInitial extends SessionState {}

class SessionLoading extends SessionState {}

class SessionsLoaded extends SessionState {
  final List<Session> sessions;

  const SessionsLoaded(this.sessions);

  @override
  List<Object> get props => [sessions];
}

class SessionLoaded extends SessionState {
  final Session session;

  const SessionLoaded(this.session);

  @override
  List<Object> get props => [session];
}

class SessionOperationSuccess extends SessionState {
  final String message;

  const SessionOperationSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class SessionError extends SessionState {
  final String message;

  const SessionError(this.message);

  @override
  List<Object> get props => [message];
}