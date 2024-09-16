import 'dart:math';
import 'package:flutter/material.dart';
import 'package:decision_maker/getLists.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formGlobalKey = GlobalKey<FormState>();

  String _decision = '';
  
  String _optDecision = "your decision will be shown here";

  List <String> ls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a Decision!!!'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: decisionList(ls: ls)),
            
            Center(
              child: Text(_optDecision),
            ),
        
            Form(
              key: _formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  TextFormField(
                    maxLength: 20,
                    decoration: const InputDecoration(
                      label: Text('Decision')
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'You must enter a value for the title.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _decision = value!;
                    }
                  ),

                  // submit button
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      if (_formGlobalKey.currentState!.validate()) {
                        _formGlobalKey.currentState!.save();

                        // add new decision
                        setState(() {
                          ls.add(_decision);
                        });

                        _formGlobalKey.currentState!.reset();
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text('Add'),
                  ),
                  
                  FilledButton(
                    onPressed: () {
                      // add new decision
                      setState(() {
                        if (ls.length == 0)
                        {
                          _optDecision = "Enter a few decisions first";
                          return;
                        }
                        int p = Random().nextInt(ls.length);
                        _optDecision = ls[p];
                      });
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text('Make a decision'),
                  )
                ],
              ), 
            ),

            
            
          ],
        ),
      ),
    );
  }
}