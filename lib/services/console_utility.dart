class ConsoleUtility {
  static void printToConsole(String string) {
    // print('\n\n');
    print('\n NEW LOG ENTRY: ${DateTime.now().toString()}\n');
    print('\t\n...........' +string + '.......\n');
   print('\nLOG ENTRY COMPLETE....\n');
  }
}
