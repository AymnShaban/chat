import 'package:chat/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'cubits/auth_cubit/auth_cubit.dart';
import 'firebase_options.dart';
import 'screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of y`our application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      //  BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<ChatCubit>(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),

          ChatScreen.id: (context) => ChatScreen(),

        },
        initialRoute: LoginScreen.id,
      ),
    );
  }
}
