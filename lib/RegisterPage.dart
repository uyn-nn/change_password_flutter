// ignore: file_names
import 'package:flutter/material.dart';
import 'package:change_password/ResetPassWordPage.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  String phone;
  RegisterPage({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
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
                'Đặt lại mật khẩu',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 18, 50, 107),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Nhập mã OTP đã được gửi đến số điện thoại ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Mã xác minh SĐT',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorStyle: const TextStyle(fontSize: 12.0),
                        suffixIcon: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(15)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Gửi lại mã',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 55, 35, 130)),
                          ),
                        )),
                    validator: (value) {
                      if (value == '') {
                        return 'Vui lòng nhập mã xác minh mà bạn vừa nhận.';
                      } else if (value?.length != 5) {
                        return 'Mã xác minh không hợp lệ!';
                      }
                    },
                    onSaved: (value) {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints.tightFor(width: 400, height: 50),
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ResetPassWordPage(),
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
                  const SizedBox(height: 15),
                  const Text(
                    'Bạn không nhận được mã?',
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 11, 11, 11)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Liên hệ trợ giúp',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 11, 11, 11)),
                      ),
                      TextButton(
                        child: const Text(
                          'Tại đây',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 24, 71, 152)),
                        ),
                        onPressed: () {},
                      ),
                    ],
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
