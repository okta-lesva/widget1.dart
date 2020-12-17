import 'package:flutter/material.dart';

void main() => runApp(new InputData());

class InputData extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<InputData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  String nimMHS = '';
  String fullName = '';
  String waktuKuliah = "Pagi";
  bool checkBoxValue = false;
  String Jurusan = "Teknik Informatika";
  
  clearTextInput(){
 
    nameController.clear();
    nimController.clear();
 
  }

  Widget _inputFullName() {
    return Container(
        margin: EdgeInsets.all(20),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Full Name",
          ),
          onChanged: (text) {
            setState(() {
              fullName = text;
            });
          },
        ));
  }

  Widget _inputNIM() {
    return Container(
        margin: EdgeInsets.all(20),
        child: TextField(
          controller: nimController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nomor Induk Mahasiswa",
          ),
          onChanged: (text) {
            setState(() {
              nimMHS = text;
            });
          },
        ));
  }

  Widget _inputWaktuKuliah1() {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: new Column(
        children: <Widget>[
          new Text("Waktu Kuliah 1: "),
          new Checkbox(
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                  if (checkBoxValue) {
                    waktuKuliah = "Sore";
                  } else {
                    waktuKuliah = "Pagi";
                  }
                });
              }),
          new Text(waktuKuliah),
        ],
      ),
    );
  }

  Widget _inputWaktuKuliah() {
    return Container(
      width: 630.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 10,
        child: Padding( // set jarak antara card dgn Column 
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
          child: Align(
            alignment: Alignment.topLeft,  // set posisi Colomn dalam Card
            child: Column(    // Row
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text("Waktu Kuliah : "),
                new Checkbox(
                    value: checkBoxValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        checkBoxValue = newValue;
                        if (checkBoxValue) {
                          waktuKuliah = "Sore";
                        } else {
                          waktuKuliah = "Pagi";
                        }
                      });
                    }),
                new Text(waktuKuliah)
              ],
            ),
          ),
        ),
      ),
    );
  }
Widget _inputJurusan1() {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: new Column(
        children: <Widget>[
          new Text("Jurusan 1: "),
          new Checkbox(
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                  if (checkBoxValue) {
                    Jurusan = "Teknik Industri";
                  } else {
                    Jurusan = "Teknik Informatika";
                  }
                });
              }),
          new Text(Jurusan),
        ],
      ),
    );
  }

  Widget _inputJurusan() {
    return Container(
      width: 630.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 10,
        child: Padding( // set jarak antara card dgn Column 
          padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
          child: Align(
            alignment: Alignment.topLeft,  // set posisi Colomn dalam Card
            child: Column(    // Row
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text("Jurusan : "),
                new Checkbox(
                    value: checkBoxValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        checkBoxValue = newValue;
                        if (checkBoxValue) {
                          Jurusan = "Teknik Industri";
                        } else {
                          Jurusan = "Teknik Informatika";
                        }
                      });
                    }),
                new Text(Jurusan)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _submit(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          setState(() {
            print("kole");
          });
          print(nimMHS);
          print(fullName);
          if ((nimMHS.isEmpty) || (fullName.isEmpty)) {
            print("nim atau nama tidak boleh kosongx");
            
            
          }  else
          {print("ok");refreshData();clearTextInput();}

          ///end if
        },
        child: Text('Submit'),
      ),
    );
  }
  
Future refreshData() async {
   nimMHS = '';
  fullName = '';
  waktuKuliah = "Pagi";
  Jurusan = "Teknik Informatika";
  checkBoxValue = false;
  checkBoxValue = true;
    setState(() {});
  }
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Input Data Mahasiswa'),
          ),
          body: Column(children: <Widget>[
            _inputNIM(),
            _inputFullName(),
            _inputWaktuKuliah(),
            _inputJurusan(),
            _submit(context),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(fullName),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Close', // used by assistive technologies
            child: Icon(Icons.close),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          )),
    );
  }
}




