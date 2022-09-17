import 'package:flutter/material.dart';import 'package:supabase_flutter/supabase_flutter.dart';
import 'database_realtime.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // Persisting the future as local variable to prevent refetching upon rebuilds. 
  final Future<PostgrestResponse<dynamic>> _future = client
      .from('countries')
      .select()
      .order('name', ascending: true)
      .execute();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        // return your widget with the data from snapshot
      },
    );
  }
}