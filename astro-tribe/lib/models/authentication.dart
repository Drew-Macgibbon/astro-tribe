import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

final SupabaseClient client = Supabase.instance.client;

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final GotrueSubscription _authSubscription;
  User? _user;

  @override
  void initState() {
    _authSubscription = client.auth.onAuthStateChange((event, session) {
      setState(() {
        _user = session?.user;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _authSubscription.data?.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        client.auth.signIn(email: 'tester@schmester.com');
      },
      child: const Text('Login'),
    );
  }
}