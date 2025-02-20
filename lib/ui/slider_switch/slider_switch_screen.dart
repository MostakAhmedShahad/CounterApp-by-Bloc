import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliderSwitchScreen extends StatefulWidget {
  const SliderSwitchScreen({super.key});

  @override
  State<SliderSwitchScreen> createState() => _SliderSwitchScreenState();
}

class _SliderSwitchScreenState extends State<SliderSwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification"),
                Switch(value: true, onChanged: (newValue) {}),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.red.withOpacity(.95),
              
              
            ),

            Slider(value: .4, onChanged: (value){})
          ],
        ),
      ),
    );
  }
}
