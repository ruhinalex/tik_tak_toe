import 'package:flutter/material.dart';

import 'components/AndaBlock.dart';
import 'components/CrossBlock.dart';
import 'components/EmptyBlock.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCrossTurn = true;

  // 0 = game continue,
  // 1 = cross won
  // 2 = anda won
  // 3 = game over and tie
  int gameState = 0;
  int i = 0, j = 0;

  List<List> stateData = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  int wonCheck() {
    if (stateData[0][0] + stateData[0][1] + stateData[0][2] == 3 ||
        stateData[1][0] + stateData[1][1] + stateData[1][2] == 3 ||
        stateData[2][0] + stateData[2][1] + stateData[2][2] == 3 ||
        stateData[0][0] + stateData[1][0] + stateData[2][0] == 3 ||
        stateData[0][1] + stateData[1][1] + stateData[2][1] == 3 ||
        stateData[0][2] + stateData[1][2] + stateData[2][2] == 3 ||
        stateData[0][0] + stateData[1][1] + stateData[2][2] == 3 ||
        stateData[0][2] + stateData[1][1] + stateData[2][0] == 3) {
      return 1;
    } else if (stateData[0][0] + stateData[0][1] + stateData[0][2] == 15 ||
        stateData[1][0] + stateData[1][1] + stateData[1][2] == 15 ||
        stateData[2][0] + stateData[2][1] + stateData[2][2] == 15 ||
        stateData[0][0] + stateData[1][0] + stateData[2][0] == 15 ||
        stateData[0][1] + stateData[1][1] + stateData[2][1] == 15 ||
        stateData[0][2] + stateData[1][2] + stateData[2][2] == 15 ||
        stateData[0][0] + stateData[1][1] + stateData[2][2] == 15 ||
        stateData[0][2] + stateData[1][1] + stateData[2][0] == 15) {
      return 2;
    } else if (stateData[0][0] != 0 &&
        stateData[0][1] != 0 &&
        stateData[0][2] != 0 &&
        stateData[1][0] != 0 &&
        stateData[1][1] != 0 &&
        stateData[1][2] != 0 &&
        stateData[2][0] != 0 &&
        stateData[2][1] != 0 &&
        stateData[2][2] != 0) {
      return 3;
    } else {
      return 0;
    }
  }

  void fillUp(int x, int y) {
    setState(() {
      if (stateData[x][y] == 0) {
        if (isCrossTurn) {
          stateData[x][y] = 1;
          isCrossTurn = false;
        } else {
          stateData[x][y] = 5;
          isCrossTurn = true;
        }
      }
      gameState = wonCheck();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: gameState != 0
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    stateData = [
                      [0, 0, 0],
                      [0, 0, 0],
                      [0, 0, 0],
                    ];
                    gameState = 0;
                  });
                },
                child: const Icon(Icons.refresh),
              )
            : const Text(""),
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Turn of: ${isCrossTurn ? "Cross" : "Anda"}",
                          style: const TextStyle(
                            fontSize: 34.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        children: [
                          //row one
                          GestureDetector(
                            onTap: () => fillUp(0, 0),
                            child: showBlock(
                              stateData[0][0],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => fillUp(0, 1),
                            child: showBlock(
                              stateData[0][1],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => fillUp(0, 2),
                            child: showBlock(
                              stateData[0][2],
                            ),
                          ),
                          //row two
                          GestureDetector(
                            onTap: () => fillUp(1, 0),
                            child: showBlock(
                              stateData[1][0],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => fillUp(1, 1),
                            child: showBlock(
                              stateData[1][1],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => fillUp(1, 2),
                            child: showBlock(
                              stateData[1][2],
                            ),
                          ),
                          //row three
                          GestureDetector(
                            onTap: () => fillUp(2, 0),
                            child: showBlock(
                              stateData[2][0],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => fillUp(2, 1),
                            child: showBlock(
                              stateData[2][1],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => fillUp(2, 2),
                            child: showBlock(
                              stateData[2][2],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              gameState != 0
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.redAccent.withOpacity(0.8),
                      child: Center(
                        child: Text(
                          gameState == 1
                              ? "Cross Won"
                              : gameState == 2
                                  ? "Anda Won"
                                  : "Over and Tie",
                          style: const TextStyle(
                            fontSize: 44.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : const Text(""),
            ],
          ),
        ),
      ),
    );
  }
}

Widget showBlock(int state) {
  if (state == 0) {
    return const EmptyBlock();
  } else if (state == 1) {
    return const CrossBlock();
  } else {
    return const AndaBlock();
  }
}
