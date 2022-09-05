import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pebbl_life/screen/listView.dart';
import 'package:flutter/services.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class HomeSign extends StatefulWidget {
  const HomeSign({Key? key}) : super(key: key);

  @override
  _HomeSignState createState() => _HomeSignState();
}

class _HomeSignState extends State<HomeSign> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImagecam() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void checkuserlog() {}

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Google Sign in  '),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.6,
                  0.9,
                ],
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.deepPurpleAccent,

                  // Colors.red,
                  // Colors.indigo,
                  // Colors.teal,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 12, 2, 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: GoogleUserCircleAvatar(identity: user),
                  title: Text(
                    user.displayName ?? '',
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(user.email, style: TextStyle(fontSize: 22)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.star),
                    hintText: " Movie Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.star),
                    hintText: "Movie Director",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    color: Colors.purpleAccent,
                    child: const Text("Pick Image from Gallery",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      pickImage();
                    }),
                MaterialButton(
                    color: Colors.purpleAccent,
                    child: const Text("Pick Image from Camera",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      pickImagecam();
                    }),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Signed in successfully',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                            InkWell(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeSign())),
              child: Container(
                height: 80.0,
                width: 300.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.white,
                          Colors.white,

                          // Colors.red,
                          // Colors.indigo,
                          // Colors.teal,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: new Center(
                    child: new Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: signOut,
                  child: const Text('Sign out'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent, // background
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'You are not signed in',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: signIn,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sign in', style: TextStyle(fontSize: 30)),
                )),
          ],
        ),
      );
    }
  }

  void signOut() {
    _googleSignIn.disconnect();
  }

  Future<void> signIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      print('Error signing in $e');
    }
  }
}
