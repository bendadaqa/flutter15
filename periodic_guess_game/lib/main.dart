import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const PeriodicQuizApp());
}

class PeriodicQuizApp extends StatelessWidget {
  const PeriodicQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Periodic Table Quiz',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
          headlineMedium: TextStyle(color: Colors.black87),
          bodyLarge: TextStyle(color: Colors.black87),
          headlineSmall: TextStyle(color: Colors.indigo),
        ),
      ),
      home: const MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ElementData {
  final int atomicNumber;
  final String symbol;
  final String name;

  ElementData(this.atomicNumber, this.symbol, this.name);
}

final List<ElementData> elements = [
  ElementData(1, "H", "Hydrogen"),
  ElementData(2, "He", "Helium"),
  ElementData(3, "Li", "Lithium"),
  ElementData(4, "Be", "Beryllium"),
  ElementData(5, "B", "Boron"),
  ElementData(6, "C", "Carbon"),
  ElementData(7, "N", "Nitrogen"),
  ElementData(8, "O", "Oxygen"),
  ElementData(9, "F", "Fluorine"),
  ElementData(10, "Ne", "Neon"),
  ElementData(11, "Na", "Sodium"),
  ElementData(12, "Mg", "Magnesium"),
  ElementData(13, "Al", "Aluminium"),
  ElementData(14, "Si", "Silicon"),
  ElementData(15, "P", "Phosphorus"),
  ElementData(16, "S", "Sulfur"),
  ElementData(17, "Cl", "Chlorine"),
  ElementData(18, "Ar", "Argon"),
  ElementData(19, "K", "Potassium"),
  ElementData(20, "Ca", "Calcium"),
  ElementData(21, "Sc", "Scandium"),
  ElementData(22, "Ti", "Titanium"),
  ElementData(23, "V", "Vanadium"),
  ElementData(24, "Cr", "Chromium"),
  ElementData(25, "Mn", "Manganese"),
  ElementData(26, "Fe", "Iron"),
  ElementData(27, "Co", "Cobalt"),
  ElementData(28, "Ni", "Nickel"),
  ElementData(29, "Cu", "Copper"),
  ElementData(30, "Zn", "Zinc"),
  ElementData(31, "Ga", "Gallium"),
  ElementData(32, "Ge", "Germanium"),
  ElementData(33, "As", "Arsenic"),
  ElementData(34, "Se", "Selenium"),
  ElementData(35, "Br", "Bromine"),
  ElementData(36, "Kr", "Krypton"),
  ElementData(37, "Rb", "Rubidium"),
  ElementData(38, "Sr", "Strontium"),
  ElementData(39, "Y", "Yttrium"),
  ElementData(40, "Zr", "Zirconium"),
  ElementData(41, "Nb", "Niobium"),
  ElementData(42, "Mo", "Molybdenum"),
  ElementData(43, "Tc", "Technetium"),
  ElementData(44, "Ru", "Ruthenium"),
  ElementData(45, "Rh", "Rhodium"),
  ElementData(46, "Pd", "Palladium"),
  ElementData(47, "Ag", "Silver"),
  ElementData(48, "Cd", "Cadmium"),
  ElementData(49, "In", "Indium"),
  ElementData(50, "Sn", "Tin"),
  ElementData(51, "Sb", "Antimony"),
  ElementData(52, "Te", "Tellurium"),
  ElementData(53, "I", "Iodine"),
  ElementData(54, "Xe", "Xenon"),
  ElementData(55, "Cs", "Cesium"),
  ElementData(56, "Ba", "Barium"),
  ElementData(57, "La", "Lanthanum"),
  ElementData(58, "Ce", "Cerium"),
  ElementData(59, "Pr", "Praseodymium"),
  ElementData(60, "Nd", "Neodymium"),
  ElementData(61, "Pm", "Promethium"),
  ElementData(62, "Sm", "Samarium"),
  ElementData(63, "Eu", "Europium"),
  ElementData(64, "Gd", "Gadolinium"),
  ElementData(65, "Tb", "Terbium"),
  ElementData(66, "Dy", "Dysprosium"),
  ElementData(67, "Ho", "Holmium"),
  ElementData(68, "Er", "Erbium"),
  ElementData(69, "Tm", "Thulium"),
  ElementData(70, "Yb", "Ytterbium"),
  ElementData(71, "Lu", "Lutetium"),
  ElementData(72, "Hf", "Hafnium"),
  ElementData(73, "Ta", "Tantalum"),
  ElementData(74, "W", "Tungsten"),
  ElementData(75, "Re", "Rhenium"),
  ElementData(76, "Os", "Osmium"),
  ElementData(77, "Ir", "Iridium"),
  ElementData(78, "Pt", "Platinum"),
  ElementData(79, "Au", "Gold"),
  ElementData(80, "Hg", "Mercury"),
  ElementData(81, "Tl", "Thallium"),
  ElementData(82, "Pb", "Lead"),
  ElementData(83, "Bi", "Bismuth"),
  ElementData(84, "Po", "Polonium"),
  ElementData(85, "At", "Astatine"),
  ElementData(86, "Rn", "Radon"),
  ElementData(87, "Fr", "Francium"),
  ElementData(88, "Ra", "Radium"),
  ElementData(89, "Ac", "Actinium"),
  ElementData(90, "Th", "Thorium"),
  ElementData(91, "Pa", "Protactinium"),
  ElementData(92, "U", "Uranium"),
  ElementData(93, "Np", "Neptunium"),
  ElementData(94, "Pu", "Plutonium"),
  ElementData(95, "Am", "Americium"),
  ElementData(96, "Cm", "Curium"),
  ElementData(97, "Bk", "Berkelium"),
  ElementData(98, "Cf", "Californium"),
  ElementData(99, "Es", "Einsteinium"),
  ElementData(100, "Fm", "Fermium"),
  ElementData(101, "Md", "Mendelevium"),
  ElementData(102, "No", "Nobelium"),
  ElementData(103, "Lr", "Lawrencium"),
  ElementData(104, "Rf", "Rutherfordium"),
  ElementData(105, "Db", "Dubnium"),
  ElementData(106, "Sg", "Seaborgium"),
  ElementData(107, "Bh", "Bohrium"),
  ElementData(108, "Hs", "Hassium"),
  ElementData(109, "Mt", "Meitnerium"),
  ElementData(110, "Ds", "Darmstadtium"),
  ElementData(111, "Rg", "Roentgenium"),
  ElementData(112, "Cn", "Copernicium"),
  ElementData(113, "Nh", "Nihonium"),
  ElementData(114, "Fl", "Flerovium"),
  ElementData(115, "Mc", "Moscovium"),
  ElementData(116, "Lv", "Livermorium"),
  ElementData(117, "Ts", "Tennessine"),
  ElementData(118, "Og", "Oganesson"),
];

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('Periodic Table Quiz')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the Periodic Table Quiz!',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start Quiz', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.table_chart),
                  label: const Text('View Periodic Table', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PeriodicTableScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.info_outline),
                  label: const Text('About', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'Periodic Table Quiz',
                      applicationVersion: '1.0.0',
                      applicationIcon: const Icon(Icons.science, size: 40),
                      children: const [
                        Text(
                          'Test your knowledge of the periodic table! Try to guess the correct element based on its atomic number and symbol.',
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final int totalQuestions = 10;
  int currentQuestionIndex = 0;
  int score = 0;
  late ElementData currentElement;
  late List<String> options;
  bool answered = false;
  bool correctAnswerSelected = false;
  Timer? timer;
  int secondsLeft = 15;

  final Random _random = Random();
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadNewQuestion();
  }

  void _playCorrectSound() {
    _audioPlayer.play(AssetSource('sounds/correct.mp3'));
  }

  void _playWrongSound() {
    _audioPlayer.play(AssetSource('sounds/wrong.mp3'));
  }

  void _loadNewQuestion() {
    if (currentQuestionIndex >= totalQuestions) {
      _endQuiz();
      return;
    }

    answered = false;
    correctAnswerSelected = false;
    secondsLeft = 15;

    currentElement = elements[_random.nextInt(elements.length)];
    options = _generateOptions(currentElement);

    setState(() {});

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft == 0) {
        timer.cancel();
        _handleAnswer(null); // time over
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  List<String> _generateOptions(ElementData correct) {
    Set<String> optionSet = {correct.name};
    while (optionSet.length < 4) {
      ElementData e = elements[_random.nextInt(elements.length)];
      optionSet.add(e.name);
    }
    List<String> opts = optionSet.toList();
    opts.shuffle();
    return opts;
  }

  void _handleAnswer(String? selected) {
    if (answered) return;

    answered = true;
    timer?.cancel();

    if (selected != null && selected == currentElement.name) {
      score++;
      correctAnswerSelected = true;
      _playCorrectSound();
    } else {
      correctAnswerSelected = false;
      _playWrongSound();
    }

    setState(() {});

    Future.delayed(const Duration(seconds: 2), () {
      currentQuestionIndex++;
      if (currentQuestionIndex < totalQuestions) {
        _loadNewQuestion();
      } else {
        _endQuiz();
      }
    });
  }

  void _endQuiz() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(score: score, total: totalQuestions),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget _buildOptionButton(String option) {
    // Removed green/red colors for correct/wrong answers
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: answered ? null : () => _handleAnswer(option),
        child: Text(option, style: const TextStyle(fontSize: 18)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Question ${currentQuestionIndex + 1} of $totalQuestions'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                value: (currentQuestionIndex + 1) / totalQuestions,
                color: Colors.indigo,
                backgroundColor: Colors.indigo.shade100,
              ),
              const SizedBox(height: 24),
              Text(
                'What is the name of the element with:',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Atomic Number: ${currentElement.atomicNumber}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Symbol: ${currentElement.symbol}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              ...options.map(_buildOptionButton),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Score: $score',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Time Left: $secondsLeft s',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    double percent = (score / total) * 100;
    String message;
    if (percent == 100) {
      message = "Excellent! You're a periodic table expert!";
    } else if (percent >= 70) {
      message = "Great job! You know the elements well.";
    } else if (percent >= 40) {
      message = "Not bad! Keep practicing.";
    } else {
      message = "Keep learning! The periodic table is fun!";
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('Quiz Result')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Score',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  '$score out of $total',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.indigo),
                ),
                const SizedBox(height: 20),
                Text(
                  message,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Play Again', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.home),
                  label: const Text('Back to Menu', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MenuScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PeriodicTableScreen extends StatelessWidget {
  const PeriodicTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('Periodic Table')),
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 9,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 1.2,
          ),
          itemCount: elements.length,
          itemBuilder: (context, index) {
            final element = elements[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.indigo.shade100,
                border: Border.all(color: Colors.indigo),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    element.atomicNumber.toString(),
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    element.symbol,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    element.name,
                    style: const TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
