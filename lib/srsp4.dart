import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Регистрационная форма'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _regionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person,
            size: 50,
            color: Colors.blue,
          ),
          Text(
            'Регистрационная форма',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Имя',
              icon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите имя';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Телефон',
              icon: Icon(Icons.phone),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите телефон';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Почта',
              icon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите почту';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Пароль',
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите пароль';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _regionController,
            decoration: InputDecoration(
              labelText: 'Регион',
              icon: Icon(Icons.location_on),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите регион';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      region: _regionController.text,
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: Text('Отправить форму'),
          )
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String region;

  NextPage({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Результат регистрации'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 50,
              color: Colors.green,
            ),
            Text('Регистрация успешна', style: TextStyle(fontSize: 24, color: Colors.green)),
            SizedBox(height: 10),
            Text('$name теперь подтвержденная регистрационная форма', textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text('Введенные данные:', style: TextStyle(fontSize: 18)),
            Text('Имя: $name'),
            Text('Телефон: $phone'),
            Text('Почта: $email'),
            Text('Пароль: $password'),
            Text('Регион: $region'),
          ],
        ),
      ),
    );
  }
}
