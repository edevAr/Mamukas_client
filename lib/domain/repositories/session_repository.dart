import '../entities/session.dart';

abstract class SessionRepository {
  Future<List<Session>> getAllSessions();
  Future<Session?> getSessionById(int id);
  Future<List<Session>> getSessionsByStatus(String status);
  Future<List<Session>> getSessionsByDevice(String device);
  Future<List<Session>> getSessionsByIp(String ip);
  Future<List<Session>> getActiveSessions();
  Future<int> insertSession(Session session);
  Future<bool> updateSession(Session session);
  Future<bool> deleteSession(int id);
  Future<bool> deactivateAllSessions();
  Future<bool> deactivateSessionsByDevice(String device);
}