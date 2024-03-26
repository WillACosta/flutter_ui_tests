import 'package:flutter/material.dart';

class HeadsetToggleView extends StatefulWidget {
  const HeadsetToggleView({super.key});

  @override
  State<HeadsetToggleView> createState() => _HeadsetToggleViewState();
}

class _HeadsetToggleViewState extends State<HeadsetToggleView> {
  bool _isOn = false;

  void _toggleHeadphone() {
    setState(() {
      _isOn = !_isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Flutter UI Tests Showcase',
                style: TextStyle(fontSize: 33),
              ),
              const SizedBox(height: 16),
              Text(
                'Tap the button to turn on and off your headset',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: 40),
              HeadsetButton(
                onTap: _toggleHeadphone,
                isTurnOn: _isOn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadsetButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isTurnOn;

  const HeadsetButton({
    super.key,
    required this.onTap,
    required this.isTurnOn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(25),
          splashColor: Theme.of(context).colorScheme.tertiaryContainer,
          child: Icon(
            isTurnOn ? Icons.headset : Icons.headset_off,
            size: 35,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
      ),
    );
  }
}
