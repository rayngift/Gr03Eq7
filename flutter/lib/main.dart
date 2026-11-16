import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactPage(),
        '/confirmation': (context) => const ConfirmationPage(),
      },
    );
  }
}

// FIRST SCREEN: CONTACT FORM

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void sendForm() {
    if (_formKey.currentState!.validate()) {

      Navigator.pushNamed(
        context,
        '/confirmation',
        arguments: {
          'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'message': messageController.text,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              const Icon(
                Icons.mail_outline,
                size: 65,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 15),

              const Text(
                'Formulaire de contact',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

// NAME

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Le nom est obligatoire';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

// EMAIL

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email obligatoire';
                  }

                  if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+$'
                  ).hasMatch(value.trim())) {
                    return 'Email invalide';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

// PHONE

              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,

                decoration: const InputDecoration(
                  labelText: 'Téléphone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Téléphone obligatoire';
                  }

                  if (value.trim().length < 8) {
                    return 'Numéro invalide';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

// MESSAGE

              TextFormField(
                controller: messageController,
                maxLines: 5,

                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.message),
                  alignLabelWithHint: true,
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Message obligatoire';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

// SEND BUTTON

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: sendForm,
                  icon: const Icon(Icons.send),
                  label: const Text('Envoyer'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SECOND SCREEN: CONFIRMATION

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context)!.settings.arguments
    as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Card(
            elevation: 4,

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 65,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Center(
                    child: Text(
                      'Message envoyé !',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text('Nom : ${data['name']}'),

                  const SizedBox(height: 12),

                  Text('Email : ${data['email']}'),

                  const SizedBox(height: 12),

                  Text('Téléphone : ${data['phone']}'),

                  const SizedBox(height: 12),

                  Text('Message : ${data['message']}'),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                              (route) => false,
                        );
                      },
                      child: const Text('Retour'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}