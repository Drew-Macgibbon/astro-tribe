// To receive realtime updates, you have to first enable Realtime on from your Supabase console. You can read more here on how to enable it.
// Warning When using stream() with a StreamBuilder, make sure to persist the stream value as a variable in a StatefulWidget instead of directly
// constructing the stream within your widget tree, which could cause rapid rebuilds that will lead to losing realtime connection.

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final client = Supabase.instance.client;

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // Persisting the future as local variable to prevent refetching upon rebuilds.
  final _stream = client.from('countries').stream(['id']).execute();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      builder: (context, snapshot) {
        return setState(() {
          snapshot.data;
        });
        // return your widget with the data from snapshot
      },
    );
  }
}