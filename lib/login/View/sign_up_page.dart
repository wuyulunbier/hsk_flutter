import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isShowPassWord = false;
  bool isShowRePassWord = false;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode rePasswordFocusNode = FocusNode();

  Map<String, dynamic> _userInfo;

  @override
  void initState() {
    super.initState();

    _userInfo = Map();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(
          child: Column(
            children: <Widget>[
              _buildUserNameInput(),
              buildEmailInput(),
              _buildPasswordInput(),
              _buildRePasswordInput(),
            ],
          ),
        ),
      ),
    );
  }
}
// Widget build(BuildContext context) {
//   return Padding(
//       padding: const EdgeInsets.only(top: 23),
//       child:
//

//}

// void showPassword() {
//   // setState(() {
//   //   isShowPassWord = !isShowPassWord;
//   // });
// }

Widget _buildUserNameInput() {
  return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: TextFormField(
          // controller: TextEditingController(text: _userInfo['username']),
          // onChanged: (value) => _userInfo['username'] = value,
          // maxLines: 1,
          // keyboardType: TextInputType.text,
          // onEditingComplete: () =>
          //     FocusScope.of(context).requestFocus(emailFocusNode),
          // decoration: InputDecoration(
          //     icon: Icon(Icons.person, color: Colors.black),
          //     hintText: "${S.of(context).username}",
          //     border: InputBorder.none),
          style: TextStyle(fontSize: 16, color: Colors.black)));
}

Widget buildEmailInput() {
  return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: TextFormField(
          // controller: TextEditingController(text: _userInfo['email']),
          // onChanged: (value) => _userInfo['email'] = value,
          // focusNode: emailFocusNode,
          // maxLines: 1,
          // keyboardType: TextInputType.emailAddress,
          // onEditingComplete: () =>
          //     FocusScope.of(context).requestFocus(passwordFocusNode),
          // decoration: InputDecoration(
          //     icon: Icon(Icons.email, color: Colors.black),
          //     hintText: "${S.of(context).email}",
          //     border: InputBorder.none),
          style: TextStyle(fontSize: 16, color: Colors.black)));
}

Widget _buildPasswordInput() {
  return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: TextFormField(
          //controller: TextEditingController(text: _userInfo['password']),
          // onChanged: (value) => _userInfo['password'] = value,
          // keyboardType: TextInputType.text,
          // focusNode: passwordFocusNode,
          // decoration: InputDecoration(
          //     icon: Icon(Icons.lock, color: Colors.black),
          //     hintText: "${S.of(context).password}",
          //     border: InputBorder.none,
          //     suffixIcon: IconButton(
          //         color: Theme.of(context).primaryColor,
          //         icon: Icon(
          //             isShowPassWord
          //                 ? Icons.visibility
          //                 : Icons.visibility_off,
          //             color: Colors.black),
          //         onPressed: () => showPassword())),
          // onEditingComplete: () =>
          //     FocusScope.of(context).requestFocus(rePasswordFocusNode),
          // maxLines: 1,
          // obscureText: !isShowPassWord,
          style: TextStyle(fontSize: 16.0, color: Colors.black)));
}

Widget _buildRePasswordInput() {
  return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: TextFormField(
          // controller: TextEditingController(text: _userInfo['repassword']),
          // onChanged: (value) => _userInfo['repassword'] = value,
          // keyboardType: TextInputType.text,
          // focusNode: rePasswordFocusNode,
          // decoration: InputDecoration(
          //     icon: Icon(Icons.lock, color: Colors.black),
          //     hintText: "${S.of(context).confirmPassword}",
          //     border: InputBorder.none,
          //     suffixIcon: IconButton(
          //         color: Theme.of(context).primaryColor,
          //         icon: Icon(
          //             isShowPassWord
          //                 ? FontAwesome.eye
          //                 : FontAwesome.eye_slash,
          //             color: Colors.black),
          //         onPressed: () => showPassword())),
          // textInputAction: TextInputAction.done,
          // maxLines: 1,
          // obscureText: !isShowPassWord,
          style: TextStyle(fontSize: 16.0, color: Colors.black)));
}

//void _register() async {
//Toast.show(context, "${S.of(context).register}");
// }
//}
