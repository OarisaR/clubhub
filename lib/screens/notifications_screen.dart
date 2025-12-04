/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/widgets/background_container.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock notifications - in a real app fetch from API or local DB
    final notes = [
      {'title': 'Reminder: Photography Walk', 'subtitle': 'Starts tomorrow at 15:00', 'eventId': 'e2'},
      {'title': 'Schedule change: Hackathon', 'subtitle': 'New start time 09:00 on Feb 15', 'eventId': 'e1'},
      {'title': 'Feedback requested', 'subtitle': 'Please review Music Night', 'eventId': 'e6'},
    ];

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primary, title: const Text('Notifications')),
      body: ListView.separated(
        itemCount: notes.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) => ListTile(
          title: Text(notes[i]['title']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          subtitle: Text(notes[i]['subtitle']!, style: GoogleFonts.poppins()),
          onTap: () {
            final id = notes[i]['eventId']!;
            Navigator.pushNamed(context, '/event/$id');
          },
        ),
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/widgets/background_container.dart';
import 'package:clubhub/widgets/custom_bottom_navbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 📨 Sample notifications list (can later be replaced with API data)
    final notes = [
      {
        'title': 'Reminder: Photography Walk',
        'subtitle': 'Starts tomorrow at 15:00',
        'eventId': 'e2'
      },
      {
        'title': 'Schedule change: Hackathon',
        'subtitle': 'New start time 09:00 on Feb 15',
        'eventId': 'e1'
      },
      {
        'title': 'Feedback requested',
        'subtitle': 'Please review Music Night',
        'eventId': 'e6'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notifications'),
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF14213D), Color(0xFF1E3A8A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: BackgroundContainer(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          itemCount: notes.length,
          separatorBuilder: (_, __) =>
          const Divider(height: 1, color: Colors.black12),
          itemBuilder: (context, i) => Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.notifications_active,
                  color: AppColors.secondary),
              title: Text(
                notes[i]['title']!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.primary,
                ),
              ),
              subtitle: Text(
                notes[i]['subtitle']!,
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              onTap: () {
                final id = notes[i]['eventId']!;
                Navigator.pushNamed(context, '/event/$id');
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/widgets/background_container.dart';
import 'package:clubhub/widgets/custom_bottom_navbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notes = [
      {
        'title': 'Reminder: Photography Walk',
        'subtitle': 'Starts tomorrow at 15:00',
        'eventId': 'e2'
      },
      {
        'title': 'Schedule change: Hackathon',
        'subtitle': 'New start time 09:00 on Feb 15',
        'eventId': 'e1'
      },
      {
        'title': 'Feedback requested',
        'subtitle': 'Please review Music Night',
        'eventId': 'e6'
      },
      {
        'title': 'Club meeting today',
        'subtitle': 'Room 204, 5:00 PM',
        'eventId': 'e7'
      },
      {
        'title': 'New event added!',
        'subtitle': 'Cultural Fest - Feb 25',
        'eventId': 'e8'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notifications'),
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF14213D), Color(0xFF1E3A8A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          itemCount: notes.length,
          itemBuilder: (context, i) {
            final note = notes[i];

            // Each item fades + pops into place
            return TweenAnimationBuilder<double>(
              key: ValueKey(note['title']),
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 400 + i * 100),
              curve: Curves.easeOutBack, // gives the subtle pop effect
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: 0.9 + (value * 0.1), // 0.9 → 1.0 scale
                    child: child,
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                shadowColor: Colors.black26,
                child: ListTile(
                  leading: const Icon(Icons.notifications_active,
                      color: AppColors.secondary),
                  title: Text(
                    note['title']!,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.primary,
                    ),
                  ),
                  subtitle: Text(
                    note['subtitle']!,
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                  onTap: () {
                    final id = note['eventId']!;
                    Navigator.pushNamed(context, '/event/$id');
                  },
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
