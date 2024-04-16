import 'package:company_inventory/theme/theme_colors.dart';
import 'package:company_inventory/theme/theme_dimensions.dart';
import 'package:company_inventory/utils/mixins/after_init_state.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    Key? key,
    this.child,
    this.color = ThemeColors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? color;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with AfterInitMixin<CustomCard> {
  late ThemeData _theme;

  @override
  void afterInitState() {
    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(ThemeDimensions.spacingRegular),
      padding: const EdgeInsets.all(ThemeDimensions.spacingRegular),
      decoration: BoxDecoration(
        color: widget.color,
        border: Border.all(
          color: _theme.cardColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: const [
          BoxShadow(
            color: ThemeColors.gray,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: widget.child,
    );
  }
}
