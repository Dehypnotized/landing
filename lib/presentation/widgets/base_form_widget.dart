import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class BaseFormWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  BaseFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Theme.of(context).cardColor,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'Contact us',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                24.0.heightBox,
                TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    )),
                TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    )),
                24.0.heightBox,
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Send')))
              ]))),
    );
  }
}
