import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final int projectIndex;
  
  DetailsPage(this.projectIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Details'),
      ),
      body: Center(
        child: Text('Details for Project $projectIndex'),
      ),
    );
  }
}
