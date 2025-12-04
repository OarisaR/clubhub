/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/screens/home_screen.dart';
import 'package:clubhub/screens/my_events_screen.dart';
import 'package:clubhub/screens/notifications_screen.dart';
import 'package:clubhub/screens/profile_screen.dart';
import 'package:clubhub/screens/event_detail_screen.dart';
import 'package:clubhub/models/event_model.dart';


void main() {
  runApp(const ProviderScope(child: ClubHubApp()));
}

class ClubHubApp extends StatelessWidget {
  const ClubHubApp({Key? key}) : super(key: key);

  Route<dynamic>? _onGenerate(RouteSettings settings) {
    final name = settings.name ?? '/';
    if (name.startsWith('/event/')) {
      final id = name.split('/event/').last;
      final args = settings.arguments;
      EventModel? ev;
      if (args is EventModel) ev = args;
      return MaterialPageRoute(
        builder: (_) => EventDetailScreen(event: ev!),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClubHub',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundGray,
        primaryColor: AppColors.primary,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
      ),
      routes: {
        '/': (_) => const HomeScreen(),
        '/myevents': (_) => const MyEventsScreen(),
        '/notifications': (_) => const NotificationsScreen(),
        '/profile': (_) => const ProfileScreen(),
      },
      onGenerateRoute: _onGenerate,
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/screens/home_screen.dart';
import 'package:clubhub/screens/my_events_screen.dart';
import 'package:clubhub/screens/notifications_screen.dart';
import 'package:clubhub/screens/profile_screen.dart';
import 'package:clubhub/models/event_model.dart';
import 'package:clubhub/providers/event_provider.dart';
import 'package:clubhub/screens/event_detail_screen.dart';
import 'package:clubhub/widgets/background_container.dart';
import '../widgets/custom_bottom_navbar.dart'; // ✅ correct file name

void main() {
  runApp(const ProviderScope(child: ClubHubApp()));
}

class ClubHubApp extends ConsumerWidget {
  const ClubHubApp({Key? key}) : super(key: key);

  Route<dynamic>? _onGenerate(RouteSettings settings, WidgetRef ref) {
    final name = settings.name ?? '/';
    /*if (name.startsWith('/event/')) {
      final id = name.split('/event/').last;
      final args = settings.arguments;
      EventModel? ev;
      if (args is EventModel) ev = args;
      // Return wrapper that will fetch event by id if ev == null
      return MaterialPageRoute(
        builder: (_) => EventDetailRouteWrapper(eventId: id, initialEvent: ev),
        settings: settings,
      );
    }
    return null;*/
    if (name.startsWith('/event/')) {
      final args = settings.arguments;
      EventModel? ev;
      bool fromCompletedTab = false;
      if (args is Map) {
        ev = args['event'];
        fromCompletedTab = args['fromCompletedTab'] ?? false;
      } else if (args is EventModel) {
        ev = args;
      }

      return MaterialPageRoute(
        builder: (_) => EventDetailRouteWrapper(
          eventId: id,
          initialEvent: ev,
          fromCompletedTab: fromCompletedTab,
        ),
        settings: settings,
      );
    }

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClubHub',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundGray,
        primaryColor: AppColors.primary,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
      ),
      routes: {
        '/': (_) => const HomeScreen(),
        '/myevents': (_) => const MyEventsScreen(),
        '/notifications': (_) => const NotificationsScreen(),
        '/profile': (_) => const ProfileScreen(),
      },
      onGenerateRoute: (settings) => _onGenerate(settings, ref),
    );
  }
}

/// Wrapper that resolves event by id (reads provider) and then shows EventDetailScreen.
/// This prevents runtime errors when navigating to /event/:id without passing an EventModel.
class EventDetailRouteWrapper extends ConsumerWidget {
  final String eventId;
  final EventModel? initialEvent;

  const EventDetailRouteWrapper({
    required this.eventId,
    this.initialEvent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);

    // Use provided event if passed as argument
    final event = initialEvent ?? events.firstWhere(
          (e) => e.id == eventId,
      orElse: () => EventModel(
        id: 'notfound',
        title: 'Event not found',
        club: '',
        posterUrl: 'assets/illustrations/.gitkeep',
        shortDescription: '',
        description: 'Could not find the event.',
        dateTime: DateTime.now(),
        location: '',
      ),
    );

    return EventDetailScreen(event: event);
  }
}*/
//mine one//
/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/screens/home_screen.dart';
import 'package:clubhub/screens/my_events_screen.dart';
import 'package:clubhub/screens/notifications_screen.dart';
import 'package:clubhub/screens/profile_screen.dart';
import 'package:clubhub/models/event_model.dart';
import 'package:clubhub/providers/event_provider.dart';
import 'package:clubhub/screens/event_detail_screen.dart';
import 'package:clubhub/widgets/custom_bottom_navbar.dart';



void main() {
  runApp(const ProviderScope(child: ClubHubApp()));
}

class ClubHubApp extends ConsumerWidget {
  const ClubHubApp({Key? key}) : super(key: key);

  // 🧭 Handles all named route navigation
  Route<dynamic>? _onGenerate(RouteSettings settings, WidgetRef ref) {
    final name = settings.name ?? '/';

    // 🟢 Handle dynamic event detail route
    if (name.startsWith('/event/')) {
      final id = name.split('/event/').last;
      final args = settings.arguments;
      EventModel? ev;
      bool fromCompletedTab = false;

      // 🧩 Parse arguments (supports both map + event model)
      if (args is Map) {
        ev = args['event'];
        fromCompletedTab = args['fromCompletedTab'] ?? false;
      } else if (args is EventModel) {
        ev = args;
      }

      return MaterialPageRoute(
        builder: (_) => EventDetailRouteWrapper(
          eventId: id,
          initialEvent: ev,
          fromCompletedTab: fromCompletedTab,
        ),
        settings: settings,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClubHub',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundGray,
        primaryColor: AppColors.primary,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
      ),

      // 🗺 Static routes
      routes: {
        '/': (_) => const HomeScreen(),
        '/myevents': (_) => const MyEventsScreen(),
        '/notifications': (_) => const NotificationsScreen(),
        '/profile': (_) => const ProfileScreen(),
      },

      // 🎯 Dynamic route handler
      onGenerateRoute: (settings) => _onGenerate(settings, ref),
    );
  }
}

/// Wrapper that resolves event by ID and builds EventDetailScreen
class EventDetailRouteWrapper extends ConsumerWidget {
  final String eventId;
  final EventModel? initialEvent;
  final bool fromCompletedTab;

  const EventDetailRouteWrapper({
    required this.eventId,
    this.initialEvent,
    this.fromCompletedTab = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);

    // 🧩 Use provided event if passed, else find by ID
    final event = initialEvent ??
        events.firstWhere(
              (e) => e.id == eventId,
          orElse: () => EventModel(
            id: 'notfound',
            title: 'Event not found',
            club: '',
            posterUrl: 'assets/illustrations/not_found.png',
            shortDescription: '',
            description: 'Could not find the event.',
            dateTime: DateTime.now(),
            location: '',
          ),
        );

    // 🔁 Pass flag to control feedback visibility
    return EventDetailScreen(event: event, fromCompletedTab: fromCompletedTab);
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// 🧩 Constants (keep whichever folder your colors.dart is in)
import 'package:clubhub/utlis/app_colors.dart' as utils;

// 🧭 Screens
import 'package:clubhub/screens/splash_screen.dart';
import 'package:clubhub/screens/welcome_screen.dart';
import 'package:clubhub/screens/login_screen.dart';
import 'package:clubhub/screens/signup_screen.dart';
import 'package:clubhub/screens/home_screen.dart';
import 'package:clubhub/screens/my_events_screen.dart';
import 'package:clubhub/screens/notifications_screen.dart';
import 'package:clubhub/screens/profile_screen.dart';
import 'package:clubhub/screens/event_detail_screen.dart';

// 🧠 Models & Providers (from your version)
import 'package:clubhub/models/event_model.dart';
import 'package:clubhub/providers/event_provider.dart';

void main() {
  runApp(const ProviderScope(child: ClubHubApp()));
}

class ClubHubApp extends ConsumerWidget {
  const ClubHubApp({super.key});

  // 🧭 Handles dynamic navigation for event detail routes
  Route<dynamic>? _onGenerate(RouteSettings settings, WidgetRef ref) {
    final name = settings.name ?? '/';

    if (name.startsWith('/event/')) {
      final id = name.split('/event/').last;
      final args = settings.arguments;
      EventModel? ev;
      bool fromCompletedTab = false;

      if (args is Map) {
        ev = args['event'];
        fromCompletedTab = args['fromCompletedTab'] ?? false;
      } else if (args is EventModel) {
        ev = args;
      }

      return MaterialPageRoute(
        builder: (_) => EventDetailRouteWrapper(
          eventId: id,
          initialEvent: ev,
          fromCompletedTab: fromCompletedTab,
        ),
        settings: settings,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'ClubHub',
      debugShowCheckedModeBanner: false,

      // 🎨 Unified theme from your friend’s version
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: utils.AppColors.primary,
        scaffoldBackgroundColor: utils.AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: utils.AppColors.primary,
          primary: utils.AppColors.primary,
          secondary: utils.AppColors.accent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: utils.AppColors.primary,
          foregroundColor: utils.AppColors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: utils.AppColors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: utils.AppColors.white,
          labelStyle: GoogleFonts.poppins(color: utils.AppColors.textSecondary),
          hintStyle: GoogleFonts.poppins(
            color: utils.AppColors.textSecondary.withOpacity(0.6),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: utils.AppColors.textSecondary.withOpacity(0.2),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: utils.AppColors.accent,
              width: 2,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: utils.AppColors.accent,
            foregroundColor: utils.AppColors.white,
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),
      ),

      // 🏁 Start the app from splash → login → home
      initialRoute: '/splash',

      // 🗺️ All static routes combined
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/welcome': (_) => const WelcomeScreen(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/home': (_) => const HomeScreen(),
        '/myevents': (_) => const MyEventsScreen(),
        '/notifications': (_) => const NotificationsScreen(),
        '/profile': (_) => const ProfileScreen(),
      },

      // 🎯 Dynamic route handler (for event detail screens)
      onGenerateRoute: (settings) => _onGenerate(settings, ref),
    );
  }
}

/// 🔍 Resolves events by ID and opens EventDetailScreen
class EventDetailRouteWrapper extends ConsumerWidget {
  final String eventId;
  final EventModel? initialEvent;
  final bool fromCompletedTab;

  const EventDetailRouteWrapper({
    required this.eventId,
    this.initialEvent,
    this.fromCompletedTab = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);

    final event =
        initialEvent ??
        events.firstWhere(
          (e) => e.id == eventId,
          orElse: () => EventModel(
            id: 'notfound',
            title: 'Event not found',
            club: '',
            posterUrl: 'assets/illustrations/not_found.png',
            shortDescription: '',
            description: 'Could not find the event.',
            dateTime: DateTime.now(),
            location: '',
          ),
        );

    return EventDetailScreen(event: event, fromCompletedTab: fromCompletedTab);
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/utils/app_colors.dart' as utils;
import 'package:clubhub/screens/splash_screen.dart';
import 'package:clubhub/screens/welcome_screen.dart';
import 'package:clubhub/screens/login_screen.dart';
import 'package:clubhub/screens/signup_screen.dart';
import 'package:clubhub/screens/home_screen.dart';
import 'package:clubhub/screens/my_events_screen.dart';
import 'package:clubhub/screens/notifications_screen.dart';
import 'package:clubhub/screens/profile_screen.dart';
import 'package:clubhub/screens/event_detail_screen.dart';
import 'package:clubhub/models/event_model.dart';
import 'package:clubhub/providers/event_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:clubhub/widgets/custom_bottom_navbar.dart';

/*void main() {
  runApp(const ProviderScope(child: ClubHubApp()));
}*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: ClubHubApp()));
}


class ClubHubApp extends ConsumerWidget {
  const ClubHubApp({Key? key}) : super(key: key);

  Route<dynamic>? _onGenerate(RouteSettings settings, WidgetRef ref) {
    final name = settings.name ?? '/';

    if (name.startsWith('/event/')) {
      final id = name.split('/event/').last;
      final args = settings.arguments;
      EventModel? ev;
      bool fromCompletedTab = false;

      if (args is Map) {
        ev = args['event'];
        fromCompletedTab = args['fromCompletedTab'] ?? false;
      } else if (args is EventModel) {
        ev = args;
      }

      return MaterialPageRoute(
        builder: (_) => EventDetailRouteWrapper(
          eventId: id,
          initialEvent: ev,
          fromCompletedTab: fromCompletedTab,
        ),
        settings: settings,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'ClubHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: utils.AppColors.primary,
        scaffoldBackgroundColor: utils.AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: utils.AppColors.primary,
          primary: utils.AppColors.primary,
          secondary: utils.AppColors.accent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: utils.AppColors.primary,
          foregroundColor: utils.AppColors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: utils.AppColors.white,
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/welcome': (_) => const WelcomeScreen(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/home': (_) => const HomeScreen(),
        '/myevents': (_) => const MyEventsScreen(),
        '/notifications': (_) => const NotificationsScreen(),
        '/profile': (_) => const ProfileScreen(),
      },
      onGenerateRoute: (settings) => _onGenerate(settings, ref),
    );
  }
}

class EventDetailRouteWrapper extends ConsumerWidget {
  final String eventId;
  final EventModel? initialEvent;
  final bool fromCompletedTab;

  const EventDetailRouteWrapper({
    required this.eventId,
    this.initialEvent,
    this.fromCompletedTab = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);

    final event = initialEvent ??
        events.firstWhere(
              (e) => e.id == eventId,
          orElse: () => EventModel(
            id: 'notfound',
            title: 'Event not found',
            club: '',
            posterUrl: 'assets/illustrations/not_found.png',
            shortDescription: '',
            description: 'Could not find the event.',
            dateTime: DateTime.now(),
            location: '',
          ),
        );

    return EventDetailScreen(event: event, fromCompletedTab: fromCompletedTab);
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clubhub/constants/colors.dart';
import 'package:clubhub/utils/app_colors.dart' as utils;
import 'package:clubhub/screens/splash_screen.dart';
import 'package:clubhub/screens/welcome_screen.dart';
import 'package:clubhub/screens/login_screen.dart';
import 'package:clubhub/screens/signup_screen.dart';
import 'package:clubhub/screens/home_screen.dart';
import 'package:clubhub/screens/my_events_screen.dart';
import 'package:clubhub/screens/notifications_screen.dart';
import 'package:clubhub/screens/profile_screen.dart';
import 'package:clubhub/screens/event_detail_screen.dart';
import 'package:clubhub/models/event_model.dart';
import 'package:clubhub/providers/event_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Firebase correctly for both web & mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "YOUR-WEB-API-KEY",
        authDomain: "YOUR-PROJECT-ID.firebaseapp.com",
        projectId: "YOUR-PROJECT-ID",
        storageBucket: "YOUR-PROJECT-ID.appspot.com",
        messagingSenderId: "YOUR-SENDER-ID",
        appId: "YOUR-WEB-APP-ID",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const ProviderScope(child: ClubHubApp()));
}

class ClubHubApp extends ConsumerWidget {
  const ClubHubApp({Key? key}) : super(key: key);

  Route<dynamic>? _onGenerate(RouteSettings settings, WidgetRef ref) {
    final name = settings.name ?? '/';

    if (name.startsWith('/event/')) {
      final id = name.split('/event/').last;
      final args = settings.arguments;
      EventModel? ev;
      bool fromCompletedTab = false;

      if (args is Map) {
        ev = args['event'];
        fromCompletedTab = args['fromCompletedTab'] ?? false;
      } else if (args is EventModel) {
        ev = args;
      }

      return MaterialPageRoute(
        builder: (_) => EventDetailRouteWrapper(
          eventId: id,
          initialEvent: ev,
          fromCompletedTab: fromCompletedTab,
        ),
        settings: settings,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'ClubHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: utils.AppColors.primary,
        scaffoldBackgroundColor: utils.AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: utils.AppColors.primary,
          primary: utils.AppColors.primary,
          secondary: utils.AppColors.accent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: utils.AppColors.primary,
          foregroundColor: utils.AppColors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: utils.AppColors.white,
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/welcome': (_) => const WelcomeScreen(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/home': (_) => const HomeScreen(),
        '/myevents': (_) => const MyEventsScreen(),
        '/notifications': (_) => const NotificationsScreen(),
        '/profile': (_) => const ProfileScreen(),
      },
      onGenerateRoute: (settings) => _onGenerate(settings, ref),
    );
  }
}

class EventDetailRouteWrapper extends ConsumerWidget {
  final String eventId;
  final EventModel? initialEvent;
  final bool fromCompletedTab;

  const EventDetailRouteWrapper({
    required this.eventId,
    this.initialEvent,
    this.fromCompletedTab = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);

    final event = initialEvent ??
        events.firstWhere(
              (e) => e.id == eventId,
          orElse: () => EventModel(
            id: 'notfound',
            title: 'Event not found',
            club: '',
            posterUrl: 'assets/illustrations/not_found.png',
            shortDescription: '',
            description: 'Could not find the event.',
            dateTime: DateTime.now(),
            location: '',
          ),
        );

    return EventDetailScreen(event: event, fromCompletedTab: fromCompletedTab);
  }
}*/
