// ignore: file_names
import 'package:flutter/material.dart';

import 'EndPage.dart';

class ResetPassWordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetPassWordPageState();
}

class ResetPassWordPageState extends State<ResetPassWordPage> {
  final formKey = GlobalKey<FormState>();
  bool showPass = true;
  bool showConfirmPassword = true;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // tạo ra một độ nhô lên lớn hơn 0 theo mặc định
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 18, 50, 107),
          onPressed: () => Navigator.pop(context, true),
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 30, top: 15, bottom: 30),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mật khẩu mới',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 18, 50, 107),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bạn vui lòng nhập mật khẩu mới để hoàn tất.',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 18, 50, 107),
                ),
              ),
              const Text(
                '______',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 18, 50, 107),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const <Widget>[
                  Text('Mật khẩu',
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Text('*', style: TextStyle(fontSize: 15, color: Colors.red)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: password,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: showPass,
                decoration: InputDecoration(
                  hintText: 'Nhập mật khẩu của bạn',
                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                    icon: Icon(
                      showPass ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                validator: (password) {
                  // r'^
                  //   (?=.*[A-Z])       // should contain at least one upper case
                  //   (?=.*[a-z])       // should contain at least one lower case
                  //   (?=.*?[0-9])      // should contain at least one digit
                  //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
                  //   .{8,}             // Must be at least 8 characters in length
                  // $
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (password == '') {
                    return 'Vui lòng nhập mật khẩu mới của bạn.';
                  } else if (!regex.hasMatch(password!)) {
                    return 'Mật khẩu mới không được ít hơn 8 kí tự.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const <Widget>[
                  Text('Xác nhận mật khẩu',
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Text('*', style: TextStyle(fontSize: 15, color: Colors.red)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: confirmPass,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  obscureText: showConfirmPassword,
                  decoration: InputDecoration(
                    hintText: 'Xác nhận mật khẩu của bạn',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showConfirmPassword = !showConfirmPassword;
                        });
                      },
                      icon: Icon(
                        showConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  validator: (value) {
                    //password = value as TextEditingController;
                    if (value == '') {
                      return 'Vui lòng nhập lại mật khẩu mà bạn vừa nhập.';
                    } else if (value != password.text) {
                      return 'Mật khẩu không khớp.';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 40,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(
                    width: double.infinity, height: 50),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => EndPage(),
                            ));
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 18, 50, 107)),
                    ),
                    child: const Text('XÁC NHẬN')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
