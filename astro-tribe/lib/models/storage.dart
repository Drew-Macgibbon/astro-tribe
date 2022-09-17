import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:io';


final SupabaseClient client = Supabase.instance.client;

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final file = File('example.txt');
        file.writeAsStringSync('File content');
        client.storage
            .from('my_bucket')
            .upload('/storage/buckets/private-images/example.txt', file);
      },
      child: const Text('Upload'),
    );
  }
}
