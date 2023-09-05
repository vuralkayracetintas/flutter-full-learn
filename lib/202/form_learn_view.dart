import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {},
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            /*  DropdownButtonFormField(items: const [
              DropdownMenuItem(child: Text("Ahmet"), value: 'v'),
              DropdownMenuItem(child: Text("Mehmet"), value: 'v1'),
              DropdownMenuItem(child: Text("Hasan"), value: 'v2'),
            ], onChanged: (value) {}),*/
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print("okey");
                  }
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorString._notEmpyt;
  }
}

class ValidatorString {
  static const String _notEmpyt = "Bu Alan Boş Geçilemez";
}
