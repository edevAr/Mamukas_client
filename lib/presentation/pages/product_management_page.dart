import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ProductManagementPage extends StatefulWidget {
  const ProductManagementPage({super.key});

  @override
  State<ProductManagementPage> createState() => _ProductManagementPageState();
}

class _ProductManagementPageState extends State<ProductManagementPage> {
  final List<Product> _products = Product.sampleProducts();
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products;
  }

  Future<List<SearchResult>> _searchProducts(String query) async {
    // Simular búsqueda con delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    final filtered = _products
        .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .map((product) => SearchResult(
              title: product.name,
              subtitle: '${product.category} - \$${product.price.toStringAsFixed(2)}',
              icon: product.icon,
              data: product,
            ))
        .toList();
    
    return filtered;
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = _products;
      } else {
        _filteredProducts = _products
            .where((product) => 
                product.name.toLowerCase().contains(query.toLowerCase()) ||
                product.category.toLowerCase().contains(query.toLowerCase()) ||
                product.brand.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showProductDetail(Product product) {
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
                    color: product.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    product.icon,
                    size: 40,
                    color: product.color,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  product.brand,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.category,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Precio', '\$${product.price.toStringAsFixed(2)}'),
                    _buildStatItem('Stock', '${product.stock}'),
                    _buildStatItem('Estado', product.isAvailable ? 'Disponible' : 'Agotado'),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Editando ${product.name}'),
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
                      'Editar Producto',
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
        title: 'Lista de Productos',
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
              hintText: 'Buscar productos...',
              onSearch: _searchProducts,
              onResultSelected: (result) {
                final product = result.data as Product;
                _showProductDetail(product);
              },
            ),
          ),
          
          // Lista de productos
          Expanded(
            child: CustomListView<Product>(
              items: _filteredProducts,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (product, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: product.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        product.icon,
                        color: product.color,
                        size: 28,
                      ),
                    ),
                    title: Text(
                      product.name,
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
                          '${product.brand} • ${product.category}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF007AFF),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: product.isAvailable 
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Stock: ${product.stock}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: product.isAvailable 
                                      ? Colors.green 
                                      : Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
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
                    onTap: () => _showProductDetail(product),
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
        currentIndex: 2,
        onTap: (index) {
          // Navegación del bottom bar si es necesario
          if (index != 2) {
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

// Modelo de datos para productos
class Product {
  final String name;
  final String category;
  final String brand;
  final String description;
  final IconData icon;
  final Color color;
  final double price;
  final int stock;
  final bool isAvailable;

  Product({
    required this.name,
    required this.category,
    required this.brand,
    required this.description,
    required this.icon,
    required this.color,
    required this.price,
    required this.stock,
    required this.isAvailable,
  });

  static List<Product> sampleProducts() {
    return [
      Product(
        name: 'Lámpara LED Moderna',
        category: 'Iluminación',
        brand: 'LightPro',
        description: 'Lámpara LED de diseño moderno con control remoto y múltiples tonalidades de luz.',
        icon: Icons.lightbulb_outline,
        color: Colors.amber,
        price: 89.99,
        stock: 45,
        isAvailable: true,
      ),
      Product(
        name: 'Sofá Moderno 3 Plazas',
        category: 'Muebles',
        brand: 'ComfortHome',
        description: 'Sofá de 3 plazas con tapizado en tela premium y estructura de madera maciza.',
        icon: Icons.weekend,
        color: Colors.brown,
        price: 1299.99,
        stock: 8,
        isAvailable: true,
      ),
      Product(
        name: 'Mesa de Centro Cristal',
        category: 'Muebles',
        brand: 'GlassDesign',
        description: 'Mesa de centro con superficie de cristal templado y patas de acero inoxidable.',
        icon: Icons.table_restaurant,
        color: Colors.blue,
        price: 299.99,
        stock: 0,
        isAvailable: false,
      ),
      Product(
        name: 'Espejo Decorativo Redondo',
        category: 'Decoración',
        brand: 'MirrorArt',
        description: 'Espejo decorativo con marco dorado y diseño minimalista perfecto para cualquier ambiente.',
        icon: Icons.circle_outlined,
        color: Colors.orange,
        price: 159.99,
        stock: 23,
        isAvailable: true,
      ),
      Product(
        name: 'Planta Monstera Deliciosa',
        category: 'Plantas',
        brand: 'GreenLife',
        description: 'Planta tropical de interior con hojas grandes y perforadas, ideal para decoración.',
        icon: Icons.local_florist,
        color: Colors.green,
        price: 49.99,
        stock: 67,
        isAvailable: true,
      ),
      Product(
        name: 'Cojines Decorativos Set x4',
        category: 'Textiles',
        brand: 'SoftComfort',
        description: 'Set de 4 cojines decorativos con diferentes texturas y colores complementarios.',
        icon: Icons.crop_square,
        color: Colors.purple,
        price: 79.99,
        stock: 34,
        isAvailable: true,
      ),
      Product(
        name: 'Cortinas Blackout Premium',
        category: 'Textiles',
        brand: 'WindowStyle',
        description: 'Cortinas blackout que bloquean 100% la luz con sistema de instalación fácil.',
        icon: Icons.view_column,
        color: Colors.indigo,
        price: 199.99,
        stock: 15,
        isAvailable: true,
      ),
      Product(
        name: 'Alfombra Persa Clásica',
        category: 'Textiles',
        brand: 'Heritage',
        description: 'Alfombra con diseño persa tradicional tejida a mano con materiales de alta calidad.',
        icon: Icons.crop_din,
        color: Colors.red,
        price: 449.99,
        stock: 3,
        isAvailable: true,
      ),
      Product(
        name: 'Velas Aromáticas Set x6',
        category: 'Aromas',
        brand: 'ScentWorld',
        description: 'Set de 6 velas aromáticas con fragancias naturales y duración de 40 horas cada una.',
        icon: Icons.local_fire_department,
        color: Colors.pink,
        price: 29.99,
        stock: 89,
        isAvailable: true,
      ),
      Product(
        name: 'Marco de Fotos Digital',
        category: 'Electrónicos',
        brand: 'PhotoFrame',
        description: 'Marco digital de 10 pulgadas con conectividad WiFi y almacenamiento en la nube.',
        icon: Icons.inbox,
        color: Colors.teal,
        price: 189.99,
        stock: 12,
        isAvailable: true,
      ),
      Product(
        name: 'Organizador de Escritorio',
        category: 'Oficina',
        brand: 'DeskPro',
        description: 'Organizador multifuncional con compartimentos para documentos, bolígrafos y accesorios.',
        icon: Icons.inbox,
        color: Colors.grey,
        price: 39.99,
        stock: 56,
        isAvailable: true,
      ),
      Product(
        name: 'Humidificador Ultrasónico',
        category: 'Electrónicos',
        brand: 'AirFresh',
        description: 'Humidificador silencioso con aromaterapia y luces LED de 7 colores.',
        icon: Icons.air,
        color: Colors.cyan,
        price: 69.99,
        stock: 0,
        isAvailable: false,
      ),
    ];
  }
}