import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'store_detail_page.dart';

class StoreManagementPage extends StatefulWidget {
  const StoreManagementPage({super.key});

  @override
  State<StoreManagementPage> createState() => _StoreManagementPageState();
}

class _StoreManagementPageState extends State<StoreManagementPage> {
  final List<Store> _stores = Store.sampleStores();
  List<Store> _filteredStores = [];

  @override
  void initState() {
    super.initState();
    _filteredStores = _stores;
  }

  Future<List<SearchResult>> _searchStores(String query) async {
    // Simular búsqueda con delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    final filtered = _stores
        .where((store) => store.name.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .map((store) => SearchResult(
              title: store.name,
              subtitle: store.location,
              icon: store.icon,
              data: store,
            ))
        .toList();
    
    return filtered;
  }


  void _showStoreDetail(Store store) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StoreDetailPage(store: store),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(
        title: 'Lista de Tiendas',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          // Buscador
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomSearchBar(
              hintText: 'Buscar tiendas...',
              onSearch: _searchStores,
              onResultSelected: (result) {
                final store = result.data as Store;
                _showStoreDetail(store);
              },
            ),
          ),
          
          // Lista de tiendas
          Expanded(
            child: CustomListView<Store>(
              items: _filteredStores,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (store, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: store.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        store.icon,
                        color: store.color,
                        size: 28,
                      ),
                    ),
                    title: Text(
                      store.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          store.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Gerente: ${store.manager}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: store.isOpen 
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                store.isOpen ? 'Abierta' : 'Cerrada',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: store.isOpen 
                                      ? Colors.green 
                                      : Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '${store.rating}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () => _showStoreDetail(store),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF2C2C2E)
                        : const Color(0xFFF8F9FA),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 1,
        onTap: (index) {
          // Navegación del bottom bar si es necesario
          if (index != 1) {
            Navigator.of(context).pop();
          }
        },
        items: const [
          BottomBarItem(
            icon: Icons.warehouse_outlined,
            activeIcon: Icons.warehouse,
            label: 'Almacenes',
          ),
          BottomBarItem(
            icon: Icons.store_outlined,
            activeIcon: Icons.store,
            label: 'Tiendas',
          ),
          BottomBarItem(
            icon: Icons.inventory_2_outlined,
            activeIcon: Icons.inventory_2,
            label: 'Productos',
          ),
          BottomBarItem(
            icon: Icons.analytics_outlined,
            activeIcon: Icons.analytics,
            label: 'Reportes',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateStoreForm,
        backgroundColor: const Color(0xFF007AFF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showCreateStoreForm() {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final locationController = TextEditingController();
    final managerController = TextEditingController();
    final monthlySalesController = TextEditingController();
    final ratingController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        bool isOpen = true;
        IconData selectedIcon = Icons.store_outlined;
        Color selectedColor = Colors.blue;
        
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  children: [
                    // Handle bar
                    Container(
                      margin: const EdgeInsets.only(top: 12, bottom: 8),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    
                    // Title
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Nueva Tienda',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),
                    
                    // Form
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTextField(
                                controller: nameController,
                                label: 'Nombre',
                                icon: Icons.store_outlined,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'El nombre es requerido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: locationController,
                                label: 'Ubicación',
                                icon: Icons.location_on_outlined,
                                maxLines: 2,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'La ubicación es requerida';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: managerController,
                                label: 'Gerente',
                                icon: Icons.person_outline,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'El gerente es requerido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildTextField(
                                      controller: monthlySalesController,
                                      label: 'Ventas Mensuales',
                                      icon: Icons.attach_money,
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Las ventas son requeridas';
                                        }
                                        if (double.tryParse(value) == null || double.parse(value) < 0) {
                                          return 'Ventas inválidas';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: _buildTextField(
                                      controller: ratingController,
                                      label: 'Rating',
                                      icon: Icons.star_outline,
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'El rating es requerido';
                                        }
                                        final rating = double.tryParse(value);
                                        if (rating == null || rating < 0 || rating > 5) {
                                          return 'Rating inválido (0-5)';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              _buildStatusSwitch(
                                value: isOpen,
                                onChanged: (value) {
                                  setModalState(() {
                                    isOpen = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    // Save button
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final newStore = Store(
                                name: nameController.text.trim(),
                                location: locationController.text.trim(),
                                manager: managerController.text.trim(),
                                icon: selectedIcon,
                                color: selectedColor,
                                monthlySales: double.parse(monthlySalesController.text),
                                isOpen: isOpen,
                                rating: double.parse(ratingController.text),
                              );
                              
                              setState(() {
                                _stores.add(newStore);
                                _filteredStores = _stores;
                              });
                              
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Tienda creada exitosamente'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF007AFF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Guardar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black87,
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        filled: true,
        fillColor: isDark ? const Color(0xFF2C2C2E) : Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF007AFF),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusSwitch({
    required bool value,
    required Function(bool) onChanged,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2C2C2E) : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.store_outlined,
                size: 24,
                color: value ? Colors.green : Colors.grey,
              ),
              const SizedBox(width: 12),
              Text(
                value ? 'Abierta' : 'Cerrada',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF007AFF),
          ),
        ],
      ),
    );
  }
}

// Modelo de datos para tiendas
class Store {
  final String name;
  final String location;
  final String manager;
  final IconData icon;
  final Color color;
  final double monthlySales;
  final bool isOpen;
  final double rating;
  final List<String> images;

  Store({
    required this.name,
    required this.location,
    required this.manager,
    required this.icon,
    required this.color,
    required this.monthlySales,
    required this.isOpen,
    required this.rating,
    this.images = const [],
  });

  static List<Store> sampleStores() {
    return [
      Store(
        name: 'Mamuka Centro',
        location: 'Av. Principal 123, Centro Comercial Plaza',
        manager: 'Ana García',
        icon: Icons.store_mall_directory,
        color: Colors.blue,
        monthlySales: 45000,
        isOpen: true,
        rating: 4.8,
      ),
      Store(
        name: 'Mamuka Norte',
        location: 'Calle Norte 456, Mall del Norte',
        manager: 'Carlos Rodríguez',
        icon: Icons.storefront,
        color: Colors.green,
        monthlySales: 38500,
        isOpen: true,
        rating: 4.6,
      ),
      Store(
        name: 'Mamuka Sur',
        location: 'Av. Sur 789, Centro Comercial Sur',
        manager: 'María López',
        icon: Icons.store,
        color: Colors.orange,
        monthlySales: 42300,
        isOpen: true,
        rating: 4.7,
      ),
      Store(
        name: 'Mamuka Express',
        location: 'Terminal de Buses, Local 15',
        manager: 'José Martínez',
        icon: Icons.local_convenience_store,
        color: Colors.purple,
        monthlySales: 15600,
        isOpen: false,
        rating: 4.2,
      ),
      Store(
        name: 'Mamuka Premium',
        location: 'Zona Residencial, Av. Exclusiva 321',
        manager: 'Laura Sánchez',
        icon: Icons.shopping_bag,
        color: Colors.teal,
        monthlySales: 52000,
        isOpen: true,
        rating: 4.9,
      ),
      Store(
        name: 'Mamuka Outlet',
        location: 'Zona Industrial, Calle Fábrica 654',
        manager: 'Pedro González',
        icon: Icons.discount,
        color: Colors.red,
        monthlySales: 28900,
        isOpen: true,
        rating: 4.4,
      ),
      Store(
        name: 'Mamuka Online',
        location: 'Centro de Distribución Digital',
        manager: 'Sofía Herrera',
        icon: Icons.computer,
        color: Colors.indigo,
        monthlySales: 63000,
        isOpen: true,
        rating: 4.5,
      ),
      Store(
        name: 'Mamuka Mini',
        location: 'Barrio Residencial, Calle Pequeña 98',
        manager: 'Miguel Torres',
        icon: Icons.home_work,
        color: Colors.amber,
        monthlySales: 12500,
        isOpen: true,
        rating: 4.3,
      ),
    ];
  }
}