import 'package:flutter/material.dart';
import 'package:change_password/RegisterPage.dart';
//(?=abc) Bắt đầu với 03x(2-9 viettel), 07x(0,6-9 mobiphone), 08x(1-5 vinaphone)
// 05x (vietnammobile, gtel), 09x..

void main() => runApp(
      const MaterialApp(
        title: 'Reset Password in Flutter',
        debugShowCheckedModeBanner: false,
        home: ForgotPasswordPage(),
      ),
    );

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController phone = TextEditingController();
    //^ bắt đầu chuỗi, [0-9]{8} từ 0->9 sao cho đủ 8 số, $ kết thúc chuỗi
    RegExp regex = RegExp(r'(^[84|0]+[3|5|7|8|9]+[0-9]{8}$)');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 18, 50, 107),
          onPressed: () {},
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
                'Đặt lại mật khẩu',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 18, 50, 107),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Nhập số điện thoại của bạn.',
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
                  Text('SĐT',
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Text('*', style: TextStyle(fontSize: 15, color: Colors.red)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  TextFormField(
                    controller: phone,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Nhập Số điện thoại của bạn.',
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 12.0),
                    ),
                    validator: (phone) {
                      if (phone == '') {
                        return 'Vui lòng nhập số điện thoại của bạn!';
                      } else if (!regex.hasMatch(phone!)) {
                        return 'Số điện thoại không hợp lệ!';
                      }
                    },
                    // String afterHide=phone.replaceRange(0, 7, '***');

                    onSaved: (phone) {},
                  ),
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
                                  builder: (BuildContext context) =>
                                      RegisterPage(phone: phone.text),
                                ));
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 18, 50, 107)),
                        ),
                        child: const Text('XÁC NHẬN')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
