import 'package:flutter/material.dart';

class AnimatedDropdownField extends StatefulWidget {
  final List<String> items;
  final String? value;
  final String? title;
  final ValueChanged<String?> onChanged;

  const AnimatedDropdownField({
    super.key,
    required this.items,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  @override
  State<AnimatedDropdownField> createState() => _AnimatedDropdownFieldState();
}

class _AnimatedDropdownFieldState extends State<AnimatedDropdownField>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void didUpdateWidget(covariant AnimatedDropdownField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      setState(() {});
    }
  }

  void toggle() async {
    setState(() {
      isExpanded = !isExpanded;
      isExpanded ? _controller.forward() : _controller.reverse();
    });

    if (isExpanded) {
      await Future.delayed(const Duration(milliseconds: 50));
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: toggle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: Radius.circular(isExpanded ? 0 : 12),
                  bottomRight: Radius.circular(isExpanded ? 0 : 12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.value ?? widget.title ?? 'یک گزینه را انتخاب کنید',
                    style: TextStyle(
                      fontFamily: 'CM',
                      fontSize: 14,
                      color: widget.value == null ? Colors.grey : Colors.black,
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(isExpanded ? 12 : 0),
              bottomRight: Radius.circular(isExpanded ? 12 : 0),
            ),
            child: SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1,
              child: Container(
                color: Colors.grey.withOpacity(0.04),
                child: ListView(
                  controller: _scrollController,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (final item in widget.items)
                      InkWell(
                        onTap: () {
                          widget.onChanged(item);
                          toggle();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Center(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontFamily: 'CM',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
