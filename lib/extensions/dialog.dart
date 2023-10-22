import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:samsung_camp/components/text/text_widget.dart';

extension dialogCorrect on BuildContext {
  dialogScreenCorrect() {
    showDialog(
      context: this,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                text: 'item add successfully',
                size: 20,
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
