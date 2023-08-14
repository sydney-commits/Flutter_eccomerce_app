import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:myapp1/authentication/scaffold/splash.dart';

import 'package:myapp1/authentication/scaffold/wrapper_auth.dart';
import 'package:myapp1/authentication/service/auth_service.dart';

import 'package:myapp1/screens/account/payment/lm.dart';
import 'package:myapp1/screens/notifications/local_push_notification.dart';

import 'package:myapp1/screens/notifications/notification_service.dart';
import 'package:myapp1/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'authentication/scaffold/login.dart';
import 'blocs/blocs.dart';

import 'package:myapp1/config/app_router.dart';
import 'package:myapp1/config/theme.dart';
import 'package:myapp1/repositories/category/category_repository.dart';

import 'blocs/checkout/checkout_bloc.dart';
import 'repositories/checkout/checkout_repository.dart';
import 'repositories/product/product_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MpesaFlutterPlugin.setConsumerKey("NwLEko6Lishgu9rbxdtSZI0kX80DWy9a");
  MpesaFlutterPlugin.setConsumerSecret("vyhfNtGyWoqacnh9");
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
          BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
          BlocProvider(
              create: (context) => CheckoutBloc(
                    cartBloc: context.read<CartBloc>(),
                    checkoutRepository: CheckoutRepository(),
                  )),
          BlocProvider(
              create: (_) => CategoryBloc(
                    categoryRepository: CategoryRepository(),
                  )..add(LoadCategories())),
          BlocProvider(
              create: (_) => ProductBloc(
                    productRepository: ProductRepository(),
                  )..add(LoadProducts()))
        ],
        child: MultiProvider(
          providers: [
            Provider<AuthService>(
              create: (_) => AuthService(),
            ),
            ChangeNotifierProvider(create: (_) => NotificationService()),
           
            Provider<Lm>(
              create: (_) => Lm(),
            )
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: SplashScreen1.routeName,
            debugShowCheckedModeBanner: false,

            //LipaCashScreen WrapperAuth WrapperAuth Notifications123
          ),
        ));
  }
}
