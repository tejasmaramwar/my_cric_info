import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_cric_info/match_screen.dart';
import 'package:my_cric_info/virtual_toss_screen.dart';
import 'providers/teamA_provider.dart';
import 'package:provider/provider.dart';
import 'providers/teamB_provider.dart';

class TossScreen extends StatelessWidget {
  const TossScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scoreprovider = context.watch<ScoreProvider>();
    final scoreproviderb = context.watch<ScoreProviderB>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF8243),
        title: Text("Toss"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Who won the toss?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MaterialButton(
                      color: scoreprovider.isTeamAselected
                          ? Colors.orange
                          : Colors.white,
                      onPressed: () {
                        scoreprovider.SelectedTeam();
                      },
                      height: 200.0,
                      child: Text('Team A'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: MaterialButton(
                      color: scoreprovider.isTeamAselected
                          ? Colors.white
                          : Colors.orange,
                      onPressed: () {
                        scoreprovider.SelectedTeam();
                      },
                      height: 200.0,
                      child: Text('Team B'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text('Winner of the toss elected to?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MaterialButton(
                      color: scoreprovider.playSelection
                          ? Colors.orange
                          : Colors.white,
                      onPressed: () {
                        scoreprovider.playSelecting();
                      },
                      height: 200.0,
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          child: Image.asset('images/bat.jpg'),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: MaterialButton(
                      color: scoreprovider.playSelection
                          ? Colors.white
                          : Colors.orange,
                      onPressed: () {
                        scoreprovider.playSelecting();
                      },
                      height: 200.0,
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          child: Image.asset('images/ball.png'),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VirtualTossScreen()));
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  child: Center(
                    child: Text(
                      'VIRTUAL TOSS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: const Color(0xff14b492),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MatchScreen()));
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Let\'s play',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
