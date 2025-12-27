import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/pages/auth/simple_login_page.dart';
import 'presentation/bloc/auth/simple_auth_bloc.dart';
import 'presentation/bloc/auth/auth_state.dart';
import 'presentation/bloc/auth/auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MamukaERPSimpleApp());
}

class MamukaERPSimpleApp extends StatelessWidget {
  const MamukaERPSimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimpleAuthBloc()..add(const CheckAuthStatus()),
      child: MaterialApp(
        title: 'Mamuka ERP - Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 2,
          ),
          cardTheme: const CardThemeData(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.grey[50],
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthWrapperSimple(),
          '/home': (context) => const SimpleHomePage(),
          SimpleLoginPage.routeName: (context) => const SimpleLoginPage(),
        },
      ),
    );
  }
}

class AuthWrapperSimple extends StatelessWidget {
  const AuthWrapperSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleAuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return const SimpleHomePage();
        } else if (state.status == AuthenticationStatus.loading ||
                   state.status == AuthenticationStatus.initial) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const SimpleLoginPage();
        }
      },
    );
  }
}

class SimpleHomePage extends StatelessWidget {
  const SimpleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SimpleAuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.of(context).pushReplacementNamed('/');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mamuka ERP - Demo'),
          actions: [
            BlocBuilder<SimpleAuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthAuthenticated) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Center(
                      child: Text(
                        'Bienvenido, ${state.user!.name}!',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Cerrar Sesión'),
                      content: const Text('¿Estás seguro que deseas cerrar sesión?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Cerrar Sesión'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.read<SimpleAuthBloc>().add(const LogoutRequested());
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_work,
                size: 100,
                color: Colors.blue,
              ),
              SizedBox(height: 24),
              Text(
                'Mamuka ERP Demo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Sistema de Gestión para Productos del Hogar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        '¡Autenticación Exitosa!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'La pantalla de login está funcionando correctamente.',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Próximos pasos:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• Integrar con base de datos real\n• Añadir páginas de registro\n• Implementar gestión de usuarios\n• Crear módulos de ventas\n• Añadir gestión de productos',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}