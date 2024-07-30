import "package:flutter_m/components/button.dart";
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

void main() {
  testWidgets(
    "should render the button widget successfully",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Button(
          label: "Label",
          buttonBgColor: Colors.red,
          onPressed: () {
            print("This is onpressed0");
          },
        ),
      );

      expect(find.text("Label"), findsOneWidget);
    },
  );
}
