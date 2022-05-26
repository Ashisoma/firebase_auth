import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/models/user_model.dart';
import 'package:firebase_authentication/ui/home_screen.dart';
import 'package:firebase_authentication/ui/login_scree.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final _formKey = GlobalKey<FormState>();

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey2 = GlobalKey<FormState>();
  final TextEditingController firstNameEditingController =
      new TextEditingController();
  final TextEditingController seconfNameEditingController =
      new TextEditingController();
  final TextEditingController emailEditingController =
      new TextEditingController();
  final TextEditingController passwordNameEditingController =
      new TextEditingController();
  final TextEditingController confirmPasswordNameEditingController =
      new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final firstNameFIeld = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      validator: (value) {
        RegExp reg = new RegExp(r'^.{0,3}$');
        if (value!.isEmpty) {
          return ("First Name can't be empty'");
        }
        if (reg.hasMatch(value)) {
          return ("Please enter a valid name (3 min characters");
        }
        return null;
      },
      // keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final secondNameField = TextFormField(
      autofocus: false,
      controller: seconfNameEditingController,
      validator: (value) {
        RegExp reg = new RegExp(r'^.{0,3}$');
        if (value!.isEmpty) {
          return ("Second Name can't be empty'");
        }
        if (reg.hasMatch(value)) {
          return ("Please enter a valid name (3 min characters");
        }
        return null;
      },
      // keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        seconfNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Second Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter a your email address");
        }
        if (!RegExp("^[a-zA-Z0-9_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email address");
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordNameField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordNameEditingController,
      // keyboardType: TextInputType.,
      validator: (value) {
        RegExp reg = new RegExp(r'^.{0,6}$');
        if (value!.isEmpty) {
          return ("Please enter your password");
        }
        if (value.length < 6) {
          return ("Please enter a valid password (6 minimum characters");
        }
      },
      onSaved: (value) {
        passwordNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final confpasswordNameField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmPasswordNameEditingController,
      // keyboardType: TextInputType.,
      validator: (value) {
        RegExp reg = new RegExp(r'^.{0,6}$');
        if (value!.isEmpty) {
          return ("Please enter your password");
        }
        if (value.length<6) {
          return ("Please enter a valid password (6 minimum characters)");
        }
        if (passwordNameEditingController.text != value) {
          return ("Passwords do not match");
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final registetBtn = Material(
      elevation: 5,
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: () {
          regiserUser(
              emailEditingController.text, passwordNameEditingController.text);
        },
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text("Register",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),
                    firstNameFIeld,
                    const SizedBox(height: 10),
                    secondNameField,
                    const SizedBox(height: 10),
                    emailField,
                    const SizedBox(height: 10),
                    passwordNameField,
                    const SizedBox(height: 10),
                    confpasswordNameField,
                    const SizedBox(height: 20),
                    registetBtn,
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> regiserUser(String email, String password) async {
    if (_formKey2.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirebase()})
          .catchError((e) => {Fluttertoast.showToast(msg: e.message)});
    }
  }

  postDetailsToFirebase() async {
    // call firestore
    // user model adn send data to firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user?.email;
    userModel.uuid = user?.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = seconfNameEditingController.text;

    // to firestore

    await firestore.collection("users").doc(user?.uid).set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :)");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
