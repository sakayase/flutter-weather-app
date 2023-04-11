import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/states/location.dart';
import 'package:weather_app/foundation/utils.dart';
import 'package:weather_app/presentation/ui/forecast_page.dart';
import 'package:weather_app/presentation/ui/weather_page.dart';

@RoutePage()
class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<NavigationView> allPagesView = [
    NavigationView(view: const WeatherPage(), index: 0, title: 'Météo'),
    NavigationView(view: const ForecastPage(), index: 1, title: 'Prévisions')
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<LocationState>().findLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary
          ],
          center: Alignment.topRight,
          radius: 3.7,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(allPagesView[selectedIndex].title),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          destinations: [
            NavigationDestination(
                icon: const Icon(Icons.today), label: allPagesView[0].title),
            NavigationDestination(
                icon: const Icon(Icons.calendar_month),
                label: allPagesView[1].title),
          ],
          onDestinationSelected: (int newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
        ),
        body: Stack(
          children: allPagesView
              .map((navigationView) => Offstage(
                    offstage: navigationView.index != selectedIndex,
                    child: navigationView.view,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
