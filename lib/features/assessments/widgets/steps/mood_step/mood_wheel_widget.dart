import 'package:auralys/features/assessments/widgets/steps/mood_step/mood_painter.dart';
import 'package:flutter/material.dart';

class MoodWheelWidget extends StatefulWidget {
  const MoodWheelWidget({super.key});

  @override
  State<MoodWheelWidget> createState() => _MoodWheelWidgetState();
}

class _MoodWheelWidgetState extends State<MoodWheelWidget> {
  int _selectedIndex = 2;
  final FixedExtentScrollController _controller = FixedExtentScrollController(
    initialItem: 52,
  );

  // Mood data
  final List<String> _moodEmojis = ['😢', '😔', '😐', '😊', '😄'];
  final List<String> _moodLabels = ['Terrible', 'Sad', 'Okay', 'Good', 'Amazing'];
  final List<Color> _moodColors = [
    const Color(0xFF8B5CF6), // Purple
    const Color(0xFF06B6D4), // Cyan
    const Color(0xFF10B981), // Emerald
    const Color(0xFFF59E0B), // Amber
    const Color(0xFFEF4444), // Red
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        // Current mood display
        Text(
          "I Feel ${_moodLabels[_selectedIndex]}",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Selected emoji
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _moodColors[_selectedIndex].withOpacity(0.1),
          ),
          child: Center(
            child: Text(
              _moodEmojis[_selectedIndex],
              style: const TextStyle(fontSize: 80),
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Pointer
        Icon(
          Icons.keyboard_arrow_down,
          size: 48,
          color: theme.colorScheme.primary,
        ),
        
        // Mood wheel
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 240),
              child: OverflowBox(
                maxWidth: 1000,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: ListWheelScrollView(
                    physics: const FixedExtentScrollPhysics(),
                    renderChildrenOutsideViewport: true,
                    clipBehavior: Clip.none,
                    controller: _controller,
                    offAxisFraction: -3.5,
                    squeeze: 1.054,
                    itemExtent: 220,
                    children: _generateWheelItems(),
                  ),
                ),
              ),
            ),
            
            // Wheel selector indicator
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final newIndex = ((_controller.offset) / 220).round() % 5;
      if (newIndex != _selectedIndex) {
        setState(() {
          _selectedIndex = newIndex;
        });
      }
    });
  }

  List<Widget> _generateWheelItems() {
    final base = List.generate(5, (index) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 200,
            child: CustomPaint(
              key: Key(index.toString()),
              painter: MoodPainter(color: _moodColors[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                _moodEmojis[index],
                style: const TextStyle(fontSize: 80),
              ),
            ),
          ),
        ],
      );
    });
    
    // Repeat the widgets to simulate an infinite wheel
    return List.generate(100, (_) => base).expand((e) => e).toList();
  }
}
