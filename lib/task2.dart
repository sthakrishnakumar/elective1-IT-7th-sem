import 'package:elective/core/app_constant.dart';
import 'package:elective/home_page.dart';
import 'package:flutter/material.dart';

class Task2Page extends StatefulWidget {
  const Task2Page({super.key});

  @override
  State<Task2Page> createState() => _Task2PageState();
}

class _Task2PageState extends State<Task2Page> {
  var gap = const SizedBox(
    height: 15,
  );

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool hideText = false;

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
              SizedBox(
                width: 300,
                child: TextFormField(
                  maxLength: 10,
                  obscuringCharacter: "*",
                  obscureText: hideText,
                  decoration: InputDecoration(
                    counterText: "",
                    // iconColor: Colors.red,
                    fillColor: Colors.white,
                    filled: true,
                    // icon: Icon(Icons.numbers),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          // if (hideText) {
                          //   hideText = false;
                          // } else {
                          //   hideText = true;
                          // }

                          hideText = !hideText;
                        });
                      },
                      child: Icon(
                          hideText ? Icons.visibility : Icons.visibility_off),
                    ),
                    hintText: "Phone Number",
                    labelText: "Phone",
                  ),
                ),
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
