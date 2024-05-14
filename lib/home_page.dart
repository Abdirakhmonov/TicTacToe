import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List continers;
  int x_point = 0;
  int o_point = 0;
  String winner = "";
  int chance = 0;
   late String currentPlayer;


  void replaceLetter(int index) {
    setState(() {
      if (continers[index].isEmpty) {
        continers[index] = currentPlayer;
        chance++;
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    });

    String? winner2 = checkWinner();
    if(winner2 != null){
      setState(() {
        winner = "$winner2 winner!!!";
        updateWinCount(winner2);
      });
    }else if(chance == 9){
      winner = "Draw!";
    }
  }

  String? checkWinner() {
    List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for (var condition in winConditions) {
      if (continers[condition[0]] != '' &&
          continers[condition[0]] == continers[condition[1]] &&
          continers[condition[1]] == continers[condition[2]]) {
        return continers[condition[0]];
      }
    }

    return null;
  }

  void updateWinCount(String winner) {
    if (winner == 'X') {
      setState(() {
        x_point++;
      });
    } else if (winner == 'O') {
      setState(() {
        o_point++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    setState(() {
      continers = List.filled(9, '');
      currentPlayer = 'X';
      chance = 0;
      winner = "";
    });
  }

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
            "(X)    $x_point : $o_point    (O)",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 42),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "$winner",
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
              children: List.generate(9, (index) {
                return GetContainer(
                  text: continers[index],
                  onTap: () {
                    if (checkWinner() == null) {
                      replaceLetter(index);
                    }
                  },
                );
              }),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          InkWell(
            onTap: (){
              setState(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage()),
                );
              });
            },
            splashColor: const Color(0XFF20B2AA),
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
            onTap: (){
                resetGame();
            },
            splashColor: const Color(0XFF20B2AA),
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

  final String text;
  final VoidCallback onTap;

  const GetContainer({required this.text, required this.onTap});

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
          text,
          style: const TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}


