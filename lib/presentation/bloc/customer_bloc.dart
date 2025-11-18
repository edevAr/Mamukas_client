import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/customer_usecases.dart';
import 'customer_event.dart';
import 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final GetAllCustomersUseCase getAllCustomersUseCase;
  final GetCustomerByIdUseCase getCustomerByIdUseCase;
  final GetCustomerByNitUseCase getCustomerByNitUseCase;
  final SearchCustomersByNameUseCase searchCustomersByNameUseCase;
  final CreateCustomerUseCase createCustomerUseCase;
  final UpdateCustomerUseCase updateCustomerUseCase;
  final DeleteCustomerUseCase deleteCustomerUseCase;

  CustomerBloc({
    required this.getAllCustomersUseCase,
    required this.getCustomerByIdUseCase,
    required this.getCustomerByNitUseCase,
    required this.searchCustomersByNameUseCase,
    required this.createCustomerUseCase,
    required this.updateCustomerUseCase,
    required this.deleteCustomerUseCase,
  }) : super(CustomerInitial()) {
    on<LoadAllCustomers>(_onLoadAllCustomers);
    on<LoadCustomerById>(_onLoadCustomerById);
    on<LoadCustomerByNit>(_onLoadCustomerByNit);
    on<SearchCustomersByName>(_onSearchCustomersByName);
    on<CreateCustomer>(_onCreateCustomer);
    on<UpdateCustomer>(_onUpdateCustomer);
    on<DeleteCustomer>(_onDeleteCustomer);
  }

  Future<void> _onLoadAllCustomers(LoadAllCustomers event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final customers = await getAllCustomersUseCase();
      emit(CustomersLoaded(customers));
    } catch (e) {
      emit(CustomerError('Error loading customers: ${e.toString()}'));
    }
  }

  Future<void> _onLoadCustomerById(LoadCustomerById event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final customer = await getCustomerByIdUseCase(event.id);
      if (customer != null) {
        emit(CustomerLoaded(customer));
      } else {
        emit(const CustomerError('Customer not found'));
      }
    } catch (e) {
      emit(CustomerError('Error loading customer: ${e.toString()}'));
    }
  }

  Future<void> _onLoadCustomerByNit(LoadCustomerByNit event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final customer = await getCustomerByNitUseCase(event.nit);
      if (customer != null) {
        emit(CustomerLoaded(customer));
      } else {
        emit(const CustomerError('Customer not found'));
      }
    } catch (e) {
      emit(CustomerError('Error loading customer: ${e.toString()}'));
    }
  }

  Future<void> _onSearchCustomersByName(SearchCustomersByName event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final customers = await searchCustomersByNameUseCase(event.name);
      emit(CustomersLoaded(customers));
    } catch (e) {
      emit(CustomerError('Error searching customers: ${e.toString()}'));
    }
  }

  Future<void> _onCreateCustomer(CreateCustomer event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      await createCustomerUseCase(event.customer);
      emit(const CustomerOperationSuccess('Customer created successfully'));
    } catch (e) {
      emit(CustomerError('Error creating customer: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateCustomer(UpdateCustomer event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final success = await updateCustomerUseCase(event.customer);
      if (success) {
        emit(const CustomerOperationSuccess('Customer updated successfully'));
      } else {
        emit(const CustomerError('Failed to update customer'));
      }
    } catch (e) {
      emit(CustomerError('Error updating customer: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteCustomer(DeleteCustomer event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final success = await deleteCustomerUseCase(event.id);
      if (success) {
        emit(const CustomerOperationSuccess('Customer deleted successfully'));
      } else {
        emit(const CustomerError('Failed to delete customer'));
      }
    } catch (e) {
      emit(CustomerError('Error deleting customer: ${e.toString()}'));
    }
  }
}