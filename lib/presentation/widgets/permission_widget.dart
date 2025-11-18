import 'package:flutter/material.dart';
import '../../core/services/auth_service.dart';

/// Widget que muestra contenido condicionalmente basado en permisos del usuario
class PermissionWidget extends StatelessWidget {
  /// Permiso específico requerido
  final String? requiredPermission;
  
  /// Lista de permisos donde cualquiera es suficiente (OR)
  final List<String>? anyOfPermissions;
  
  /// Lista de permisos donde todos son requeridos (AND)
  final List<String>? allOfPermissions;
  
  /// Widget hijo a mostrar si tiene permisos
  final Widget child;
  
  /// Widget alternativo si no tiene permisos
  final Widget? fallback;
  
  /// Función personalizada de verificación de permisos
  final bool Function()? customPermissionCheck;

  const PermissionWidget({
    super.key,
    this.requiredPermission,
    this.anyOfPermissions,
    this.allOfPermissions,
    required this.child,
    this.fallback,
    this.customPermissionCheck,
  }) : assert(
          (requiredPermission != null) ||
          (anyOfPermissions != null) ||
          (allOfPermissions != null) ||
          (customPermissionCheck != null),
          'Debe especificar al menos un tipo de verificación de permisos'
        );

  @override
  Widget build(BuildContext context) {
    bool hasAccess = _checkPermissions();
    return hasAccess ? child : (fallback ?? const SizedBox.shrink());
  }

  bool _checkPermissions() {
    // Verificación personalizada tiene prioridad
    if (customPermissionCheck != null) {
      return customPermissionCheck!();
    }
    
    // Verificar permiso específico
    if (requiredPermission != null) {
      return AuthService.hasPermission(requiredPermission!);
    }
    
    // Verificar cualquier permiso de la lista (OR)
    if (anyOfPermissions != null) {
      return AuthService.hasAnyPermission(anyOfPermissions!);
    }
    
    // Verificar todos los permisos de la lista (AND)
    if (allOfPermissions != null) {
      return AuthService.hasAllPermissions(allOfPermissions!);
    }
    
    return false;
  }
}

/// Widget específico para verificación de rol de administrador
class AdminOnlyWidget extends StatelessWidget {
  final Widget child;
  final Widget? fallback;

  const AdminOnlyWidget({
    super.key,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return PermissionWidget(
      customPermissionCheck: () => AuthService.isAdmin,
      child: child,
      fallback: fallback,
    );
  }
}

/// Widget específico para verificación de rol de manager o superior
class ManagerOrAboveWidget extends StatelessWidget {
  final Widget child;
  final Widget? fallback;

  const ManagerOrAboveWidget({
    super.key,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return PermissionWidget(
      anyOfPermissions: const ['MANAGER', 'ADMIN'],
      child: child,
      fallback: fallback,
    );
  }
}

/// Widget para mostrar información de permisos del usuario actual
/*class UserPermissionsDebugWidget extends StatelessWidget {
  const UserPermissionsDebugWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF007AFF).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                size: 16,
                color: Color(0xFF007AFF),
              ),
              const SizedBox(width: 8),
              Text(
                'Usuario: ${AuthService.username ?? "No autenticado"}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007AFF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Permisos: ${AuthService.permissions.join(", ")}',
            style: TextStyle(
              fontSize: 10,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}*/

/// Extensión para facilitar el uso de permisos en widgets
extension PermissionWidgetExtensions on Widget {
  /// Wrapper para mostrar el widget solo si tiene el permiso específico
  Widget requiresPermission(String permission, {Widget? fallback}) {
    return PermissionWidget(
      requiredPermission: permission,
      child: this,
      fallback: fallback,
    );
  }

  /// Wrapper para mostrar el widget solo si tiene alguno de los permisos
  Widget requiresAnyPermission(List<String> permissions, {Widget? fallback}) {
    return PermissionWidget(
      anyOfPermissions: permissions,
      child: this,
      fallback: fallback,
    );
  }

  /// Wrapper para mostrar el widget solo si es administrador
  Widget adminOnly({Widget? fallback}) {
    return AdminOnlyWidget(
      child: this,
      fallback: fallback,
    );
  }

  /// Wrapper para mostrar el widget solo si es manager o superior
  Widget managerOrAbove({Widget? fallback}) {
    return ManagerOrAboveWidget(
      child: this,
      fallback: fallback,
    );
  }
}