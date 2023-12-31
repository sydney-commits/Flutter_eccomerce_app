import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/models/models.dart';
import 'package:myapp1/repositories/product/product_repository.dart';

part 'product_state.dart';
part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductsToState();
    }

    if (event is UpdateProducts) {
      yield* _mapUpdateProductsToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductsToState() async* {
    _productSubscription?.cancel();
    _productSubscription = _productRepository
        .getAllProducts()
        .listen((products) => add(UpdateProducts(products)));
  }

  Stream<ProductState> _mapUpdateProductsToState(
    UpdateProducts event) async* {
    yield ProductLoaded(products: event.products);
  }
}





// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myapp1/models/models.dart';
// import 'package:myapp1/repositories/product/product_repository.dart';

// part 'product_state.dart';
// part 'product_event.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final ProductRepository _productRepository;
//   StreamSubscription? _productSubscription;

//   ProductBloc({required ProductRepository productRepository})
//       : _productRepository = productRepository,
//         super(ProductLoading());

//   @override
//   Stream<ProductState> mapEventToState(
//     ProductEvent event,
//   ) async* {
//     if (event is LoadProducts) {
//       yield* _mapLoadProductsToState();
//     }

//     if (event is UpdateProducts) {
//       yield* _mapUpdateProductsToState(event);
//     }
//   }

//   Stream<ProductState> _mapLoadProductsToState() async* {
//     _productSubscription?.cancel();
//     _productSubscription = _productRepository
//         .getAllProducts()
//         .listen((products) => add(UpdateProducts(products)));
//   }

//   Stream<ProductState> _mapUpdateProductsToState(
//     UpdateProducts event) async* {
//     yield ProductLoaded(products: event.products);
//   }
// }
