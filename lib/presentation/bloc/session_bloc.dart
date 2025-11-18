import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/session_usecases.dart';
import 'session_event.dart';
import 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final GetAllSessionsUseCase getAllSessionsUseCase;
  final GetSessionByIdUseCase getSessionByIdUseCase;
  final GetSessionsByStatusUseCase getSessionsByStatusUseCase;
  final GetSessionsByDeviceUseCase getSessionsByDeviceUseCase;
  final GetSessionsByIpUseCase getSessionsByIpUseCase;
  final GetActiveSessionsUseCase getActiveSessionsUseCase;
  final CreateSessionUseCase createSessionUseCase;
  final UpdateSessionUseCase updateSessionUseCase;
  final DeleteSessionUseCase deleteSessionUseCase;
  final DeactivateAllSessionsUseCase deactivateAllSessionsUseCase;
  final DeactivateSessionsByDeviceUseCase deactivateSessionsByDeviceUseCase;

  SessionBloc({
    required this.getAllSessionsUseCase,
    required this.getSessionByIdUseCase,
    required this.getSessionsByStatusUseCase,
    required this.getSessionsByDeviceUseCase,
    required this.getSessionsByIpUseCase,
    required this.getActiveSessionsUseCase,
    required this.createSessionUseCase,
    required this.updateSessionUseCase,
    required this.deleteSessionUseCase,
    required this.deactivateAllSessionsUseCase,
    required this.deactivateSessionsByDeviceUseCase,
  }) : super(SessionInitial()) {
    on<LoadAllSessions>(_onLoadAllSessions);
    on<LoadSessionById>(_onLoadSessionById);
    on<LoadSessionsByStatus>(_onLoadSessionsByStatus);
    on<LoadSessionsByDevice>(_onLoadSessionsByDevice);
    on<LoadSessionsByIp>(_onLoadSessionsByIp);
    on<LoadActiveSessions>(_onLoadActiveSessions);
    on<CreateSession>(_onCreateSession);
    on<UpdateSession>(_onUpdateSession);
    on<DeleteSession>(_onDeleteSession);
    on<DeactivateAllSessions>(_onDeactivateAllSessions);
    on<DeactivateSessionsByDevice>(_onDeactivateSessionsByDevice);
  }

  Future<void> _onLoadAllSessions(LoadAllSessions event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final sessions = await getAllSessionsUseCase();
      emit(SessionsLoaded(sessions));
    } catch (e) {
      emit(SessionError('Error loading sessions: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSessionById(LoadSessionById event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final session = await getSessionByIdUseCase(event.id);
      if (session != null) {
        emit(SessionLoaded(session));
      } else {
        emit(const SessionError('Session not found'));
      }
    } catch (e) {
      emit(SessionError('Error loading session: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSessionsByStatus(LoadSessionsByStatus event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final sessions = await getSessionsByStatusUseCase(event.status);
      emit(SessionsLoaded(sessions));
    } catch (e) {
      emit(SessionError('Error loading sessions by status: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSessionsByDevice(LoadSessionsByDevice event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final sessions = await getSessionsByDeviceUseCase(event.device);
      emit(SessionsLoaded(sessions));
    } catch (e) {
      emit(SessionError('Error loading sessions by device: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSessionsByIp(LoadSessionsByIp event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final sessions = await getSessionsByIpUseCase(event.ip);
      emit(SessionsLoaded(sessions));
    } catch (e) {
      emit(SessionError('Error loading sessions by IP: ${e.toString()}'));
    }
  }

  Future<void> _onLoadActiveSessions(LoadActiveSessions event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final sessions = await getActiveSessionsUseCase();
      emit(SessionsLoaded(sessions));
    } catch (e) {
      emit(SessionError('Error loading active sessions: ${e.toString()}'));
    }
  }

  Future<void> _onCreateSession(CreateSession event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      await createSessionUseCase(event.session);
      emit(const SessionOperationSuccess('Session created successfully'));
    } catch (e) {
      emit(SessionError('Error creating session: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateSession(UpdateSession event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final success = await updateSessionUseCase(event.session);
      if (success) {
        emit(const SessionOperationSuccess('Session updated successfully'));
      } else {
        emit(const SessionError('Failed to update session'));
      }
    } catch (e) {
      emit(SessionError('Error updating session: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteSession(DeleteSession event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final success = await deleteSessionUseCase(event.id);
      if (success) {
        emit(const SessionOperationSuccess('Session deleted successfully'));
      } else {
        emit(const SessionError('Failed to delete session'));
      }
    } catch (e) {
      emit(SessionError('Error deleting session: ${e.toString()}'));
    }
  }

  Future<void> _onDeactivateAllSessions(DeactivateAllSessions event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final success = await deactivateAllSessionsUseCase();
      if (success) {
        emit(const SessionOperationSuccess('All sessions deactivated successfully'));
      } else {
        emit(const SessionError('Failed to deactivate all sessions'));
      }
    } catch (e) {
      emit(SessionError('Error deactivating all sessions: ${e.toString()}'));
    }
  }

  Future<void> _onDeactivateSessionsByDevice(DeactivateSessionsByDevice event, Emitter<SessionState> emit) async {
    emit(SessionLoading());
    try {
      final success = await deactivateSessionsByDeviceUseCase(event.device);
      if (success) {
        emit(const SessionOperationSuccess('Device sessions deactivated successfully'));
      } else {
        emit(const SessionError('Failed to deactivate device sessions'));
      }
    } catch (e) {
      emit(SessionError('Error deactivating device sessions: ${e.toString()}'));
    }
  }
}