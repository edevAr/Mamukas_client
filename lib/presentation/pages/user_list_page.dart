import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/user_status.dart';
import '../../core/di/injection.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>()..add(LoadAllUsers()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Usuarios'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showCreateUserDialog(context),
            ),
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              if (state.users.isEmpty) {
                return const Center(
                  child: Text(
                    'No hay usuarios registrados',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getStatusColor(user.status),
                        child: Text(
                          user.name[0].toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text('${user.name} ${user.lastName}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Usuario: ${user.username}'),
                          Text('CI: ${user.ci}'),
                          Text('Edad: ${user.age}'),
                          Text('Estado: ${user.status.value}'),
                        ],
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Editar'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Eliminar'),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'edit') {
                            _showEditUserDialog(context, user);
                          } else if (value == 'delete') {
                            _showDeleteConfirmation(context, user);
                          }
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (state is UserError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(LoadAllUsers());
                      },
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('Estado desconocido'));
          },
        ),
      ),
    );
  }

  Color _getStatusColor(UserStatus status) {
    switch (status) {
      case UserStatus.active:
        return Colors.green;
      case UserStatus.inactive:
        return Colors.red;
      case UserStatus.pendingActivation:
        return Colors.orange;
    }
  }

  void _showCreateUserDialog(BuildContext context) {
    _showUserDialog(context, null);
  }

  void _showEditUserDialog(BuildContext context, User user) {
    _showUserDialog(context, user);
  }

  void _showUserDialog(BuildContext context, User? existingUser) {
    final formKey = GlobalKey<FormState>();
    final usernameController = TextEditingController(text: existingUser?.username ?? '');
    final passwordController = TextEditingController(text: existingUser?.password ?? '');
    final nameController = TextEditingController(text: existingUser?.name ?? '');
    final lastNameController = TextEditingController(text: existingUser?.lastName ?? '');
    final ciController = TextEditingController(text: existingUser?.ci ?? '');
    final ageController = TextEditingController(text: existingUser?.age.toString() ?? '');
    UserStatus selectedStatus = existingUser?.status ?? UserStatus.pendingActivation;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(existingUser == null ? 'Crear Usuario' : 'Editar Usuario'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                  validator: (value) => value?.isEmpty == true ? 'Requerido' : null,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  validator: (value) => value?.isEmpty == true ? 'Requerido' : null,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) => value?.isEmpty == true ? 'Requerido' : null,
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Apellido'),
                  validator: (value) => value?.isEmpty == true ? 'Requerido' : null,
                ),
                TextFormField(
                  controller: ciController,
                  decoration: const InputDecoration(labelText: 'CI'),
                  validator: (value) => value?.isEmpty == true ? 'Requerido' : null,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty == true) return 'Requerido';
                    final age = int.tryParse(value!);
                    if (age == null || age <= 0) return 'Edad inválida';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<UserStatus>(
                  value: selectedStatus,
                  decoration: const InputDecoration(labelText: 'Estado'),
                  items: UserStatus.values.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text(status.value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) selectedStatus = value;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final user = User(
                  idUser: existingUser?.idUser,
                  username: usernameController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  lastName: lastNameController.text,
                  ci: ciController.text,
                  age: int.parse(ageController.text),
                  status: selectedStatus,
                );

                if (existingUser == null) {
                  context.read<UserBloc>().add(CreateUser(user));
                } else {
                  context.read<UserBloc>().add(UpdateUser(user));
                }

                Navigator.of(dialogContext).pop();
              }
            },
            child: Text(existingUser == null ? 'Crear' : 'Actualizar'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: Text('¿Está seguro de que desea eliminar al usuario ${user.username}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context.read<UserBloc>().add(DeleteUser(user.idUser!));
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}