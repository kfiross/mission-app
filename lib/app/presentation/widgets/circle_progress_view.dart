import 'package:flutter/material.dart';
import 'package:mission_app/app/presentation/state/progress_bloc/progress_bloc.dart';
import 'package:mission_app/core/consts/app_colors.dart';
import 'package:mission_app/core/injection_container.dart';

import 'gradient_circle_progress_painter.dart';

class CircleProgressView extends StatelessWidget {
  final double size;

  final _bloc = sl.get<ProgressBloc>();

  CircleProgressView({Key? key, this.size = 240.0}) : super(key: key) {
    _bloc.add(LoadProgressEvent());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _bloc.counterStream,
      initialData: 0,
      builder: (context, snapshot) {
        var percentValue = snapshot.data ?? 0;
        return SizedBox(
          height: size,
          width: size,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: -(size / 4) * 2,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          color: Colors.grey[200]!,
                          spreadRadius: 10)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: -(size / 4 + 4) * 2,
                child: Container(
                  width: size,
                  height: size,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Stack(
                      children: [
                        Positioned(
                            right: -(size / 4 + 8),
                            top: 0,
                            bottom: 0,
                            child: SizedBox(
                              height: size,
                              width: size,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    left: (size / 4 - 2),
                                    top: 10,
                                    bottom: 10,
                                    child: CustomPaint(
                                      foregroundPainter:
                                          GradientCircleProgressPainter(
                                        percentValue / 2,
                                        const LinearGradient(
                                            colors: [
                                              AppColors.colorProgressStart,
                                              AppColors.colorProgressEnd,
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter),
                                      ),
                                      child: const SizedBox(
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Image.asset(
                                      'assets/images/progress.png',
                                      color: Colors.grey[50],
                                    ),
                                  ),
                                  Positioned(
                                    left: size * 0.15,
                                    top: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Container(
                                        height: 64,
                                        width: 64,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Colors.grey[300]!,
                                              spreadRadius: 2,
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Align(
                                            child: Text(
                                              "$percentValue%",
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            alignment: Alignment.centerRight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
