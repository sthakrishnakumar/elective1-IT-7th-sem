import 'package:elective/core/app_constant.dart';
import 'package:elective/home_page.dart';
import 'package:flutter/material.dart';

class Task2Page extends StatelessWidget {
  Task2Page({super.key});

  var gap = const SizedBox(
    height: 15,
  );

  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppConstant().flowerImage,
                    ),
                  ),
                ),
                height: 100,
                width: 100,
              ),
              gap,
              const Text(
                "Flutter Dash",
                style: TextStyle(color: Colors.white),
              ),
              gap,
              Text(
                "Flutter Developer".toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
              gap,
              Container(
                height: 3,
                width: 200,
                color: Colors.grey,
              ),
              gap,
              Container(
                color: Colors.white,
                height: 50,
                width: 300,
                // padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    SizedBox(
                      // height: 50,
                      width: 230,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length == 10) {
                            return null;
                          } else {
                            return "Invalid Phone Number";
                          }
                        },
                        controller: phoneController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.numbers),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    // Text("+977 9876543210"),
                  ],
                ),
              ),
              gap,
              Container(
                color: Colors.white,
                height: 50,
                width: 300,
                // padding: const EdgeInsets.only(left: 10),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        Icons.mail,
                        color: Colors.teal,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Text("example@gmail.com"),
                  ],
                ),
              ),
              gap,
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //API Call
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return const HomePage();
                    }));
                    print("Value ${phoneController.text}");
                  } else {
                    print("Value not validated");
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
