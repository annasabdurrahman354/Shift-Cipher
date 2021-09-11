import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shift_chiper/logic.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';

Logic logic = new Logic();
String? result;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shift Cipher',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late TextEditingController inputController;
  late TextEditingController keyController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      result = 'Hasil ciphertext akan tampil disini';
    });
    inputController = TextEditingController();
    keyController = TextEditingController();
  }
  
  inputFormattin() {
    return <TextInputFormatter>[ new FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))];
  }

  keyFormattin() {
    return <TextInputFormatter>[new FilteringTextInputFormatter.allow(RegExp("[0-9]"))];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFF42BEA5),
          automaticallyImplyLeading: false,
          title: Text(
            'Shift Cipher',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Lexend Deca',
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Color(0xFF42BEA5),
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFF1A1F24),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black,
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: TextFormField(
                      onChanged: (_) => setState(() {}),
                      controller: inputController,
                      inputFormatters: inputFormattin(),
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Masukkan plaintext..',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF3AAE97),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF3AAE97),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Color(0xFF359F8A),
                        prefixIcon: Icon(
                          Icons.text_snippet_rounded,
                        ),
                        suffixIcon: inputController.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => inputController.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.multiline,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Input harus diisi!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      onChanged: (_) => setState(() {}),
                      controller: keyController,
                      inputFormatters: keyFormattin(),
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Masukkan key..',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF3AAE97),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF3AAE97),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Color(0xFF359F8A),
                        prefixIcon: Icon(
                          Icons.vpn_key_rounded,
                        ),
                        suffixIcon: keyController.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => keyController.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Input harus diisi!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: ElevatedButton(
                          child: Text('Enkripsi'),
                          onPressed: (){
                            if (formKey.currentState!.validate()){
                              setState(() {
                                result = logic.shift(
                                    inputController.text, int.parse(keyController.text), true);
                              });
                           }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF356A9F),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                            fixedSize: Size(130, 40),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                            ),
                          ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: ElevatedButton(
                          child: Text('Dekripsi'),
                          onPressed: () {
                          if (formKey.currentState!.validate())
                            setState(() {                      
                                result = logic.shift(inputController.text, int.parse(keyController.text), false);
                            });
                        },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFA13436),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                            fixedSize: Size(130, 40),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      result!,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFFBFAFA),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Annas Abdurrahman | M0519017',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF57CAB3),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
