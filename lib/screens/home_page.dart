import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _TrickSelectorState createState() => _TrickSelectorState();
}

class _TrickSelectorState extends State<HomePage> {
  final List<String> beginnerTricks = [
    'Ollie',
    'Kickflip',
    'Heelflip',
    'Manual',
    '50-50 Grind',
    'Strawberry Milkshake'
  ];

  final List<String> intermediateTricks = [
    'Pop Shove-it',
    'Frontside 180',
    'Backside 180',
    'Backside Boardslide',
    'Nollie',
    'Ollie North',
    'Frontside Pop Shove-it'
    'Fakie Ollie',
    'Fakie Pop Shove-It',
    'Rock-To-Fakie'
  ];

  final List<String> advancedTricks = [
      'Tre-Flip',
      'Fronside Boardslide',
      'Frontside Flip',
      'Boardslide',
      'Nollie Flip',
      'Switch Heelflip',
      'Blunt Slide',
      'Smith Grind',
      'Varial Heelflip',
      'Hardflip'

    ];


  List<String> selectedTricks = [];

  String selectedExperience = 'Beginner';
  String selectedTrick = '';

  void _selectExperience(String experience) {
    setState(() {
      selectedExperience = experience;
      selectedTrick = '';
    });
  }

    void _selectTrick() {
        setState(() {
          List<String> tricksList;
          switch (selectedExperience) {
            case 'Beginner':
              tricksList = beginnerTricks;
              break;
            case 'Intermediate':
              tricksList = intermediateTricks;
              break;
            case 'Advanced':
              tricksList = advancedTricks;
              break;
            default:
              tricksList = beginnerTricks; // Default to beginner tricks
          }
          selectedTrick = tricksList[Random().nextInt(tricksList.length)];
        });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skateboard Trick Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedExperience,
              items: <String>['Beginner', 'Intermediate', 'Advanced'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: _selectExperience,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectTrick();
              },
              child: Text('Generate Trick'),
            ),
            SizedBox(height: 20),
            selectedTrick.isEmpty
                ? Text('Select an experience and tap the button to generate a trick.')
                : Text(
                    'Random $selectedExperience Trick: $selectedTrick',
                    style: TextStyle(fontSize: 16),
                  ),
          ],
        ),
      ),
    );
  }
}