import 'dart:io';

void main() async {
  print("=== Dart Utility Application ===");

  // Step 1: Get user input
  stdout.write("Enter a string: ");
  String input = stdin.readLineSync() ?? "";

  // Step 2: String Manipulation
  String concatenated = input + " - Processed";
  String interpolated = "Your input was: $input";
  String substring = input.length > 3 ? input.substring(0, 3) : input;
  String upper = input.toUpperCase();
  String lower = input.toLowerCase();
  String reversed = input.split('').reversed.join();
  int length = input.length;

  print("\n--- String Manipulation ---");
  print("Concatenated: $concatenated");
  print("Interpolated: $interpolated");
  print("Substring: $substring");
  print("Uppercase: $upper");
  print("Lowercase: $lower");
  print("Reversed: $reversed");
  print("Length: $length");

  // Step 3: Collections
  List<String> resultsList = [
    concatenated,
    interpolated,
    substring,
    upper,
    lower,
    reversed
  ];

  Set<String> uniqueResults = resultsList.toSet();
  Map<String, DateTime> resultMap = {
    for (var result in uniqueResults) result: DateTime.now()
  };

  print("\n--- Collections ---");
  print("List of results: $resultsList");
  print("Unique results (Set): $uniqueResults");
  print("Map (String → Timestamp): $resultMap");

  // Step 4: File Handling
  final inputFile = File('input.txt');
  final outputFile = File('output.txt');

  try {
    await inputFile.writeAsString(input);
    await outputFile.writeAsString('--- Results ---\n');
    for (var entry in resultMap.entries) {
      await outputFile.writeAsString(
          "${entry.key} (created on: ${entry.value})\n",
          mode: FileMode.append);
    }
    print("\nFiles written successfully!");
  } catch (e) {
    print("Error handling files: $e");
  }

  // Step 5: Date and Time
  DateTime now = DateTime.now();
  DateTime future = now.add(Duration(days: 7));
  Duration diff = future.difference(now);

  print("\n--- Date & Time ---");
  print("Current Time: $now");
  print("One Week Later: $future");
  print("Difference in Days: ${diff.inDays}");

  print("\n✅ Application completed successfully!");
}
