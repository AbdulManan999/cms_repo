import 'package:flutter/material.dart';
import 'package:login/admin_panel/admin_drawer.dart';
import 'package:login/components_app/cms_complaint_card.dart';
import 'package:login/models/complaints.dart';
import 'package:login/providers/complaintp.dart';
import 'package:provider/provider.dart';

class PendingComplainsScreens extends StatefulWidget {
  const PendingComplainsScreens({
    Key? key,
  }) : super(key: key);

  @override
  State<PendingComplainsScreens> createState() =>
      _PendingComplainsScreensState();
}

class _PendingComplainsScreensState extends State<PendingComplainsScreens> {
  @override
  Widget build(BuildContext context) {
    Future<List<Complain>> complains =
        Provider.of<ComplaintP>(context).getComplaints();
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Pending Complaints'),
        centerTitle: true,
        leading: IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      drawer: const AdminDrawer(),
      body:
          const SafeArea(child: SingleChildScrollView(child: ComplaintCard())),
    );
  }
}
