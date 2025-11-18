import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/sale_usecases.dart';
import 'sale_event.dart';
import 'sale_state.dart';

class SaleBloc extends Bloc<SaleEvent, SaleState> {
  final GetAllSalesUseCase getAllSalesUseCase;
  final GetSaleByIdUseCase getSaleByIdUseCase;
  final GetSalesByEmployeeUseCase getSalesByEmployeeUseCase;
  final GetSalesByClientUseCase getSalesByClientUseCase;
  final GetSalesByProductUseCase getSalesByProductUseCase;
  final CreateSaleUseCase createSaleUseCase;
  final UpdateSaleUseCase updateSaleUseCase;
  final DeleteSaleUseCase deleteSaleUseCase;
  final GetTotalSalesByEmployeeUseCase getTotalSalesByEmployeeUseCase;
  final GetTotalSalesByClientUseCase getTotalSalesByClientUseCase;

  SaleBloc({
    required this.getAllSalesUseCase,
    required this.getSaleByIdUseCase,
    required this.getSalesByEmployeeUseCase,
    required this.getSalesByClientUseCase,
    required this.getSalesByProductUseCase,
    required this.createSaleUseCase,
    required this.updateSaleUseCase,
    required this.deleteSaleUseCase,
    required this.getTotalSalesByEmployeeUseCase,
    required this.getTotalSalesByClientUseCase,
  }) : super(SaleInitial()) {
    on<LoadAllSales>(_onLoadAllSales);
    on<LoadSaleById>(_onLoadSaleById);
    on<LoadSalesByEmployee>(_onLoadSalesByEmployee);
    on<LoadSalesByClient>(_onLoadSalesByClient);
    on<LoadSalesByProduct>(_onLoadSalesByProduct);
    on<CreateSale>(_onCreateSale);
    on<UpdateSale>(_onUpdateSale);
    on<DeleteSale>(_onDeleteSale);
    on<LoadTotalSalesByEmployee>(_onLoadTotalSalesByEmployee);
    on<LoadTotalSalesByClient>(_onLoadTotalSalesByClient);
  }

  Future<void> _onLoadAllSales(LoadAllSales event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final sales = await getAllSalesUseCase();
      emit(SalesLoaded(sales));
    } catch (e) {
      emit(SaleError('Error loading sales: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSaleById(LoadSaleById event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final sale = await getSaleByIdUseCase(event.id);
      if (sale != null) {
        emit(SaleLoaded(sale));
      } else {
        emit(const SaleError('Sale not found'));
      }
    } catch (e) {
      emit(SaleError('Error loading sale: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSalesByEmployee(LoadSalesByEmployee event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final sales = await getSalesByEmployeeUseCase(event.employeeId);
      emit(SalesLoaded(sales));
    } catch (e) {
      emit(SaleError('Error loading sales by employee: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSalesByClient(LoadSalesByClient event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final sales = await getSalesByClientUseCase(event.clientId);
      emit(SalesLoaded(sales));
    } catch (e) {
      emit(SaleError('Error loading sales by client: ${e.toString()}'));
    }
  }

  Future<void> _onLoadSalesByProduct(LoadSalesByProduct event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final sales = await getSalesByProductUseCase(event.productId);
      emit(SalesLoaded(sales));
    } catch (e) {
      emit(SaleError('Error loading sales by product: ${e.toString()}'));
    }
  }

  Future<void> _onCreateSale(CreateSale event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      await createSaleUseCase(event.sale);
      emit(const SaleOperationSuccess('Sale created successfully'));
    } catch (e) {
      emit(SaleError('Error creating sale: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateSale(UpdateSale event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final success = await updateSaleUseCase(event.sale);
      if (success) {
        emit(const SaleOperationSuccess('Sale updated successfully'));
      } else {
        emit(const SaleError('Failed to update sale'));
      }
    } catch (e) {
      emit(SaleError('Error updating sale: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteSale(DeleteSale event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final success = await deleteSaleUseCase(event.id);
      if (success) {
        emit(const SaleOperationSuccess('Sale deleted successfully'));
      } else {
        emit(const SaleError('Failed to delete sale'));
      }
    } catch (e) {
      emit(SaleError('Error deleting sale: ${e.toString()}'));
    }
  }

  Future<void> _onLoadTotalSalesByEmployee(LoadTotalSalesByEmployee event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final total = await getTotalSalesByEmployeeUseCase(event.employeeId);
      emit(SaleTotalLoaded(total));
    } catch (e) {
      emit(SaleError('Error loading total sales by employee: ${e.toString()}'));
    }
  }

  Future<void> _onLoadTotalSalesByClient(LoadTotalSalesByClient event, Emitter<SaleState> emit) async {
    emit(SaleLoading());
    try {
      final total = await getTotalSalesByClientUseCase(event.clientId);
      emit(SaleTotalLoaded(total));
    } catch (e) {
      emit(SaleError('Error loading total sales by client: ${e.toString()}'));
    }
  }
}