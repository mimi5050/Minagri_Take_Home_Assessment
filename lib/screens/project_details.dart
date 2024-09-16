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

            // Organized Content (Team, Team Leader, Status, Due Date, Attachments)
            Table(
              columnWidths: {
                0: FlexColumnWidth(), // Expands the first column flexibly
                1: FlexColumnWidth(), // Expands the second column flexibly
              },
              children: [
                // Team Row
                TableRow(
                  children: [
                    _buildTitleWithIcon('Team', Icons.group),
                    Row(
                      children: [
                        teamMemberAvatar('assets/images/person1.png'),
                        SizedBox(width: 8), // Spacing between avatars
                        teamMemberAvatar('assets/images/person2.png'),
                        SizedBox(width: 8), // Spacing between avatars
                        teamMemberAvatar('assets/images/person3.png'),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [SizedBox(height: 16), SizedBox(height: 16)],
                ),
                
                // Team Leader Row
                TableRow(
                  children: [
                    _buildTitleWithIcon('Team Leader', Icons.person),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/person1.png'),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jeanine Uwase', style: TextStyle(fontSize: 12)),
                            Text('(You)', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [SizedBox(height: 16), SizedBox(height: 16)],
                ),
                
                // Status Row
                TableRow(
                  children: [
                    _buildTitleWithIcon('Status', Icons.assignment_turned_in),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFE91E63),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 120), // Reduced width
                        child: Text(
                          'To Do',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [SizedBox(height: 16), SizedBox(height: 16)],
                ),
                
                // Due Date Row
                TableRow(
                  children: [
                    _buildTitleWithIcon('Due Date', Icons.date_range),
                    Text('September 30, 2024', style: TextStyle(fontSize: 14)),
                  ],
                ),
                TableRow(
                  children: [SizedBox(height: 16), SizedBox(height: 16)],
                ),
                
                // Attachments Row
                TableRow(
                  children: [
                    _buildTitleWithIcon('Attachments', Icons.attach_file),
                    Row(
                      children: [
                        Icon(Icons.picture_as_pdf, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Reference.pdf', style: TextStyle(fontSize: 12)),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            // Add PDF attachment functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple[400], // Background color
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Adjusted padding
                            textStyle: TextStyle(fontSize: 12), // Reduced font size
                          ),
                          child: Text(
                            '+ Add',
                            style: TextStyle(color: Colors.white), // Text color
                          ),
                        ),
                      ],
                    ),
                  ],
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

  // Helper widget to build titles with icons
  Widget _buildTitleWithIcon(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Helper widget for displaying team member avatars (without names)
  Widget teamMemberAvatar(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0), // Reduced horizontal padding
      child: CircleAvatar(
        radius: 20, // Radius for team member avatars
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
