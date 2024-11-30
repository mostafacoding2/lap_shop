import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable
{
  final String image;
  final String body;
  final String? secondBody;
  final String numberScreen ;

  const OnBoardingModel( {
    required this.numberScreen,
    required this.image,
    required this.body,
    this.secondBody,
  });

  @override
  List<Object?> get props =>
      [ numberScreen,
        image,
        body,
        secondBody,
      ];
}