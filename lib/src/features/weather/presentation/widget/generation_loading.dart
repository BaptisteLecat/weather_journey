import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherjourney/src/features/weather/domain/generation/generation.dart';

enum GenerationStage {
  scanning,
  generating,
  making,
}

class GenerationLoading extends ConsumerStatefulWidget {
  final Generation? generation;
  const GenerationLoading({Key? key, this.generation}) : super(key: key);

  @override
  ConsumerState<GenerationLoading> createState() => _GenerationLoadingState();
}

class _GenerationLoadingState extends ConsumerState<GenerationLoading>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  List<Widget> _progressIndicators = [];
  final List<String> _titleTexts = [
    "Scanning the sky",
    "Generating the prompt",
    "Making your landscape"
  ];
  final List<String> _bodyTexts = [
    "We are scanning the sky to identify weather conditions in your location",
    "We are generating the prompt for MidJourney based on the weather conditions",
    "We are making your landscape, please wait a moment"
  ];
  GenerationStage _generationStage = GenerationStage.scanning;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 400),
    )..repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _updateGenerationStage({required Generation? generation}) {
    if (generation == null) {
      _generationStage = GenerationStage.scanning;
    } else if (generation.progress == 0) {
      _generationStage = GenerationStage.generating;
    } else {
      _generationStage = GenerationStage.making;
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    _colorAnimation = ColorTween(
      begin: Theme.of(context).primaryColor,
      end: Theme.of(context).primaryColor.withOpacity(0.6),
    ).animate(_animationController);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _updateGenerationStage(generation: widget.generation);
    _progressIndicators = List.generate(
      3,
      (index) => Expanded(
        child: Container(
            height: 12,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: (index == _generationStage.index)
                ? AnimatedBuilder(
                    animation: _colorAnimation,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _colorAnimation.value,
                        ),
                      );
                    },
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: (index < _generationStage.index)
                          ? Theme.of(context).primaryColor
                          : Colors.grey[300],
                    ),
                  )),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${(widget.generation?.progress != null) ? widget.generation!.progress : 0}%",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              for (int i = 0; i < _progressIndicators.length; i++)
                _progressIndicators[i],
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _titleTexts[_generationStage.index],
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 6,
                    child: Text(
                      _bodyTexts[_generationStage.index],
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
