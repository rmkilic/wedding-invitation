import 'package:flutter/material.dart';
import 'package:wedding_invidatiton/core/extensions/context_extensions.dart';
import 'package:wedding_invidatiton/core/theme/app_theme.dart';
import 'package:wedding_invidatiton/features/invitation/domain/entities/family_member_entity.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/animated_reveal.dart';
import 'package:wedding_invidatiton/features/invitation/presentation/widgets/common/ornament_divider.dart';

class MessageSection extends StatelessWidget {
  final String message;
  final FamilyMemberEntity brideFamily;
  final FamilyMemberEntity groomFamily;

  const MessageSection({required this.message, required this.brideFamily, required this.groomFamily, super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //color: AppColors.warmCream,
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 40),
      child: AnimatedReveal(
        child: Column(
          children: [
           // OrnamentDivider(color: AppColors.goldDark),
            const SizedBox(height: 40),

            const Text(
              '“',
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 72,
                color: AppColors.goldDark,
                height: 0.6,
              ),
            ),

            const SizedBox(height: 28),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.screenWidth*.1),
              child: Text(
                message,
                style: const TextStyle(
                  fontFamily: 'Georgia',
                  color: AppColors.darkSection,
              
                  fontSize: 24
                ), //AppTextStyles.messageText,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.gold,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.deepRose,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: AppColors.gold,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
            OrnamentDivider(color: AppColors.goldDark),

            FamilyArea(brideFamily: brideFamily, groomFamily: groomFamily,)

           
          ],
        ),
      ),
    );
  }
}

class FamilyArea extends StatelessWidget {
  final FamilyMemberEntity brideFamily;
  final FamilyMemberEntity groomFamily;
  const FamilyArea({super.key, required this.brideFamily, required this.groomFamily});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return context.screenWidth > 600
    ? desktop(screenWidth, screenHeight)
    : mobile(screenWidth);
  }

     Widget mobile(double width){
      return Padding(
              padding:  EdgeInsets.symmetric(horizontal: width *.1,vertical: width*.1),
              child: Column(
                children: [
                  FamilyText(familyMember: brideFamily,),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, ),
                    child: OrnamentDivider(color: AppColors.goldDark, lineWidth: 10,),
                  ),
                  
                  FamilyText(familyMember: groomFamily,),
                ],
              ),
            );

    }

    Widget desktop(double width, double height){
      final carpan = (width / 500)/10;
      return  Padding(
              padding:  EdgeInsets.symmetric(horizontal: width *carpan, vertical: height *(carpan/5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FamilyText(familyMember: brideFamily,),
                  FamilyText(familyMember: groomFamily,),
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
        crossAxisAlignment: CrossAxisAlignment.center, // Soyisim ortada kalsın diye
        children: [
          // 1. Anne & Baba
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextSubHeader(text: familyMember.father),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextSubHeader(text: '&'),
              ),
              TextSubHeader(text: familyMember.mother),
            ],
          ),
      
          // 2. Açıklama (Hata vermeden tam sağa yaslanır)
          Align(
            alignment: Alignment.centerRight,
            child: _Description(description: familyMember.description),
          ),
      
          // 3. Soyisim
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
    ? TextSubHeader(text:'(${description!})', fontSize: 12,)
    : SizedBox(height: 15,);
         
  }
}

class TextSubHeader extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const TextSubHeader({super.key, required this.text, this.fontSize = 24, this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize, color: AppColors.charcoal, fontWeight: fontWeight
    ),);
  }
}