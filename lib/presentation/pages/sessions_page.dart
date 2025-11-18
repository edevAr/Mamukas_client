import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/session_status.dart';
import '../../domain/entities/session.dart';
import '../bloc/session_bloc.dart';
import '../bloc/session_event.dart';
import '../bloc/session_state.dart';

class SessionsPage extends StatelessWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sessions'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'all',
                child: Text('Show All'),
              ),
              const PopupMenuItem(
                value: 'active',
                child: Text('Show Active Only'),
              ),
              const PopupMenuItem(
                value: 'deactivate_all',
                child: Text('Deactivate All'),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'all':
                  context.read<SessionBloc>().add(LoadAllSessions());
                  break;
                case 'active':
                  context.read<SessionBloc>().add(LoadActiveSessions());
                  break;
                case 'deactivate_all':
                  _showDeactivateAllConfirmation(context);
                  break;
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          if (state is SessionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SessionsLoaded) {
            if (state.sessions.isEmpty) {
              return const Center(
                child: Text(
                  'No sessions found',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.sessions.length,
              itemBuilder: (context, index) {
                final session = state.sessions[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Session #${session.idSession}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status: ${session.status.value}'),
                        Text('Device: ${session.device}'),
                        Text('IP: ${session.ip}'),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundColor: session.status == SessionStatus.active 
                          ? Colors.green 
                          : Colors.red,
                      child: Icon(
                        session.status == SessionStatus.active 
                            ? Icons.check 
                            : Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'toggle',
                          child: Text(
                            session.status == SessionStatus.active 
                                ? 'Deactivate' 
                                : 'Activate'
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                      onSelected: (value) {
                        if (value == 'delete' && session.idSession != null) {
                          _showDeleteConfirmation(context, session.idSession!);
                        } else if (value == 'toggle') {
                          final newStatus = session.status == SessionStatus.active 
                              ? SessionStatus.inactive 
                              : SessionStatus.active;
                          final updatedSession = session.copyWith(status: newStatus);
                          context.read<SessionBloc>().add(UpdateSession(updatedSession));
                        }
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is SessionError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${state.message}',
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SessionBloc>().add(LoadAllSessions());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Welcome to Sessions'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateSessionDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int sessionId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Session'),
        content: const Text('Are you sure you want to delete this session?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<SessionBloc>().add(DeleteSession(sessionId));
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showDeactivateAllConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deactivate All Sessions'),
        content: const Text('Are you sure you want to deactivate all sessions?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<SessionBloc>().add(DeactivateAllSessions());
              Navigator.of(context).pop();
            },
            child: const Text('Deactivate All'),
          ),
        ],
      ),
    );
  }

  void _showCreateSessionDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String device = '';
    String ip = '';
    SessionStatus status = SessionStatus.active;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Session'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<SessionStatus>(
                  decoration: const InputDecoration(labelText: 'Status'),
                  value: status,
                  items: SessionStatus.values.map((SessionStatus status) {
                    return DropdownMenuItem<SessionStatus>(
                      value: status,
                      child: Text(status.value),
                    );
                  }).toList(),
                  onChanged: (SessionStatus? newValue) {
                    if (newValue != null) {
                      status = newValue;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Device'),
                  onSaved: (value) => device = value ?? '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a device name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'IP Address'),
                  onSaved: (value) => ip = value ?? '',
                  validator: (value) {
                    if (value == null || value.length < 7) {
                      return 'Please enter a valid IP address';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                formKey.currentState?.save();
                final session = Session(
                  status: status,
                  device: device,
                  ip: ip,
                );
                context.read<SessionBloc>().add(CreateSession(session));
                Navigator.of(context).pop();
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}