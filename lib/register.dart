import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login.dart'; // Pastikan Anda mengimpor halaman login di sini

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedCountry;

  final List<String> _countries = [
    'Indonesia',
    'Malaysia',
    'Singapore',
    'Thailand',
    'Philippines',
    // Tambahkan negara lain sesuai kebutuhan
  ];

  Future<bool> _checkEmailExists(String email) async {
    final url = Uri.parse('https://66522781813d78e6d6d4c7d7.mockapi.io/logindanregister'); // Ganti dengan URL MockAPI Anda
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List users = json.decode(response.body);
      for (var user in users) {
        if (user['email'] == email) {
          return true;
        }
      }
      return false;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> _register() async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _selectedCountry == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email')),
      );
      return;
    }

    final emailExists = await _checkEmailExists(_emailController.text);
    if (emailExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email already exists')),
      );
      return;
    }

    final url = Uri.parse('https://66522781813d78e6d6d4c7d7.mockapi.io/logindanregister'); // Ganti dengan URL MockAPI Anda
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'country': _selectedCountry,
      }),
    );

    if (response.statusCode == 201) {
      // Registrasi berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi berhasil!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else {
      // Registrasi gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi gagal. Coba lagi.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color(0xff3a57e8),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0)),
                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "asset/logo.png", // Ganti dengan path gambar Anda
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Text(
                      "Register",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextField(
                      controller: _nameController,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                        ),
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        filled: true,
                        fillColor: Color(0xfffefeff),
                        isDense: false,
                        contentPadding: EdgeInsets.all(8),
                        prefixIcon: Icon(Icons.person, color: Color(0xff000000), size: 24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: TextField(
                        controller: _emailController,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: Color(0xffffffff),
                          isDense: false,
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(Icons.mail, color: Color(0xff000000), size: 24),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide: BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: Color(0xffffffff),
                          isDense: false,
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(Icons.visibility_off, color: Color(0xff000000), size: 24),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: DropdownButtonFormField<String>(
                        value: _selectedCountry,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          filled: true,
                          fillColor: Color(0xffffffff),
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(Icons.public, color: Color(0xff000000), size: 24),
                        ),
                        items: _countries.map((String country) {
                          return DropdownMenuItem<String>(
                            value: country,
                            child: Text(country),
                          );
                        }).toList(),
                        hint: Text(
                          "Select Country",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCountry = newValue;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: MaterialButton(
                        onPressed: _register,
                        color: Color(0xff3a57e8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                          side: BorderSide(color: Color(0xff3a57e8), width: 1),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xffffffff),
                        height: 45,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Already have an account?",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Login",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff3a57e8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
