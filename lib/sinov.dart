import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  int playerball = 0;
  int computerball = 0;
  String winner = "";
  List<List<String>> grid = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF20B2AA),
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "Player $playerball : $computerball Computer",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "$winner winner!!!",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.amber,
            height: 308,
            width: 308,
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                for (int i = 0; i < 3; i++)
                  for (int j = 0; j < 3; j++)
                    GetContainer(
                      value: grid[i][j],
                      onTap: () {
                        setState(() {
                          if (grid[i][j].isEmpty) {
                            grid[i][j] = "X"; // Or "O" depending on current player
                          }
                        });
                      },
                    ),
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          InkWell(
            splashColor: const Color(0XFF20B2AA),
            onTap: () {
              // Implement New Game logic
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 312,
              color: const Color(0XFF008B8B),
              child: const Text(
                "New Game",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            splashColor: const Color(0XFF20B2AA),
            onTap: () {
              // Implement Reset Game logic
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 312,
              color: const Color(0XFF008B8B),
              child: const Text(
                "Reset Game",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class GetContainer extends StatelessWidget {
  final String value;
  final VoidCallback onTap;

  const GetContainer({
    required this.value,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Color(0XFF20B2AA),
        ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  }
}
