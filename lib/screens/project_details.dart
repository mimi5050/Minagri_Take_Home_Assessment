import 'package:flutter/material.dart';

class ProjectDetails extends StatefulWidget {
  final String projectName;

  ProjectDetails({required this.projectName});

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  bool showFullText = false;
  final List<String> tasks = ['Task 1', 'Task 2', 'Task 3'];
  final Map<String, bool> taskVoting = {
    'Task 1': false,
    'Task 2': false,
    'Task 3': false,
  };

  @override
  Widget build(BuildContext context) {
    String description =
        'This project is a Gaming Platform Web & Mobile App designed to provide a comprehensive gaming experience across devices. The app includes features for multiplayer gaming, real-time updates, and an immersive user experience.';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectName, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the Home Page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the home
            },
          ),
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Share functionality can be added here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
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
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Adjusted padding
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
            SizedBox(
              width: double.infinity, // Make the button full width
              child: ElevatedButton(
                onPressed: () {
                  // Custom section logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400], // Background color
                  padding: EdgeInsets.symmetric(vertical: 12), // Adjusted padding
                ),
                child: Text(
                  'Add Custom Section',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),

            SizedBox(height: 16),

            // Sub Task Section
            Text(
              'Sub Task (3)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // List of Sub Tasks with Voting Icons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: tasks.map((task) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: taskVoting[task] == true ? Colors.green[50] : Colors.white,
                    border: Border.all(
                      color: taskVoting[task] == true ? Colors.green : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(task),
                      IconButton(
                        icon: Icon(
                          taskVoting[task] == true ? Icons.check_circle : Icons.check_circle_outline,
                          color: taskVoting[task] == true ? Colors.green : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            taskVoting.update(task, (voted) => !voted);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 16),

            // Add New Sub Task Button
            SizedBox(
              width: double.infinity, // Make the button full width
              child: ElevatedButton(
                onPressed: () {
                  // Add new sub task logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400], // Background color
                  padding: EdgeInsets.symmetric(vertical: 12), // Adjusted padding
                ),
                child: Text(
                  '+ Add New Sub Task',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for displaying title with icon
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
