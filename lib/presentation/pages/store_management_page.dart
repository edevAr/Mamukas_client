import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

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

  void _filterStores(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredStores = _stores;
      } else {
        _filteredStores = _stores
            .where((store) => 
                store.name.toLowerCase().contains(query.toLowerCase()) ||
                store.location.toLowerCase().contains(query.toLowerCase()) ||
                store.manager.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showStoreDetail(Store store) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        
        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: store.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    store.icon,
                    size: 40,
                    color: store.color,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  store.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  store.location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Gerente: ${store.manager}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Ventas', '\$${store.monthlySales}'),
                    _buildStatItem('Estado', store.isOpen ? 'Abierta' : 'Cerrada'),
                    _buildStatItem('Rating', '${store.rating}/5'),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Gestionando ${store.name}'),
                          duration: const Duration(milliseconds: 2000),
                        ),
                      );
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
                      'Gestionar Tienda',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF007AFF),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
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

  Store({
    required this.name,
    required this.location,
    required this.manager,
    required this.icon,
    required this.color,
    required this.monthlySales,
    required this.isOpen,
    required this.rating,
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