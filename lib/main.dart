import 'package:flutter/material.dart';
import 'package:omni/widget/wallet/importAddress.dart';
import 'package:omni/widget/wallet/signMessage.dart';
import 'package:omni/widget/wallet/walletAndAddress.dart';
import 'package:omni/widget/wallet/walletBackup.dart';
import 'package:omni/widget/wallet/walletImport.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:omni/model/localModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import 'package:omni/widget/home/home.dart';
import 'package:omni/widget/login/LoginAndCreate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final LocalModel localModel = LocalModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<LocalModel>(
      model: localModel,
      child: new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/login':(BuildContext context) => new LoginAndCreate(),
        '/walletAndAddress':(BuildContext context) => new WalletAndAddress(),
        '/walletImport':(BuildContext context) => new WalletImport(),
        '/walletBackup':(BuildContext context) => new WalletBackup(),
        '/importAddress':(BuildContext context) => new ImportAddress(),
        '/signMessage':(BuildContext context) => new SignMessage(),
      },
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 376, height: 812,allowFontScaling:true)..init(context);
    // return new Splash();
    final LocalModel localModel = new LocalModel();
    return new ScopedModel(
      model: localModel,
      child: new Home()
    );
  }
}