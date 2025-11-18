import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/dependency_injection.dart' as di;
import '../bloc/user_bloc.dart';
import '../bloc/sale_bloc.dart';
import '../bloc/customer_bloc.dart';
import '../bloc/session_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/sale_event.dart';
import '../bloc/customer_event.dart';
import '../bloc/session_event.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import 'users_page.dart';
import 'sales_page.dart';
import 'customers_page.dart';
import 'sessions_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider<UserBloc>(
      create: (context) => di.sl<UserBloc>()..add(LoadAllUsers()),
      child: const UsersPage(),
    ),
    BlocProvider<SaleBloc>(
      create: (context) => di.sl<SaleBloc>()..add(LoadAllSales()),
      child: const SalesPage(),
    ),
    BlocProvider<CustomerBloc>(
      create: (context) => di.sl<CustomerBloc>()..add(LoadAllCustomers()),
      child: const CustomersPage(),
    ),
    BlocProvider<SessionBloc>(
      create: (context) => di.sl<SessionBloc>()..add(LoadAllSessions()),
      child: const SessionsPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mamuka ERP'),
        actions: [
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
                          context.read<AuthBloc>().add(const LogoutRequested());
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sales',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            label: 'Sessions',
          ),
        ],
      ),
    );
  }
}