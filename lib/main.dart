import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportpal/Controller/screens/messenger/app.dart';
import 'package:sportpal/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sportpal/theme.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'Controller/screens/Tennis/CardProvider.dart';

Future<void> main() async {


  //Stripe.publishableKey = "pk_test_51KsdorBpxjE1bVCGsCG4clyaF1yQiyhgOw6AInJcSWmNjFBu58uJbKqNaJBl6t3z3DjvvKRgaxxQ48oTWK5ZN1Cj00OSUfKCr7";


  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    FacebookAuth.instance.webInitialize(
      appId: "1329834907365798",
      cookie: true,
      xfbml: true,
      version: "v12.0",
    );
  }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final client = StreamChatClient(streamKey);

  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client}) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CardProvider();
      },
      child: MaterialApp(
          //theme: AppTheme.light(), darkTheme: AppTheme.dark(), themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return StreamChatCore(
                client: client,
                child: ChannelsBloc(child: UsersBloc(child: child!)));
          },
          home: SplashScreen()),
       //home: SelectUserScreen()),
    );
  }
}

String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
