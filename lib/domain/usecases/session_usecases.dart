import '../entities/session.dart';
import '../repositories/session_repository.dart';

class GetAllSessionsUseCase {
  final SessionRepository repository;

  GetAllSessionsUseCase({required this.repository});

  Future<List<Session>> call() async {
    return await repository.getAllSessions();
  }
}

class GetSessionByIdUseCase {
  final SessionRepository repository;

  GetSessionByIdUseCase({required this.repository});

  Future<Session?> call(int id) async {
    return await repository.getSessionById(id);
  }
}

class GetSessionsByStatusUseCase {
  final SessionRepository repository;

  GetSessionsByStatusUseCase({required this.repository});

  Future<List<Session>> call(String status) async {
    return await repository.getSessionsByStatus(status);
  }
}

class GetSessionsByDeviceUseCase {
  final SessionRepository repository;

  GetSessionsByDeviceUseCase({required this.repository});

  Future<List<Session>> call(String device) async {
    return await repository.getSessionsByDevice(device);
  }
}

class GetSessionsByIpUseCase {
  final SessionRepository repository;

  GetSessionsByIpUseCase({required this.repository});

  Future<List<Session>> call(String ip) async {
    return await repository.getSessionsByIp(ip);
  }
}

class GetActiveSessionsUseCase {
  final SessionRepository repository;

  GetActiveSessionsUseCase({required this.repository});

  Future<List<Session>> call() async {
    return await repository.getActiveSessions();
  }
}

class CreateSessionUseCase {
  final SessionRepository repository;

  CreateSessionUseCase({required this.repository});

  Future<int> call(Session session) async {
    return await repository.insertSession(session);
  }
}

class UpdateSessionUseCase {
  final SessionRepository repository;

  UpdateSessionUseCase({required this.repository});

  Future<bool> call(Session session) async {
    return await repository.updateSession(session);
  }
}

class DeleteSessionUseCase {
  final SessionRepository repository;

  DeleteSessionUseCase({required this.repository});

  Future<bool> call(int id) async {
    return await repository.deleteSession(id);
  }
}

class DeactivateAllSessionsUseCase {
  final SessionRepository repository;

  DeactivateAllSessionsUseCase({required this.repository});

  Future<bool> call() async {
    return await repository.deactivateAllSessions();
  }
}

class DeactivateSessionsByDeviceUseCase {
  final SessionRepository repository;

  DeactivateSessionsByDeviceUseCase({required this.repository});

  Future<bool> call(String device) async {
    return await repository.deactivateSessionsByDevice(device);
  }
}