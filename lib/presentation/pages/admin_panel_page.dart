import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'warehouse_management_page.dart';
import 'store_management_page.dart';
import 'product_management_page.dart';
import '../../domain/entities/user.dart';
import '../../core/constants/user_status.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({super.key});

  static const routeName = '/admin-panel';

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  // Listas de datos
  List<User> _users = [];
  List<Warehouse> _warehouses = Warehouse.sampleWarehouses();
  List<Store> _stores = Store.sampleStores();
  List<Product> _products = Product.sampleProducts();
  
  // Roles disponibles
  final List<String> _availableRoles = ['Admin', 'Manager', 'Employee', 'Viewer'];
  
  // Permisos disponibles
  final List<String> _availablePermissions = [
    'INVENTORY_*',
    'USER_*',
    'PRODUCTS_*',
    'STORES_*',
    'WAREHOUSES_*',
    'SALES_*',
    'MANAGER',
    'PRODUCT_VIEW',
    'PRODUCT_EDIT',
    'PRODUCT_DELETE',
    'STORE_VIEW',
    'STORE_MANAGEMENT',
    'WAREHOUSE_VIEW',
    'WAREHOUSE_MANAGEMENT',
    'REPORTS_VIEW',
  ];
  
  // Mapa para almacenar roles y permisos de usuarios (simulado)
  final Map<int, String> _userRoles = {};
  final Map<int, List<String>> _userPermissions = {};
  
  // Elemento seleccionado actualmente
  dynamic _selectedItem;
  String _selectedItemType = ''; // 'user', 'warehouse', 'store', 'product'
  
  // Controladores para edición
  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _managerController;
  late TextEditingController _categoryController;
  late TextEditingController _brandController;
  late TextEditingController _priceController;
  late TextEditingController _stockController;
  late TextEditingController _productCountController;
  late TextEditingController _capacityController;
  late TextEditingController _monthlySalesController;
  late TextEditingController _ratingController;
  late TextEditingController _descriptionController;
  
  bool _isActive = true;
  bool _isOpen = true;
  bool _isAvailable = true;
  UserStatus _userStatus = UserStatus.active;
  String _currentRole = 'Employee';
  List<String> _currentPermissions = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _initializeControllers();
  }

  void _initializeControllers() {
    _nameController = TextEditingController();
    _locationController = TextEditingController();
    _managerController = TextEditingController();
    _categoryController = TextEditingController();
    _brandController = TextEditingController();
    _priceController = TextEditingController();
    _stockController = TextEditingController();
    _productCountController = TextEditingController();
    _capacityController = TextEditingController();
    _monthlySalesController = TextEditingController();
    _ratingController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _managerController.dispose();
    _categoryController.dispose();
    _brandController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _productCountController.dispose();
    _capacityController.dispose();
    _monthlySalesController.dispose();
    _ratingController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _loadData() {
    // Cargar usuarios desde el BLoC o repositorio
    // Por ahora simulamos con datos de ejemplo
    setState(() {
      _users = [
        User(
          idUser: 1,
          username: 'admin',
          password: '***',
          name: 'Admin',
          lastName: 'User',
          ci: '12345678',
          age: 30,
          status: UserStatus.active,
        ),
        User(
          idUser: 2,
          username: 'manager1',
          password: '***',
          name: 'Manager',
          lastName: 'One',
          ci: '87654321',
          age: 28,
          status: UserStatus.active,
        ),
        User(
          idUser: 3,
          username: 'employee1',
          password: '***',
          name: 'Employee',
          lastName: 'One',
          ci: '11223344',
          age: 25,
          status: UserStatus.active,
        ),
        User(
          idUser: 4,
          username: 'jperez',
          password: '***',
          name: 'Juan',
          lastName: 'Pérez',
          ci: '23456789',
          age: 32,
          status: UserStatus.active,
        ),
        User(
          idUser: 5,
          username: 'mgarcia',
          password: '***',
          name: 'María',
          lastName: 'García',
          ci: '34567890',
          age: 27,
          status: UserStatus.active,
        ),
        User(
          idUser: 6,
          username: 'crodriguez',
          password: '***',
          name: 'Carlos',
          lastName: 'Rodríguez',
          ci: '45678901',
          age: 35,
          status: UserStatus.inactive,
        ),
        User(
          idUser: 7,
          username: 'alopez',
          password: '***',
          name: 'Ana',
          lastName: 'López',
          ci: '56789012',
          age: 29,
          status: UserStatus.active,
        ),
        User(
          idUser: 8,
          username: 'pmartinez',
          password: '***',
          name: 'Pedro',
          lastName: 'Martínez',
          ci: '67890123',
          age: 31,
          status: UserStatus.active,
        ),
        User(
          idUser: 9,
          username: 'lsanchez',
          password: '***',
          name: 'Laura',
          lastName: 'Sánchez',
          ci: '78901234',
          age: 26,
          status: UserStatus.active,
        ),
        User(
          idUser: 10,
          username: 'dgonzalez',
          password: '***',
          name: 'Diego',
          lastName: 'González',
          ci: '89012345',
          age: 33,
          status: UserStatus.inactive,
        ),
      ];
      
      // Inicializar roles y permisos por defecto
      for (var user in _users) {
        if (user.idUser != null) {
          if (user.idUser == 1) {
            _userRoles[user.idUser!] = 'Admin';
            _userPermissions[user.idUser!] = ['INVENTORY_*', 'USER_*', 'PRODUCTS_*', 'STORES_*', 'WAREHOUSES_*', 'SALES_*'];
          } else if (user.idUser == 2) {
            _userRoles[user.idUser!] = 'Manager';
            _userPermissions[user.idUser!] = ['MANAGER', 'STORE_MANAGEMENT', 'PRODUCT_MANAGEMENT', 'PRODUCT_EDIT', 'REPORTS_VIEW'];
          } else {
            _userRoles[user.idUser!] = 'Employee';
            _userPermissions[user.idUser!] = ['PRODUCT_VIEW', 'STORE_VIEW'];
          }
        }
      }
      
      // Agregar más almacenes de ejemplo
      _warehouses = [
        ...Warehouse.sampleWarehouses(),
        Warehouse(
          name: 'Almacén Oeste',
          location: 'Calle Oeste 789, Zona Oeste',
          icon: Icons.business_center,
          color: Colors.pink,
          productCount: 432,
          isActive: true,
          capacity: 65,
        ),
        Warehouse(
          name: 'Almacén Distribución',
          location: 'Centro Logístico, Av. Industrial',
          icon: Icons.local_shipping,
          color: Colors.deepOrange,
          productCount: 890,
          isActive: true,
          capacity: 78,
        ),
        Warehouse(
          name: 'Almacén Respaldo',
          location: 'Zona Segura, Bodega Principal',
          icon: Icons.backup,
          color: Colors.cyan,
          productCount: 156,
          isActive: true,
          capacity: 35,
        ),
      ];
      
      // Agregar más tiendas de ejemplo
      _stores = [
        ...Store.sampleStores(),
        Store(
          name: 'Mamuka Este',
          location: 'Av. Este 555, Centro Comercial Este',
          manager: 'Roberto Fernández',
          icon: Icons.store_mall_directory,
          color: Colors.deepPurple,
          monthlySales: 31200,
          isOpen: true,
          rating: 4.6,
        ),
        Store(
          name: 'Mamuka Plaza',
          location: 'Plaza Central, Local 22',
          manager: 'Carmen Díaz',
          icon: Icons.shopping_cart,
          color: Colors.amber,
          monthlySales: 28700,
          isOpen: true,
          rating: 4.5,
        ),
        Store(
          name: 'Mamuka Express 2',
          location: 'Terminal Norte, Local 8',
          manager: 'Fernando Ruiz',
          icon: Icons.local_convenience_store,
          color: Colors.lightGreen,
          monthlySales: 18900,
          isOpen: false,
          rating: 4.1,
        ),
      ];
      
      // Agregar más productos de ejemplo
      _products = [
        ...Product.sampleProducts(),
        Product(
          name: 'Lámpara de Pie Moderna',
          category: 'Iluminación',
          brand: 'LightPro',
          description: 'Lámpara de pie con diseño escandinavo y luz regulable.',
          icon: Icons.light_mode,
          color: Colors.yellow,
          price: 149.99,
          stock: 28,
          isAvailable: true,
        ),
        Product(
          name: 'Silla Ergonómica Ejecutiva',
          category: 'Muebles',
          brand: 'ComfortPro',
          description: 'Silla ergonómica con soporte lumbar y reposabrazos ajustables.',
          icon: Icons.chair,
          color: Colors.blueGrey,
          price: 399.99,
          stock: 15,
          isAvailable: true,
        ),
        Product(
          name: 'Estantería Modular',
          category: 'Muebles',
          brand: 'StorageMax',
          description: 'Sistema de estantería modular con múltiples configuraciones.',
          icon: Icons.shelves,
          color: Colors.brown,
          price: 199.99,
          stock: 22,
          isAvailable: true,
        ),
        Product(
          name: 'Cortina Blackout Premium Plus',
          category: 'Textiles',
          brand: 'WindowStyle',
          description: 'Cortinas blackout premium con aislamiento térmico y acústico.',
          icon: Icons.curtains,
          color: Colors.indigo,
          price: 249.99,
          stock: 18,
          isAvailable: true,
        ),
        Product(
          name: 'Juego de Sábanas Algodón',
          category: 'Textiles',
          brand: 'SoftComfort',
          description: 'Juego de sábanas 100% algodón egipcio con fundas de almohada.',
          icon: Icons.bed,
          color: Colors.lightBlue,
          price: 89.99,
          stock: 45,
          isAvailable: true,
        ),
        Product(
          name: 'Aspiradora Robot Inteligente',
          category: 'Electrónicos',
          brand: 'CleanTech',
          description: 'Aspiradora robot con mapeo inteligente y control por app.',
          icon: Icons.cleaning_services,
          color: Colors.grey,
          price: 349.99,
          stock: 8,
          isAvailable: true,
        ),
        Product(
          name: 'Cafetera Espresso Automática',
          category: 'Electrónicos',
          brand: 'CoffeePro',
          description: 'Cafetera espresso automática con molinillo integrado.',
          icon: Icons.coffee,
          color: Colors.brown,
          price: 429.99,
          stock: 12,
          isAvailable: true,
        ),
        Product(
          name: 'Set de Ollas Acero Inoxidable',
          category: 'Cocina',
          brand: 'KitchenPro',
          description: 'Set de 7 ollas y sartenes de acero inoxidable de alta calidad.',
          icon: Icons.soup_kitchen,
          color: Colors.grey,
          price: 179.99,
          stock: 20,
          isAvailable: true,
        ),
        Product(
          name: 'Mesa de Comedor Extensible',
          category: 'Muebles',
          brand: 'DiningPro',
          description: 'Mesa de comedor extensible de 6 a 10 personas con acabado en roble.',
          icon: Icons.dining,
          color: Colors.brown,
          price: 899.99,
          stock: 5,
          isAvailable: true,
        ),
        Product(
          name: 'Lámpara de Techo LED',
          category: 'Iluminación',
          brand: 'LightPro',
          description: 'Lámpara de techo LED con control de intensidad y temperatura de color.',
          icon: Icons.light,
          color: Colors.amber,
          price: 129.99,
          stock: 0,
          isAvailable: false,
        ),
      ];
    });
  }

  void _selectItem(dynamic item, String type) {
    setState(() {
      _selectedItem = item;
      _selectedItemType = type;
      _loadItemData(item, type);
    });
  }

  void _loadItemData(dynamic item, String type) {
    if (type == 'user') {
      final user = item as User;
      _nameController.text = '${user.name} ${user.lastName}';
      _userStatus = user.status;
      _currentRole = _userRoles[user.idUser ?? 0] ?? 'Employee';
      _currentPermissions = _userPermissions[user.idUser ?? 0] ?? [];
    } else if (type == 'warehouse') {
      final warehouse = item as Warehouse;
      _nameController.text = warehouse.name;
      _locationController.text = warehouse.location;
      _productCountController.text = warehouse.productCount.toString();
      _capacityController.text = warehouse.capacity.toString();
      _isActive = warehouse.isActive;
    } else if (type == 'store') {
      final store = item as Store;
      _nameController.text = store.name;
      _locationController.text = store.location;
      _managerController.text = store.manager;
      _monthlySalesController.text = store.monthlySales.toStringAsFixed(2);
      _ratingController.text = store.rating.toStringAsFixed(1);
      _isOpen = store.isOpen;
    } else if (type == 'product') {
      final product = item as Product;
      _nameController.text = product.name;
      _categoryController.text = product.category;
      _brandController.text = product.brand;
      _descriptionController.text = product.description;
      _priceController.text = product.price.toStringAsFixed(2);
      _stockController.text = product.stock.toString();
      _isAvailable = product.isAvailable;
    }
  }

  void _updateItem() {
    if (_selectedItem == null) return;

    setState(() {
      if (_selectedItemType == 'user') {
        final user = _selectedItem as User;
        final userId = user.idUser ?? 0;
        _userRoles[userId] = _currentRole;
        _userPermissions[userId] = _currentPermissions;
        
        // Actualizar usuario en la lista
        final index = _users.indexWhere((u) => u.idUser == userId);
        if (index != -1) {
          _users[index] = user.copyWith(status: _userStatus);
        }
      } else if (_selectedItemType == 'warehouse') {
        final warehouse = _selectedItem as Warehouse;
        final index = _warehouses.indexOf(warehouse);
        if (index != -1) {
          _warehouses[index] = Warehouse(
            name: _nameController.text.trim(),
            location: _locationController.text.trim(),
            icon: warehouse.icon,
            color: warehouse.color,
            productCount: int.tryParse(_productCountController.text) ?? warehouse.productCount,
            isActive: _isActive,
            capacity: int.tryParse(_capacityController.text) ?? warehouse.capacity,
          );
        }
      } else if (_selectedItemType == 'store') {
        final store = _selectedItem as Store;
        final index = _stores.indexOf(store);
        if (index != -1) {
          _stores[index] = Store(
            name: _nameController.text.trim(),
            location: _locationController.text.trim(),
            manager: _managerController.text.trim(),
            icon: store.icon,
            color: store.color,
            monthlySales: double.tryParse(_monthlySalesController.text) ?? store.monthlySales,
            isOpen: _isOpen,
            rating: double.tryParse(_ratingController.text) ?? store.rating,
          );
        }
      } else if (_selectedItemType == 'product') {
        final product = _selectedItem as Product;
        final index = _products.indexOf(product);
        if (index != -1) {
          _products[index] = Product(
            name: _nameController.text.trim(),
            category: _categoryController.text.trim(),
            brand: _brandController.text.trim(),
            description: _descriptionController.text.trim(),
            icon: product.icon,
            color: product.color,
            price: double.tryParse(_priceController.text) ?? product.price,
            stock: int.tryParse(_stockController.text) ?? product.stock,
            isAvailable: _isAvailable,
          );
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Elemento actualizado exitosamente'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _deleteItem() {
    if (_selectedItem == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Eliminación'),
        content: Text('¿Estás seguro que deseas eliminar este ${_selectedItemType}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (_selectedItemType == 'user') {
                  final user = _selectedItem as User;
                  _users.removeWhere((u) => u.idUser == user.idUser);
                } else if (_selectedItemType == 'warehouse') {
                  _warehouses.remove(_selectedItem);
                } else if (_selectedItemType == 'store') {
                  _stores.remove(_selectedItem);
                } else if (_selectedItemType == 'product') {
                  _products.remove(_selectedItem);
                }
                _selectedItem = null;
                _selectedItemType = '';
                _clearControllers();
              });
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Elemento eliminado exitosamente'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  void _clearControllers() {
    _nameController.clear();
    _locationController.clear();
    _managerController.clear();
    _categoryController.clear();
    _brandController.clear();
    _priceController.clear();
    _stockController.clear();
    _productCountController.clear();
    _capacityController.clear();
    _monthlySalesController.clear();
    _ratingController.clear();
    _descriptionController.clear();
  }

  Future<List<SearchResult>> _searchUsers(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final filtered = _users
        .where((user) => 
            user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.lastName.toLowerCase().contains(query.toLowerCase()) ||
            user.username.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .map((user) => SearchResult(
              title: '${user.name} ${user.lastName}',
              subtitle: '@${user.username}',
              icon: Icons.person_outline,
              data: user,
            ))
        .toList();
    
    return filtered;
  }

  Future<List<SearchResult>> _searchWarehouses(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final filtered = _warehouses
        .where((warehouse) => 
            warehouse.name.toLowerCase().contains(query.toLowerCase()) ||
            warehouse.location.toLowerCase().contains(query.toLowerCase()))
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

  Future<List<SearchResult>> _searchStores(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final filtered = _stores
        .where((store) => 
            store.name.toLowerCase().contains(query.toLowerCase()) ||
            store.location.toLowerCase().contains(query.toLowerCase()) ||
            store.manager.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .map((store) => SearchResult(
              title: store.name,
              subtitle: '${store.location} - ${store.manager}',
              icon: store.icon,
              data: store,
            ))
        .toList();
    
    return filtered;
  }

  Future<List<SearchResult>> _searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final filtered = _products
        .where((product) => 
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.category.toLowerCase().contains(query.toLowerCase()) ||
            product.brand.toLowerCase().contains(query.toLowerCase()))
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(
        title: 'Panel de Administración',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Row(
        children: [
          // Panel izquierdo: Buscadores
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1C1C1E)
                    : Colors.grey[50],
                border: Border(
                  right: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Buscar Elementos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Buscador de Usuarios
                    _buildSearchSection(
                      title: 'Usuarios',
                      icon: Icons.people_outlined,
                      hintText: 'Buscar usuarios...',
                      onSearch: _searchUsers,
                      onResultSelected: (result) {
                        _selectItem(result.data as User, 'user');
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    // Buscador de Almacenes
                    _buildSearchSection(
                      title: 'Almacenes',
                      icon: Icons.warehouse_outlined,
                      hintText: 'Buscar almacenes...',
                      onSearch: _searchWarehouses,
                      onResultSelected: (result) {
                        _selectItem(result.data as Warehouse, 'warehouse');
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    // Buscador de Tiendas
                    _buildSearchSection(
                      title: 'Tiendas',
                      icon: Icons.store_outlined,
                      hintText: 'Buscar tiendas...',
                      onSearch: _searchStores,
                      onResultSelected: (result) {
                        _selectItem(result.data as Store, 'store');
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    // Buscador de Productos
                    _buildSearchSection(
                      title: 'Productos',
                      icon: Icons.inventory_2_outlined,
                      hintText: 'Buscar productos...',
                      onSearch: _searchProducts,
                      onResultSelected: (result) {
                        _selectItem(result.data as Product, 'product');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Panel derecho: Detalles y edición
          Expanded(
            flex: 2,
            child: _selectedItem == null
                ? _buildEmptyState()
                : _buildDetailPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection({
    required String title,
    required IconData icon,
    required String hintText,
    required Future<List<SearchResult>> Function(String) onSearch,
    required Function(SearchResult) onResultSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF007AFF)),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomSearchBar(
          hintText: hintText,
          onSearch: onSearch,
          onResultSelected: onResultSelected,
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Busca un elemento para editarlo o eliminarlo',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailPanel() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header con nombre y botones
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _getItemTitle(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _selectedItem = null;
                          _selectedItemType = '';
                          _clearControllers();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Contenido según el tipo
                if (_selectedItemType == 'user')
                  _buildUserEditPanel()
                else if (_selectedItemType == 'warehouse')
                  _buildWarehouseEditPanel()
                else if (_selectedItemType == 'store')
                  _buildStoreEditPanel()
                else if (_selectedItemType == 'product')
                  _buildProductEditPanel(),
              ],
            ),
          ),
        ),
        
        // Botones de acción
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _deleteItem,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Eliminar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: _updateItem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007AFF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Guardar Cambios',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getItemTitle() {
    if (_selectedItemType == 'user') {
      final user = _selectedItem as User;
      return '${user.name} ${user.lastName}';
    } else if (_selectedItemType == 'warehouse') {
      final warehouse = _selectedItem as Warehouse;
      return warehouse.name;
    } else if (_selectedItemType == 'store') {
      final store = _selectedItem as Store;
      return store.name;
    } else if (_selectedItemType == 'product') {
      final product = _selectedItem as Product;
      return product.name;
    }
    return '';
  }

  Widget _buildUserEditPanel() {
    final user = _selectedItem as User;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('Username', '@${user.username}'),
        _buildInfoRow('CI', user.ci),
        _buildInfoRow('Edad', '${user.age} años'),
        const SizedBox(height: 24),
        
        // Selector de rol
        const Text(
          'Rol',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        _buildRoleSelector(
          currentRole: _currentRole,
          onRoleChanged: (role) {
            setState(() {
              _currentRole = role;
            });
          },
        ),
        const SizedBox(height: 24),
        
        // Selector de estado
        const Text(
          'Estado',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2C2C2E) : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
            ),
          ),
          child: DropdownButton<UserStatus>(
            value: _userStatus,
            isExpanded: true,
            underline: const SizedBox(),
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black87,
              fontSize: 14,
            ),
            items: UserStatus.values.map((status) {
              return DropdownMenuItem<UserStatus>(
                value: status,
                child: Text(status.value),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _userStatus = value;
                });
              }
            },
          ),
        ),
        const SizedBox(height: 24),
        
        // Selector de permisos
        _buildPermissionsSelector(
          currentPermissions: _currentPermissions,
          onPermissionsChanged: (permissions) {
            setState(() {
              _currentPermissions = permissions;
            });
          },
        ),
      ],
    );
  }

  Widget _buildWarehouseEditPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEditableField(
          label: 'Nombre',
          controller: _nameController,
          icon: Icons.warehouse_outlined,
        ),
        const SizedBox(height: 16),
        _buildEditableField(
          label: 'Ubicación',
          controller: _locationController,
          icon: Icons.location_on_outlined,
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildEditableField(
                label: 'Cantidad de Productos',
                controller: _productCountController,
                icon: Icons.inventory_2_outlined,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildEditableField(
                label: 'Capacidad (%)',
                controller: _capacityController,
                icon: Icons.storage_outlined,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildStatusSwitch(
          label: 'Estado',
          value: _isActive,
          onChanged: (value) {
            setState(() {
              _isActive = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStoreEditPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEditableField(
          label: 'Nombre',
          controller: _nameController,
          icon: Icons.store_outlined,
        ),
        const SizedBox(height: 16),
        _buildEditableField(
          label: 'Ubicación',
          controller: _locationController,
          icon: Icons.location_on_outlined,
          maxLines: 2,
        ),
        const SizedBox(height: 16),
        _buildEditableField(
          label: 'Gerente',
          controller: _managerController,
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildEditableField(
                label: 'Ventas Mensuales',
                controller: _monthlySalesController,
                icon: Icons.attach_money,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildEditableField(
                label: 'Rating',
                controller: _ratingController,
                icon: Icons.star_outline,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildStatusSwitch(
          label: 'Estado',
          value: _isOpen,
          onChanged: (value) {
            setState(() {
              _isOpen = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildProductEditPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEditableField(
          label: 'Nombre',
          controller: _nameController,
          icon: Icons.label_outline,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildEditableField(
                label: 'Categoría',
                controller: _categoryController,
                icon: Icons.category_outlined,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildEditableField(
                label: 'Marca',
                controller: _brandController,
                icon: Icons.branding_watermark_outlined,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildEditableField(
          label: 'Descripción',
          controller: _descriptionController,
          icon: Icons.description_outlined,
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildEditableField(
                label: 'Precio',
                controller: _priceController,
                icon: Icons.attach_money,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildEditableField(
                label: 'Stock',
                controller: _stockController,
                icon: Icons.inventory_2_outlined,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildStatusSwitch(
          label: 'Disponibilidad',
          value: _isAvailable,
          onChanged: (value) {
            setState(() {
              _isAvailable = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
          ),
          decoration: InputDecoration(
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
          ),
        ),
      ],
    );
  }

  Widget _buildStatusSwitch({
    required String label,
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
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : Colors.grey[700],
            ),
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

  Widget _buildRoleSelector({
    required String currentRole,
    required Function(String) onRoleChanged,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2C2C2E) : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
        ),
      ),
      child: DropdownButton<String>(
        value: currentRole,
        isExpanded: true,
        underline: const SizedBox(),
        icon: Icon(Icons.arrow_drop_down, color: isDark ? Colors.white : Colors.black87),
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black87,
          fontSize: 14,
        ),
        items: _availableRoles.map((role) {
          return DropdownMenuItem<String>(
            value: role,
            child: Text(role),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            onRoleChanged(value);
          }
        },
      ),
    );
  }

  Widget _buildPermissionsSelector({
    required List<String> currentPermissions,
    required Function(List<String>) onPermissionsChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Permisos',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _availablePermissions.map((permission) {
            final isSelected = currentPermissions.contains(permission);
            return FilterChip(
              label: Text(
                permission,
                style: const TextStyle(fontSize: 12),
              ),
              selected: isSelected,
              onSelected: (selected) {
                final newPermissions = List<String>.from(currentPermissions);
                if (selected) {
                  newPermissions.add(permission);
                } else {
                  newPermissions.remove(permission);
                }
                onPermissionsChanged(newPermissions);
              },
              selectedColor: const Color(0xFF007AFF),
              checkmarkColor: Colors.white,
            );
          }).toList(),
        ),
      ],
    );
  }
}
