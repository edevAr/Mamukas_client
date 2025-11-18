import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class WarehouseManagementPage extends StatefulWidget {
  const WarehouseManagementPage({super.key});

  @override
  State<WarehouseManagementPage> createState() => _WarehouseManagementPageState();
}

class _WarehouseManagementPageState extends State<WarehouseManagementPage> {
  final List<Warehouse> _warehouses = Warehouse.sampleWarehouses();
  List<Warehouse> _filteredWarehouses = [];

  @override
  void initState() {
    super.initState();
    _filteredWarehouses = _warehouses;
  }

  Future<List<SearchResult>> _searchWarehouses(String query) async {
    // Simular búsqueda con delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    final filtered = _warehouses
        .where((warehouse) => warehouse.name.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .map((warehouse) => SearchResult(
              title: warehouse.name,
              subtitle: warehouse.location,
              icon: warehouse.icon,
              data: warehouse,
            ))
        .toList();
    
    return filtered;
  }

  void _filterWarehouses(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredWarehouses = _warehouses;
      } else {
        _filteredWarehouses = _warehouses
            .where((warehouse) => 
                warehouse.name.toLowerCase().contains(query.toLowerCase()) ||
                warehouse.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showWarehouseDetail(Warehouse warehouse) {
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
                    color: warehouse.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    warehouse.icon,
                    size: 40,
                    color: warehouse.color,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  warehouse.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  warehouse.location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Productos', warehouse.productCount.toString()),
                    _buildStatItem('Estado', warehouse.isActive ? 'Activo' : 'Inactivo'),
                    _buildStatItem('Capacidad', '${warehouse.capacity}%'),
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
                          content: Text('Gestionando ${warehouse.name}'),
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
                      'Gestionar Almacén',
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
        title: 'Lista de Almacenes',
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
              hintText: 'Buscar almacenes...',
              onSearch: _searchWarehouses,
              onResultSelected: (result) {
                final warehouse = result.data as Warehouse;
                _showWarehouseDetail(warehouse);
              },
            ),
          ),
          
          // Lista de almacenes
          Expanded(
            child: CustomListView<Warehouse>(
              items: _filteredWarehouses,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (warehouse, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: warehouse.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        warehouse.icon,
                        color: warehouse.color,
                        size: 28,
                      ),
                    ),
                    title: Text(
                      warehouse.name,
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
                          warehouse.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
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
                                color: warehouse.isActive 
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                warehouse.isActive ? 'Activo' : 'Inactivo',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: warehouse.isActive 
                                      ? Colors.green 
                                      : Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${warehouse.productCount} productos',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
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
                    onTap: () => _showWarehouseDetail(warehouse),
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
        currentIndex: 0,
        onTap: (index) {
          // Navegación del bottom bar si es necesario
          if (index != 0) {
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
            icon: Icons.search_outlined,
            activeIcon: Icons.search,
            label: 'Buscar',
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

// Modelo de datos para almacenes
class Warehouse {
  final String name;
  final String location;
  final IconData icon;
  final Color color;
  final int productCount;
  final bool isActive;
  final int capacity;

  Warehouse({
    required this.name,
    required this.location,
    required this.icon,
    required this.color,
    required this.productCount,
    required this.isActive,
    required this.capacity,
  });

  static List<Warehouse> sampleWarehouses() {
    return [
      Warehouse(
        name: 'Almacén Central',
        location: 'Av. Principal 123, Centro',
        icon: Icons.warehouse,
        color: Colors.blue,
        productCount: 1250,
        isActive: true,
        capacity: 85,
      ),
      Warehouse(
        name: 'Almacén Norte',
        location: 'Calle Norte 456, Zona Industrial',
        icon: Icons.business,
        color: Colors.green,
        productCount: 890,
        isActive: true,
        capacity: 72,
      ),
      Warehouse(
        name: 'Almacén Sur',
        location: 'Av. Sur 789, Distrito Sur',
        icon: Icons.store,
        color: Colors.orange,
        productCount: 645,
        isActive: true,
        capacity: 58,
      ),
      Warehouse(
        name: 'Almacén Este',
        location: 'Calle Este 321, Zona Este',
        icon: Icons.inventory,
        color: Colors.purple,
        productCount: 0,
        isActive: false,
        capacity: 0,
      ),
      Warehouse(
        name: 'Almacén Temporal',
        location: 'Depósito Temporal, Zona Libre',
        icon: Icons.home_work,
        color: Colors.teal,
        productCount: 234,
        isActive: true,
        capacity: 25,
      ),
      Warehouse(
        name: 'Almacén Express',
        location: 'Hub Logístico, Aeropuerto',
        icon: Icons.local_shipping,
        color: Colors.red,
        productCount: 567,
        isActive: true,
        capacity: 90,
      ),
    ];
  }
}