import 'package:flutter/material.dart';
import 'package:my_cric_info/toss_screen.dart';
import 'providers/teamA_provider.dart';
import 'package:provider/provider.dart';
import 'providers/teamB_provider.dart';

class StartAMatch extends StatefulWidget {
  const StartAMatch({Key? key}) : super(key: key);

  @override
  State<StartAMatch> createState() => _StartAMatchState();
}

class _StartAMatchState extends State<StartAMatch> {
  List<String> matchTypeItems = <String>['Limited Overs', 'Test Match'];
  String matchType = 'Limited Overs';

  List<String> ballTypeItems = <String>[
    'Tennis Ball',
    'Leather Ball',
    'Rubber Ball'
  ];
  String ballType = 'Tennis Ball';

  @override
  Widget build(BuildContext context) {
    final scoreprovider = context.watch<ScoreProvider>();
    final scoreproviderb = context.watch<ScoreProviderB>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Start A Match'),
        backgroundColor: Color(0xffFF8243),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Match Type', style: TextStyle(fontSize: 16.0)),
                      DropdownButton<String>(
                        value: matchType,
                        items: matchTypeItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        iconSize: 25,
                        elevation: 16,
                        // isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            matchType = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  TextField(
                    onChanged: (value) {
                      scoreprovider.totalover(int.parse(value));
                      scoreproviderb.totalover(int.parse(value));
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'No. of Overs',
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Overs per bowler',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      scoreprovider.City(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'City / Town',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      scoreprovider.Ground(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Ground',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      scoreprovider.Datetime(value);
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Date and Time',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Ball Type', style: TextStyle(fontSize: 16.0)),
                      DropdownButton<String>(
                        value: ballType,
                        items: ballTypeItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        iconSize: 25,
                        elevation: 16,
                        // isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            ballType = newValue!;
                          });
                        },
                      ),
                    ],
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
              color: Color(0xff14b492),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TossScreen()));
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  child: Center(
                    child: Text(
                      'NEXT(TOSS)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
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
