import 'package:flutter/material.dart';
import 'package:procuremenstein/ui/shared/loding_spinner.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool isBusy;
  final String title;
  final Function onPressed;
  final bool enabled;
  const BusyButton(
      {@required this.title,
      this.isBusy = false,
      @required this.onPressed,
      this.enabled = true});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(
          height: widget.isBusy ? 40 : null,
          width: widget.isBusy ? 40 : null,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: widget.isBusy ? 10 : 15,
              vertical: widget.isBusy ? 10 : 10),
          decoration: BoxDecoration(
            color: widget.enabled ? Colors.grey[800] : Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
          child: !widget.isBusy
              ? Text(
                  widget.title,
                )
              : LoadingSpinner(),
        ),
      ),
    );
  }
}
