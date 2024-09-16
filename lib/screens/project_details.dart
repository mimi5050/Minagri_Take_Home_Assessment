import 'package:flutter/material.dart';

class ProjectDetails extends StatefulWidget {
  final String projectName;

  ProjectDetails({required this.projectName});

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    String description =
        'This project is a Gaming Platform Web & Mobile App designed to provide a comprehensive gaming experience across devices. The app includes features for multiplayer gaming, real-time updates, and an immersive user experience.';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectName),
        backgroundColor: Colors.deepPurple[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the Home Page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the home
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Share functionality can be added here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // More options can be added here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Image.asset(
              'assets/images/project1.png', // Replace with dynamic image if necessary
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            SizedBox(height: 16),

            // Project Description
            Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            
            // Partial description with "See more details" button
            Text(
              showFullText
                  ? description
                  : description.substring(0, 100) + '...',
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  showFullText = !showFullText;
                });
              },
              child: Text(
                showFullText ? 'See less details' : 'See more details',
                style: TextStyle(
                  color: Colors.deepPurple[400],
                  fontSize: 16,
                ),
              ),
            ),
            
            SizedBox(height: 16),

            // Team Section
            Text(
              'Team Members',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
          children: [
            teamMemberAvatar('assets/images/person1.png'),
            teamMemberAvatar('assets/images/person2.png'),
            teamMemberAvatar('assets/images/person3.png'),
          ],
        ),

            SizedBox(height: 16),

            // Leader Section
            Text(
              'Team Leader',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/person1.png'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jeanine Uwase', style: TextStyle(fontSize: 16)),
                    Text('Lead Developer', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // Due Date Section
            Row(
              children: [
                Icon(Icons.date_range, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Due Date: September 30, 2024',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Date Created Section
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Date Created: June 22, 2024',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Attachments Section
            Text(
              'Attachments',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.picture_as_pdf, color: Colors.red),
                SizedBox(width: 8),
                Text('Project_Documentation.pdf', style: TextStyle(fontSize: 16)),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Add PDF attachment functionality here
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            // Custom Section Button
            ElevatedButton(
              onPressed: () {
                // Custom section logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[400],
              ),
              child: Text('Add Custom Section'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for displaying team member avatars (without names)
Widget teamMemberAvatar(String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage(imagePath),
    ),
  );
}

}
