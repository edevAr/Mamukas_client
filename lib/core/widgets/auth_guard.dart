import 'package:flutter/material.dart';
import '../../core/services/auth_service.dart';
import '../../presentation/pages/demo_login_page.dart';

/// Widget guard que protege rutas requiriendo autenticación válida
/// Si el usuario no está autenticado o el token está expirado,
/// redirige automáticamente al login
class AuthGuard extends StatelessWidget {
  final Widget child;
  
  const AuthGuard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Verificar si hay un token y si es válido
    final isAuthenticated = AuthService.isAuthenticated;
    final token = AuthService.accessToken;
    
    // Verificar si el token existe y no está expirado
    if (!isAuthenticated || token == null || AuthService.isTokenExpired) {
      // Si no está autenticado, redirigir al login
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const DemoLoginPage()),
          (route) => false, // Eliminar todas las rutas anteriores
        );
      });
      
      // Mientras redirige, mostrar un indicador de carga
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    // Si está autenticado, mostrar el contenido protegido
    return child;
  }
}

