import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/theme/app_colors.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/family_member_entity.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/ornament_divider.dart';

class FamilyArea extends StatelessWidget {
  final FamilyMemberEntity brideFamily;
  final FamilyMemberEntity groomFamily;

  const FamilyArea({super.key, required this.brideFamily, required this.groomFamily});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return screenWidth > 600
        ? desktop(screenWidth, screenHeight)
        : mobile(screenWidth);
  }

  Widget mobile(double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .1, vertical: width * .1),
      child: Column(
        children: [
          FamilyText(familyMember: brideFamily),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: OrnamentDivider(color: AppColors.goldDark, lineWidth: 10),
          ),
          FamilyText(familyMember: groomFamily),
        ],
      ),
    );
  }

  Widget desktop(double width, double height) {
    final carpan = (width / 500) / 10;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * carpan, vertical: height * (carpan / 5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FamilyText(familyMember: brideFamily),
          FamilyText(familyMember: groomFamily),
        ],
      ),
    );
  }
}

class FamilyText extends StatelessWidget {
  final FamilyMemberEntity familyMember;

  const FamilyText({required this.familyMember, super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextSubHeader(text: familyMember.father),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextSubHeader(text: '&'),
              ),
              TextSubHeader(text: familyMember.mother),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _Description(description: familyMember.description),
          ),
          TextSubHeader(
            text: familyMember.surname,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String? description;

  const _Description({required this.description});

  @override
  Widget build(BuildContext context) {
    return (description ?? '').isNotEmpty
        ? TextSubHeader(text: '(${description!})', fontSize: 12)
        : const SizedBox(height: 15);
  }
}

class TextSubHeader extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const TextSubHeader({super.key, required this.text, this.fontSize = 24, this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: AppColors.charcoal,
        fontWeight: fontWeight,
      ),
    );
  }
}
