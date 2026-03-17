import 'package:flutter/material.dart';

class AppSpeedDial extends StatefulWidget {
  final VoidCallback onIncomeTap;
  final VoidCallback onExpenseTap;

  const AppSpeedDial({
    super.key,
    required this.onIncomeTap,
    required this.onExpenseTap,
  });

  @override
  State<AppSpeedDial> createState() => _AppSpeedDialState();
}

class _AppSpeedDialState extends State<AppSpeedDial> {
  bool _isOpen = false;

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// BOTÕES EXPANDIDOS
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _isOpen
              ? Row(
                  key: const ValueKey("actions"),
                  children: [
                    _ActionButton(
                      label: "Receita",
                      icon: Icons.arrow_upward,
                      color: Colors.green,
                      onTap: widget.onIncomeTap,
                    ),
                    const SizedBox(width: 8),
                    _ActionButton(
                      label: "Despesa",
                      icon: Icons.arrow_downward,
                      color: Colors.red,
                      onTap: widget.onExpenseTap,
                    ),
                    const SizedBox(width: 12),
                  ],
                )
              : const SizedBox(),
        ),

        /// FAB PRINCIPAL
        FloatingActionButton(
          onPressed: _toggle,
          child: AnimatedRotation(
            turns: _isOpen ? 0.125 : 0,
            duration: const Duration(milliseconds: 250),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}