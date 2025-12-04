/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/providers/event_provider.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/widgets/background_container.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);
    final registered = events.where((e) => e.isRegistered).length;
    final attended = events.where((e) => e.isAttended).length;

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primary, title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(radius: 44, backgroundColor: AppColors.secondary, child: Text('A', style: GoogleFonts.poppins(fontSize: 32, color: Colors.white))),
            const SizedBox(height: 12),
            Text('Alice Student', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text('alice@student.edu', style: GoogleFonts.poppins()),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [Text('$registered', style: GoogleFonts.poppins(fontWeight: FontWeight.w700)), Text('Registered')]),
                Column(children: [Text('$attended', style: GoogleFonts.poppins(fontWeight: FontWeight.w700)), Text('Attended')]),
              ],
            ),
            const SizedBox(height: 18),
            ListTile(leading: const Icon(Icons.edit), title: Text('Edit Profile', style: GoogleFonts.poppins())),
            ListTile(leading: const Icon(Icons.logout), title: Text('Logout', style: GoogleFonts.poppins())),
          ],
        ),
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/providers/event_provider.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/widgets/background_container.dart';
import 'package:clubhub/widgets/custom_bottom_navbar.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);
    final registered = events.where((e) => e.isRegistered).length;
    final attended = events.where((e) => e.isAttended).length;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // 🧑 Profile avatar
              CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.secondary,
                child: Text(
                  'A',
                  style: GoogleFonts.poppins(
                      fontSize: 36, color: Colors.white, letterSpacing: 1),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Alice Student',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary),
              ),
              const SizedBox(height: 4),
              Text(
                'alice@student.edu',
                style: GoogleFonts.poppins(
                    fontSize: 14, color: Colors.black87.withOpacity(0.7)),
              ),
              const SizedBox(height: 20),

              // 📊 Quick stats
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Registered', registered.toString()),
                    _buildStatItem('Attended', attended.toString()),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ⚙️ Profile settings
              ListTile(
                leading: const Icon(Icons.edit, color: AppColors.primary),
                title: Text('Edit Profile', style: GoogleFonts.poppins()),
                onTap: () {},
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.logout, color: AppColors.secondary),
                title: Text('Logout', style: GoogleFonts.poppins()),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
*/

//new one//
/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/providers/event_provider.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/widgets/custom_bottom_navbar.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventsProvider);
    final registered = events.where((e) => e.isRegistered).length;
    final attended = events.where((e) => e.isAttended).length;

    return Scaffold(
      // ✅ Make the entire page navy including behind bottom nav
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF14213D),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF14213D), Color(0xFF1E3A8A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    // 🧑 Avatar with pop animation
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.secondary,
                        child: Text(
                          'A',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Alice Student',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'alice@student.edu',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // 📊 Stats card
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutCubic,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('Registered', registered.toString()),
                          Container(width: 1, height: 28, color: Colors.black12),
                          _buildStatItem('Attended', attended.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // ⚙️ Action buttons
                    _buildActionTile(
                      icon: Icons.edit,
                      text: 'Edit Profile',
                      color: Colors.white,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _buildActionTile(
                      icon: Icons.logout,
                      text: 'Logout',
                      color: Color(0xFFFCA311),
                      onTap: () {},
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      // ✅ Give bottom nav transparent background to let gradient show through
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: const CustomBottomNavBar(currentIndex: 3),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.primary.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white24),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 12),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

//enchanced one//
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/providers/event_provider.dart';
import 'package:clubhub/widgets/custom_bottom_navbar.dart';
import 'package:clubhub/widgets/event_card.dart';
import '../models/event_model.dart';
import 'edit_profile_screen.dart';
import 'event_detail_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventsProvider);
    final registeredEvents = events.where((e) => e.isRegistered).toList();
    final attendedEvents = events.where((e) => e.isAttended).toList();

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF14213D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF14213D), Color(0xFF1E3A8A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    // 🧑 Avatar
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.secondary,
                        child: Text(
                          'A',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Alice Student',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'alice@student.edu',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // 📊 Stats
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutCubic,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('Registered', registeredEvents),
                          Container(
                            width: 1,
                            height: 28,
                            color: Colors.black12,
                          ),
                          _buildStatItem('Attended', attendedEvents),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ⚙️ Actions
                    _buildActionTile(
                      icon: Icons.edit,
                      text: 'Edit Profile',
                      color: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(
                              milliseconds: 400,
                            ),
                            pageBuilder: (_, __, ___) =>
                                const _EditProfileGradientWrapper(),
                            transitionsBuilder: (_, animation, __, child) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 0.1),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildActionTile(
                      icon: Icons.logout,
                      text: 'Logout',
                      color: const Color(0xFFFF8C42),
                      onTap: () {},
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildStatItem(String label, List<EventModel> events) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) =>
                _EventListPopup(title: label, events: events),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Text(
            '${events.length}',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.primary.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white24),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 12),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// 🪄 ANIMATED EVENT LIST POPUP
/// ===============================
class _EventListPopup extends StatefulWidget {
  final String title;
  final List<EventModel> events;

  const _EventListPopup({required this.title, required this.events});

  @override
  State<_EventListPopup> createState() => _EventListPopupState();
}

class _EventListPopupState extends State<_EventListPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final events = widget.events;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF14213D), Color(0xFF1E3A8A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: events.isEmpty
            ? Center(
                child: Text(
                  'No ${widget.title} events yet',
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: events.length,
                itemBuilder: (context, i) {
                  final event = events[i];
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _controller,
                      curve: Interval(
                        i / events.length,
                        1,
                        curve: Curves.easeIn,
                      ),
                    ),
                    child: SlideTransition(
                      position:
                          Tween<Offset>(
                            begin: const Offset(0, 0.2),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: _controller,
                              curve: Interval(
                                i / events.length,
                                1,
                                curve: Curves.easeOut,
                              ),
                            ),
                          ),
                      child: EventCard(
                        event: event,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EventDetailScreen(event: event),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

/// 🌈 Edit Profile wrapped in gradient background
class _EditProfileGradientWrapper extends StatelessWidget {
  const _EditProfileGradientWrapper();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF14213D), Color(0xFF1E3A8A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const EditProfileScreen(),
    );
  }
}
