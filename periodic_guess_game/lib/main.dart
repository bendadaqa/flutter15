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

// Animation helper and transition types
enum TransitionType { fade, slideFromRight, slideFromBottom, scale }

void animatedNavigation(BuildContext context, Widget target,
    {bool replace = false, TransitionType type = TransitionType.fade}) {
  PageRouteBuilder routeBuilder = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => target,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (type) {
        case TransitionType.slideFromRight:
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        case TransitionType.slideFromBottom:
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        case TransitionType.scale:
          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
            child: child,
          );
        case TransitionType.fade:
        default:
          return FadeTransition(
            opacity: animation,
            child: child,
          );
      }
    },
    transitionDuration: const Duration(milliseconds: 500),
  );

  if (replace) {
    Navigator.pushReplacement(context, routeBuilder);
  } else {
    Navigator.push(context, routeBuilder);
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

enum Difficulty { easy, medium, hard }

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
                const SizedBox(height: 40),
                const Text(
                  'Select Difficulty Level:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // التعديل هنا: أزرار الصعوبة في صف واحد
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizScreen(difficulty: Difficulty.easy),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('Easy', style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizScreen(difficulty: Difficulty.medium),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('Medium', style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizScreen(difficulty: Difficulty.hard),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('Hard', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
                ElevatedButton.icon(
                  icon: const Icon(Icons.table_chart),
                  label: const Text('View Periodic Table', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
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

enum QuestionType {
  atomicNumberToName,
  atomicNumberToSymbol,
  symbolToName,
  nameToSymbol,
  symbolToAtomicNumber,
  nameToAtomicNumber,
}

class QuizScreen extends StatefulWidget {
  final Difficulty difficulty;

  const QuizScreen({super.key, required this.difficulty});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int totalQuestions;
  late int secondsPerQuestion;
  late int optionsCount;
  late List<QuestionType> availableQuestionTypes;

  int currentQuestionIndex = 0;
  int score = 0;
  late ElementData currentElement;
  late List<String> options;
  bool answered = false;
  bool correctAnswerSelected = false;
  Timer? timer;
  int secondsLeft = 0;

  final Random _random = Random();
  final AudioPlayer _audioPlayer = AudioPlayer();

  late QuestionType currentQuestionType;
  QuestionType? previousQuestionType;

  @override
  void initState() {
    super.initState();
    _setupDifficultySettings();
    _loadNewQuestion();
  }

  void _setupDifficultySettings() {
    switch (widget.difficulty) {
      case Difficulty.easy:
        totalQuestions = 5;
        secondsPerQuestion = 20;
        optionsCount = 3;
        availableQuestionTypes = [
          QuestionType.atomicNumberToName,
          QuestionType.symbolToName,
          QuestionType.nameToSymbol,
        ];
        break;
      case Difficulty.medium:
        totalQuestions = 10;
        secondsPerQuestion = 15;
        optionsCount = 4;
        availableQuestionTypes = QuestionType.values.toList();
        break;
      case Difficulty.hard:
        totalQuestions = 15;
        secondsPerQuestion = 10;
        optionsCount = 4;
        availableQuestionTypes = [
          QuestionType.atomicNumberToSymbol,
          QuestionType.symbolToAtomicNumber,
          QuestionType.nameToAtomicNumber,
          QuestionType.nameToSymbol,
          QuestionType.symbolToName,
        ];
        break;
    }
    secondsLeft = secondsPerQuestion;
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
    secondsLeft = secondsPerQuestion;

    currentElement = elements[_random.nextInt(elements.length)];

    // اختيار نوع سؤال جديد يختلف عن السابق ضمن الأنواع المسموحة بالمستوى
    QuestionType newType;
    do {
      newType = availableQuestionTypes[_random.nextInt(availableQuestionTypes.length)];
    } while (newType == previousQuestionType);
    previousQuestionType = newType;
    currentQuestionType = newType;

    options = _generateOptions(currentElement, currentQuestionType);

    setState(() {});

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft == 0) {
        timer.cancel();
        _handleAnswer(null); // الوقت انتهى بدون اختيار
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  List<String> _generateOptions(ElementData correct, QuestionType qType) {
    Set<String> optionSet = {};

    String correctAnswer;
    switch (qType) {
      case QuestionType.atomicNumberToName:
      case QuestionType.symbolToName:
        correctAnswer = correct.name;
        break;
      case QuestionType.atomicNumberToSymbol:
      case QuestionType.nameToSymbol:
        correctAnswer = correct.symbol;
        break;
      case QuestionType.symbolToAtomicNumber:
      case QuestionType.nameToAtomicNumber:
        correctAnswer = correct.atomicNumber.toString();
        break;
    }

    optionSet.add(correctAnswer);

    while (optionSet.length < optionsCount) {
      ElementData e = elements[_random.nextInt(elements.length)];
      String option;
      switch (qType) {
        case QuestionType.atomicNumberToName:
        case QuestionType.symbolToName:
          option = e.name;
          break;
        case QuestionType.atomicNumberToSymbol:
        case QuestionType.nameToSymbol:
          option = e.symbol;
          break;
        case QuestionType.symbolToAtomicNumber:
        case QuestionType.nameToAtomicNumber:
          option = e.atomicNumber.toString();
          break;
      }
      optionSet.add(option);
    }

    List<String> opts = optionSet.toList();
    opts.shuffle();
    return opts;
  }

  void _handleAnswer(String? selected) {
    if (answered) return;

    answered = true;
    timer?.cancel();

    String correctAnswer;
    switch (currentQuestionType) {
      case QuestionType.atomicNumberToName:
      case QuestionType.symbolToName:
        correctAnswer = currentElement.name;
        break;
      case QuestionType.atomicNumberToSymbol:
      case QuestionType.nameToSymbol:
        correctAnswer = currentElement.symbol;
        break;
      case QuestionType.symbolToAtomicNumber:
      case QuestionType.nameToAtomicNumber:
        correctAnswer = currentElement.atomicNumber.toString();
        break;
    }

    if (selected != null && selected == correctAnswer) {
      score++;
      correctAnswerSelected = true;
      _playCorrectSound();
    } else {
      correctAnswerSelected = false;
      _playWrongSound();
    }

    setState(() {});

    Future.delayed(const Duration(seconds: 3), () {
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (answered) {
                String correctAnswer;
                switch (currentQuestionType) {
                  case QuestionType.atomicNumberToName:
                  case QuestionType.symbolToName:
                    correctAnswer = currentElement.name;
                    break;
                  case QuestionType.atomicNumberToSymbol:
                  case QuestionType.nameToSymbol:
                    correctAnswer = currentElement.symbol;
                    break;
                  case QuestionType.symbolToAtomicNumber:
                  case QuestionType.nameToAtomicNumber:
                    correctAnswer = currentElement.atomicNumber.toString();
                    break;
                }
                if (option == correctAnswer) {
                  return Colors.green;
                } else if (option != correctAnswer) {
                  return Colors.red;
                }
              }
              return null;
            },
          ),
        ),
        onPressed: answered ? null : () => _handleAnswer(option),
        child: Text(option, style: const TextStyle(fontSize: 18)),
      ),
    );
  }

  String _buildQuestionText() {
    switch (currentQuestionType) {
      case QuestionType.atomicNumberToName:
        return 'What is the name of the element with atomic number ${currentElement.atomicNumber}?';
      case QuestionType.atomicNumberToSymbol:
        return 'What is the symbol of the element with atomic number ${currentElement.atomicNumber}?';
      case QuestionType.symbolToName:
        return 'What is the name of the element with symbol "${currentElement.symbol}"?';
      case QuestionType.nameToSymbol:
        return 'What is the symbol of the element named "${currentElement.name}"?';
      case QuestionType.symbolToAtomicNumber:
        return 'What is the atomic number of the element with symbol "${currentElement.symbol}"?';
      case QuestionType.nameToAtomicNumber:
        return 'What is the atomic number of the element named "${currentElement.name}"?';
    }
  }

  String _questionTypeLabel() {
    switch (currentQuestionType) {
      case QuestionType.atomicNumberToName:
        return "Identify by Atomic Number → Name";
      case QuestionType.atomicNumberToSymbol:
        return "Identify by Atomic Number → Symbol";
      case QuestionType.symbolToName:
        return "Identify by Symbol → Name";
      case QuestionType.nameToSymbol:
        return "Identify by Name → Symbol";
      case QuestionType.symbolToAtomicNumber:
        return "Identify by Symbol → Atomic Number";
      case QuestionType.nameToAtomicNumber:
        return "Identify by Name → Atomic Number";
    }
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
              const SizedBox(height: 8),
              Text(
                _questionTypeLabel(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                _buildQuestionText(),
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
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
                  '$score / $total',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.indigo),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Play Again'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MenuScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.table_chart),
                  label: const Text('View Periodic Table'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const PeriodicTableScreen()),
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
          padding: const EdgeInsets.all(8),
          itemCount: elements.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 9,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final element = elements[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('${element.name} (${element.symbol})'),
                      content: Text('Atomic Number: ${element.atomicNumber}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        )
                      ],
                    ),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        element.atomicNumber.toString(),
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        element.symbol,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
                      ),
                      Text(
                        element.name,
                        style: const TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}