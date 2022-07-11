import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';
import 'package:flutter_demo/widget/stateful/overlay_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/banner3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            const Positioned(
              top: 44,
              left: 10,
              child: CloseButton(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: 20,
              right: 20,
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                child: buildForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      ///设置globalKey，用于后面获取FormState
      key: formKey,

      ///开启自动校验
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.number,
            //键盘回车键的样式
            textInputAction: TextInputAction.next,
            controller: unameController,
            decoration: const InputDecoration(
                labelText: "用户名", hintText: "用户名", icon: Icon(Icons.person)),
            // 校验用户名
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "用户名不能为空";
            },
          ),
          TextFormField(
            autofocus: false,
            controller: pwdController,
            decoration: const InputDecoration(
                labelText: "密码", hintText: "您的登录密码", icon: Icon(Icons.lock)),
            obscureText: true,
            //校验密码
            validator: (v) {
              return v!.trim().length > 5 ? null : "密码不能少于6位";
            },
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              padding: const EdgeInsets.all(15.0),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
                /// 这里不能通过此方式获取FormState
                /// print(Form.of(context));
                // 通过_formKey.currentState 获取FormState后，调用validate()方法校验用户名密码是否合法，校验通过后再提交数据。
                if ((formKey.currentState as FormState).validate()) {
                  /// 验证通过提交数据
                  Toast.show(
                      context: context, message: '${unameController.text}登录成功');
                }
              },
              child: const Text(
                "登录",
                style: descLightStyle,
              ),
            ),
          ),

          /// 登录按钮
          // Padding(
          //   padding: const EdgeInsets.only(top: 28.0),
          //   child: Row(
          //     children: <Widget>[
          //       Expanded(
          //         child: MaterialButton(
          //           padding: const EdgeInsets.all(15.0),
          //           color: Colors.redAccent,
          //           textColor: Colors.white,
          //           onPressed: () {
          //             /// 这里不能通过此方式获取FormState
          //             /// print(Form.of(context));
          //             // 通过_formKey.currentState 获取FormState后，调用validate()方法校验用户名密码是否合法，校验通过后再提交数据。
          //             if ((formKey.currentState as FormState).validate()) {
          //               /// 验证通过提交数据
          //               Toast.show(
          //                   context: context,
          //                   message: '${unameController.text}登录成功');
          //             }
          //           },
          //           child: const Text(
          //             "登录",
          //             style: descLightStyle,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
