import 'package:breaking_app/presentation/views/Character_details_view.dart';
import 'package:breaking_app/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const KHomeView = '/';
  static const KcharacterdetailsView = '/KcharacterdetailsView';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: KHomeView,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: KcharacterdetailsView,
      builder: (context, state) => CharacterDetailsView(),
    )
  ]);
}
