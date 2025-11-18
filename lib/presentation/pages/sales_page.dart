import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/sale.dart';
import '../bloc/sale_bloc.dart';
import '../bloc/sale_event.dart';
import '../bloc/sale_state.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: BlocBuilder<SaleBloc, SaleState>(
        builder: (context, state) {
          if (state is SaleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SalesLoaded) {
            if (state.sales.isEmpty) {
              return const Center(
                child: Text(
                  'No sales found',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.sales.length,
              itemBuilder: (context, index) {
                final sale = state.sales[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Sale #${sale.idSale}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Employee ID: ${sale.idEmployee}'),
                        Text('Product ID: ${sale.idProduct}'),
                        Text('Client ID: ${sale.idClient}'),
                        Text('Amount: ${sale.amount}'),
                        Text('Subtotal: \$${sale.subtotal.toStringAsFixed(2)}'),
                        Text('Total: \$${sale.total.toStringAsFixed(2)}'),
                        Text('Cash Discount: \$${sale.cashDiscount.toStringAsFixed(2)}'),
                      ],
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                      onSelected: (value) {
                        if (value == 'delete' && sale.idSale != null) {
                          _showDeleteConfirmation(context, sale.idSale!);
                        }
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is SaleError) {
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
                      context.read<SaleBloc>().add(LoadAllSales());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Welcome to Sales'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateSaleDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int saleId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Sale'),
        content: const Text('Are you sure you want to delete this sale?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<SaleBloc>().add(DeleteSale(saleId));
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showCreateSaleDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    int employeeId = 1;
    int productId = 1;
    int amount = 1;
    int clientId = 1;
    double subtotal = 0.0;
    double total = 0.0;
    double cashDiscount = 0.0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Sale'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Employee ID'),
                  keyboardType: TextInputType.number,
                  initialValue: '1',
                  onSaved: (value) => employeeId = int.tryParse(value ?? '1') ?? 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter employee ID';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Product ID'),
                  keyboardType: TextInputType.number,
                  initialValue: '1',
                  onSaved: (value) => productId = int.tryParse(value ?? '1') ?? 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product ID';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  initialValue: '1',
                  onSaved: (value) => amount = int.tryParse(value ?? '1') ?? 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Please enter a valid positive number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Client ID'),
                  keyboardType: TextInputType.number,
                  initialValue: '1',
                  onSaved: (value) => clientId = int.tryParse(value ?? '1') ?? 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter client ID';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subtotal'),
                  keyboardType: TextInputType.number,
                  initialValue: '0.00',
                  onSaved: (value) => subtotal = double.tryParse(value ?? '0.0') ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subtotal';
                    }
                    if (double.tryParse(value) == null || double.parse(value) < 0) {
                      return 'Please enter a valid positive number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Total'),
                  keyboardType: TextInputType.number,
                  initialValue: '0.00',
                  onSaved: (value) => total = double.tryParse(value ?? '0.0') ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total';
                    }
                    if (double.tryParse(value) == null || double.parse(value) < 0) {
                      return 'Please enter a valid positive number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Cash Discount'),
                  keyboardType: TextInputType.number,
                  initialValue: '0.00',
                  onSaved: (value) => cashDiscount = double.tryParse(value ?? '0.0') ?? 0.0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter cash discount';
                    }
                    if (double.tryParse(value) == null || double.parse(value) < 0) {
                      return 'Please enter a valid positive number';
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
                final sale = Sale(
                  idEmployee: employeeId,
                  idProduct: productId,
                  amount: amount,
                  idClient: clientId,
                  subtotal: subtotal,
                  total: total,
                  cashDiscount: cashDiscount,
                );
                context.read<SaleBloc>().add(CreateSale(sale));
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