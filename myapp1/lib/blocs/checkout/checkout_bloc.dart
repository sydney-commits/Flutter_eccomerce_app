import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp1/authentication/service/auth_service.dart';
import 'package:myapp1/blocs/cart/cart_bloc.dart';
import 'package:myapp1/models/cart_model.dart';
import 'package:myapp1/models/models.dart';
import 'package:myapp1/repositories/checkout/checkout_repository.dart';

part 'checkout_state.dart';
part 'checkout_event.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartsubscription;
  StreamSubscription? _checkoutSubscription;

  var currentUser = FirebaseAuth.instance.currentUser;



  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliveryfee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString)
            : CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);
    _cartsubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
  }

  // @override
  // Stream<CheckoutState> mapEventToState(
  //   CheckoutEvent event,
  // ) async* {
  //   if (event is UpdateCheckout) {
  //     yield* _mapUpdateCheckoutToState(event, state);
  //   }
  //   if (event is ConfirmCheckout) {
  //     yield* _mapConfirmCheckoutToState(event, state);
  //   }
  // }

  void _onUpdateCheckout(
      
    UpdateCheckout event,
    Emitter<CheckoutState> emit,
  ) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
        userId: currentUser!.uid.toString(),
        name: event.name ?? state.name,
        email: event.email ?? state.email,
        contact: event.contact ?? state.contact,
        location: event.location ?? state.location,
        city: event.city ?? state.city,
        products: event.cart?.products ?? state.products,
        deliveryfee: event.cart?.deliveryFeeString ?? state.deliveryfee,
        subtotal: event.cart?.subtotalString ?? state.subtotal,
        total: event.cart?.totalString ?? state.total,
      ));
    }
  }

  void _onConfirmCheckout(
    ConfirmCheckout event,
    Emitter<CheckoutState> emit,
  ) async {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }
}
