import 'package:flutter/material.dart';
import 'package:my_cric_info/registration_screen.dart';
import 'match_screen.dart';
import 'toss_screen.dart';
import 'start_a_match.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'brain.dart';
import 'providers/teamA_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_cric_info/splash_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final scoreprovider = context.watch<ScoreProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xffFF8243),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StartAMatch()),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffFF8243),
        title: Text(
          'My Cricket Info',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Team 1 vs Team 2',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Team 1',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '${scoreprovider.score}/${scoreprovider.wickets} (10/10 Ov)',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              'Team 2',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '65/5 (6.2/10 Ov)',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TossScreen()));
            },
            child: Text('Toss Screen'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StartAMatch()));
            },
            child: Text('Start a match'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
            },
            child: Text('Welcome Screen'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Text('Login Screen'),
          ),
          MaterialButton(
            child: Text('Registration Screen'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()));
            },
          ),
          MaterialButton(
            child: Text('Match Screen'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MatchScreen()));
            },
          ),
          MaterialButton(
            child: Text('Add Ball'),
            onPressed: () {
              showOvers();
            },
          ),
          MaterialButton(
            child: Text('Splash Screen'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SplashScreen()));
            },
          ),
        ],
      ),
    );
  }
}
