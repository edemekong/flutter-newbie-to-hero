import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:our_christmas/constants/quotes.dart';

final quotesProvider = StateNotifierProvider<ChristmasQuotes, List<String>>((ref) {
  return ChristmasQuotes();
});

final favoriteQuotesProvider = StateNotifierProvider<FavoritedChristmasQuotes, List<String>>((ref) {
  return FavoritedChristmasQuotes();
});

final messageProvider = StateProvider<String>((ref) {
  return '';
});

class ChristmasQuotes extends StateNotifier<List<String>> {
  ChristmasQuotes() : super(quotes);

  List<String> history = [];

  void removeQuote(String id) {
    state = [
      for (final quote in state)
        if (quote != id) quote,
    ];

    history = [...history, id];
  }

  void goBack() {
    state = [history.last, ...state];
    history = [
      for (final quote in history)
        if (quote != history.last) quote,
    ];
  }

  void restart() {
    state = quotes;
  }
}

class FavoritedChristmasQuotes extends StateNotifier<List<String>> {
  FavoritedChristmasQuotes() : super([]);

  void toggle(String id) {
    if (state.contains(id)) {
      state = [
        for (final favorite in state)
          if (favorite == id) ...[] else favorite
      ];
    } else {
      state = [id, ...state];
    }
  }
}
