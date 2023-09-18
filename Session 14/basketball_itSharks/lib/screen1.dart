import 'package:flutter/material.dart';

class BasketBallScreen extends StatefulWidget {
  const BasketBallScreen({Key? key}) : super(key: key);

  @override
  State<BasketBallScreen> createState() => _BasketBallScreenState();
}

class _BasketBallScreenState extends State<BasketBallScreen> {
  int counterTeamA = 0;
  int counterTeamB = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/basketball.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.black12,
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        const Text(
                          'Team A',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '$counterTeamA',
                              style: const TextStyle(
                                fontSize: 150,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              counterTeamA++;
                            });
                          },
                          child: Text(
                            'Add 1 point',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.orange,
                          minWidth: 120,
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              counterTeamA += 2;
                            });
                          },
                          child: Text(
                            'Add 2 point',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.orange,
                          minWidth: 120,
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              counterTeamA += 3;
                            });
                          },
                          child: Text(
                            'Add 3 point',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.orange,
                          minWidth: 120,
                        ),
                        Spacer(
                          flex: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        Text(
                          'Team B',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '$counterTeamB',
                              style: const TextStyle(
                                fontSize: 150,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              counterTeamB++;
                            });
                          },
                          child: Text(
                            'Add 1 point',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.orange,
                          minWidth: 120,
                        ),
                        Spacer(flex: 5,),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              counterTeamB += 2;
                            });
                          },
                          child: Text(
                            'Add 2 point',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.orange,
                          minWidth: 120,
                        ),
                        Spacer(flex: 5,),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              counterTeamB += 3;
                            });
                          },
                          child: Text(
                            'Add 3 point',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.orange,
                          minWidth: 120,
                        ),
                        Spacer(
                          flex: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    counterTeamA = counterTeamB = 0;
                  });
                },
                child: Text(
                  'Rest',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.orange,
                minWidth: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
