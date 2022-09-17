import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final client = Supabase.instance.client;

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final RealtimeSubscription _subscription;
  @override
  void initState() {
    _subscription =
        client.from('countries').on(SupabaseEventTypes.all, (payload) {
      // Do something when there is an update
    }).subscribe();
    super.initState();
  }

  @override
  void dispose() {
    client.removeSubscription(_subscription);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}