import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'warehouse_management_page.dart';
import 'product_management_page.dart';

class WarehouseDetailPage extends StatefulWidget {
  final Warehouse warehouse;

  const WarehouseDetailPage({
    super.key,
    required this.warehouse,
  });

  static const routeName = '/warehouse-detail';

  @override
  State<WarehouseDetailPage> createState() => _WarehouseDetailPageState();
}

class _WarehouseDetailPageState extends State<WarehouseDetailPage> {
  late Warehouse _warehouse;
  bool _isEditing = false;
  
  // Controladores para los campos editables
  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _productCountController;
  late TextEditingController _capacityController;
  late TextEditingController _quantityController;
  late TextEditingController _productSearchController;
  bool _isActive = true;
  String _selectedUnit = 'unidades'; // 'unidades', 'cajas', 'paquetes'
  Product? _selectedProduct; // Producto seleccionado (puede usarse para validación o guardado)

  @override
  void initState() {
    super.initState();
    _warehouse = widget.warehouse;
    _initializeControllers();
  }

  void _initializeControllers() {
    _nameController = TextEditingController(text: _warehouse.name);
    _locationController = TextEditingController(text: _warehouse.location);
    _productCountController = TextEditingController(text: _warehouse.productCount.toString());
    _capacityController = TextEditingController(text: _warehouse.capacity.toString());
    _quantityController = TextEditingController(text: '0');
    _productSearchController = TextEditingController();
    _isActive = _warehouse.isActive;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _productCountController.dispose();
    _capacityController.dispose();
    _quantityController.dispose();
    _productSearchController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        // Si se cancela la edición, restaurar valores originales
        _initializeControllers();
      }
    });
  }

  void _saveChanges() {
    // Validar campos
    if (_nameController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _productCountController.text.isEmpty ||
        _capacityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, completa todos los campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validar cantidad de productos y capacidad
    final productCount = int.tryParse(_productCountController.text);
    final capacity = int.tryParse(_capacityController.text);

    if (productCount == null || productCount < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La cantidad de productos debe ser un número entero válido mayor o igual a 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (capacity == null || capacity < 0 || capacity > 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La capacidad debe ser un número entre 0 y 100'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Crear almacén actualizado
    setState(() {
      _warehouse = Warehouse(
        name: _nameController.text.trim(),
        location: _locationController.text.trim(),
        icon: _warehouse.icon,
        color: _warehouse.color,
        productCount: productCount,
        isActive: _isActive,
        capacity: capacity,
      );
      _isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Almacén guardado exitosamente'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(
        title: 'Detalle del almacén',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel de imágenes
            _buildImageCarousel(),
            
            // Detalles del almacén
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre del almacén
                  _buildEditableField(
                    label: 'Nombre',
                    controller: _nameController,
                    icon: Icons.warehouse_outlined,
                    isEditing: _isEditing,
                  ),
                  const SizedBox(height: 16),
                  
                  // Ubicación
                  _buildEditableField(
                    label: 'Ubicación',
                    controller: _locationController,
                    icon: Icons.location_on_outlined,
                    isEditing: _isEditing,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  
                  // Combobox y buscador de productos (solo en modo edición)
                  if (_isEditing) ...[
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildUnitDropdown(
                            value: _selectedUnit,
                            onChanged: (value) {
                              setState(() {
                                _selectedUnit = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 3,
                          child: _buildProductSearchField(
                            controller: _productSearchController,
                            products: Product.sampleProducts(),
                            onProductSelected: (product) {
                              setState(() {
                                _selectedProduct = product;
                                _productSearchController.text = product.name;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Botones de incremento/decremento y campo de cantidad
                    Row(
                      children: [
                        // Botón menos
                        IconButton(
                          onPressed: () {
                            final currentValue = int.tryParse(_quantityController.text) ?? 0;
                            if (currentValue > 0) {
                              setState(() {
                                _quantityController.text = (currentValue - 1).toString();
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                          iconSize: 32,
                          color: const Color(0xFF007AFF),
                        ),
                        // Botón más
                        IconButton(
                          onPressed: () {
                            final currentValue = int.tryParse(_quantityController.text) ?? 0;
                            setState(() {
                              _quantityController.text = (currentValue + 1).toString();
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          iconSize: 32,
                          color: const Color(0xFF007AFF),
                        ),
                        const SizedBox(width: 8),
                        // Campo de texto editable
                        Expanded(
                          child: TextFormField(
                            controller: _quantityController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).brightness == Brightness.dark
                                  ? const Color(0xFF2C2C2E)
                                  : Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.grey[800]!
                                      : Colors.grey[300]!,
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
                        ),
                        const SizedBox(width: 8),
                        // Etiqueta de unidad
                        Text(
                          _selectedUnit,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white70
                                : Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  
                  // Cantidad de productos y Capacidad en fila
                  Row(
                    children: [
                      Expanded(
                        child: _buildEditableField(
                          label: 'Cantidad de Productos',
                          controller: _productCountController,
                          icon: Icons.inventory_2_outlined,
                          isEditing: _isEditing,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildEditableField(
                          label: 'Capacidad (%)',
                          controller: _capacityController,
                          icon: Icons.storage_outlined,
                          isEditing: _isEditing,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Estado (Activo/Inactivo)
                  _buildStatusField(),
                  const SizedBox(height: 24),
                  
                  // Botones de acción
                  _buildActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    // Si hay imágenes reales, usarlas; si no, crear placeholders con el icono
    if (_warehouse.images.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.all(16),
        child: ImageCarousel(
          images: _warehouse.images,
          height: 250,
          autoPlay: false,
          showIndicators: true,
          showNavigationArrows: true,
          borderRadius: BorderRadius.circular(16),
        ),
      );
    } else {
      // Mostrar carousel con iconos del almacén como placeholder
      return Container(
        margin: const EdgeInsets.all(16),
        height: 250,
        decoration: BoxDecoration(
          color: _warehouse.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _warehouse.icon,
                size: 80,
                color: _warehouse.color,
              ),
              const SizedBox(height: 16),
              Text(
                _warehouse.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _warehouse.color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required bool isEditing,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    if (isEditing) {
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
    } else {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2C2C2E) : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: _warehouse.color,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildStatusField() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    if (_isEditing) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2C2C2E) : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.warehouse_outlined,
              size: 24,
              color: _warehouse.color,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estado',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        _isActive ? 'Activo' : 'Inactivo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Switch(
                        value: _isActive,
                        onChanged: (value) {
                          setState(() {
                            _isActive = value;
                          });
                        },
                        activeColor: const Color(0xFF007AFF),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2C2C2E) : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.warehouse_outlined,
              size: 24,
              color: _warehouse.color,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estado',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _isActive
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _isActive ? 'Activo' : 'Inactivo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _isActive ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildActionButtons() {
    if (_isEditing) {
      return Column(
        children: [
          // Botón Guardar
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saveChanges,
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
          const SizedBox(height: 12),
          // Botón Cancelar
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _toggleEditMode,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF007AFF),
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Color(0xFF007AFF)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _toggleEditMode,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007AFF),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Editar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
  }

  Widget _buildUnitDropdown({
    required String value,
    required Function(String?) onChanged,
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
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        icon: Icon(Icons.arrow_drop_down, color: isDark ? Colors.white : Colors.black87),
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black87,
          fontSize: 16,
        ),
        items: const [
          DropdownMenuItem(
            value: 'unidades',
            child: Text('Unidades'),
          ),
          DropdownMenuItem(
            value: 'cajas',
            child: Text('Cajas'),
          ),
          DropdownMenuItem(
            value: 'paquetes',
            child: Text('Paquetes'),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildProductSearchField({
    required TextEditingController controller,
    required List<Product> products,
    required Function(Product) onProductSelected,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Autocomplete<Product>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Product>.empty();
        }
        return products.where((product) =>
            product.name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
      },
      displayStringForOption: (Product product) => product.name,
      onSelected: onProductSelected,
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted,
      ) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
          ),
          decoration: InputDecoration(
            labelText: 'Buscar Producto',
            prefixIcon: const Icon(Icons.search, size: 20),
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
        );
      },
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<Product> onSelected,
        Iterable<Product> options,
      ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = options.elementAt(index);
                  return ListTile(
                    leading: Icon(
                      product.icon,
                      color: product.color,
                    ),
                    title: Text(product.name),
                    subtitle: Text('${product.category} - \$${product.price.toStringAsFixed(2)}'),
                    onTap: () {
                      onSelected(product);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

