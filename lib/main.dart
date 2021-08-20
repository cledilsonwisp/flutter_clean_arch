import 'package:clean_dart/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_dart/app/auth/domain/usecases/login_usecases.dart';
import 'package:clean_dart/app/auth/external/firebase/firebase_auth_impl.dart';
import 'package:clean_dart/app/auth/infra/datasources/auth_datasource.dart';
import 'package:clean_dart/app/auth/infra/repositories/auth_repository_ipl.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

import 'app/auth/external/auth_api/auth_api.dart';

final container = KiwiContainer()
  ..registerFactory((container) => LoginUsecase(container.resolve()))
  ..registerFactory<AuthRepository>(
      (container) => AuthRepositoryImpl(container.resolve()))
  ..registerFactory<AuthDataSource>((container) => FireBaseAuthImpl());
void main() {
  // final user = LoginUsecase(AuthRepositoryImpl(FireBaseAuthImpl()));
  final user = container.resolve<LoginUsecase>();
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
