// ignore_for_file: unused_element

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/home/job_entries/job_entries_page.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/edit_job_page.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/job_list_tile.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/list_item_builder.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';
import 'package:time_tracker_flutter_course/common_widgets/show_alert_dialog.dart';
import 'package:time_tracker_flutter_course/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/database.dart';

class JobsPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Future<void> _delete(BuildContext context, Job job) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deleteJob(job);
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: "Operation failed",
        exception: e,
      );
    }
  }

  // Future<void> _createJob(BuildContext context) async {
  //   try {
  //     final database = Provider.of<Database>(context, listen: false);
  //     await database.createJob(Job(name: "Blogging", ratePerHour: 10));
  //   } on FirebaseException catch (e) {
  //     showAlertDialog(context,
  //         title: "Operation Failed",
  //         content: e.toString(),
  //         defaultActionText: "OK");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print("in build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Jobs'),
        actions: <Widget>[
          IconButton(
              // onPressed: () {},
              onPressed: () => EditJobPage.show(context,
                  database: Provider.of<Database>(context, listen: false)),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
      stream: database.jobsStream(),
      builder: (context, snapshot) {
        return ListItemBuilder<Job>(
          snapshot: snapshot,
          itemBuilder: (context, job) => Dismissible(
            key: Key("job-${job.id}"),
            onDismissed: (direction) => _delete(context, job),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            child: JobListTile(
              job: job,
              onTap: () => JobEntriesPage.show(context, job),
            ),
          ),
        );
        // if (snapshot.hasData) {
        //   final jobs = snapshot.data;
        //   if (jobs.isNotEmpty) {
        //     final children = jobs
        //         .map((job) => JobListTile(
        //               job: job,
        //               onTap: () => EditJobPage.show(context, job: job),
        //             ))
        //         .toList();
        //     return ListView(children: children);
        //   }
        //   return EmptyContent();
        // }
        // if (snapshot.hasError) {
        //   return Center(
        //     child: Text("Some error occurred"),
        //   );
        // }
        // return Center(
        //   child: CircularProgressIndicator(),
        // );
      },
    );
  }
}
