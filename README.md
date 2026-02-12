# flutter_krs_application

## C.1 Thinking Questions

1. Why can’t StatelessWidget use setState()?
   Answer: StatelessWidget doesn't support interal state that can change, meaning that this widget is made for a ui that doesn't need an update dynamically. For StatelessWidget does not keep the state, so it does not know what data should be updated, therefore setState() cannot be used in there.

2. What happens if setState() is removed from the button?
   Answer: if setState() is removed, flutter cannot get to know if there is a data, so that the ui remains as before.

3. Why is KrsDetailScreen better as StatelessWidget?
   Answer: Because KrsDetailsScreen just show a static data, and doesn't change any data or interaction that update the ui. If the screen only accept the data and show them, StatelessWidget is lighter, clean, and efficent.

4. What kind of data should NOT be stored as state?
   Answer: Data that should not be stored as state are such as constants, data from the parent widget that is static, style or decoration, and data that doesn't affect any UI.

## C.2 Debugging Challenge

```
setState(() {
selectedCredits = selectedCredits + "3";
});

```

The error occurs because selectedCredits is an int, but "3" is a String, and Dart does not allow adding an integer and a string together, so the types must match (use 3 instead of "3")

## Reflection

1.  Hardest part this week
    Probably I was confused in managing layout of the card profile like how to make it look neat, include centering it, grouping with the column or row, some spacing, and then how to align text so that it aligns to right.

2.  Error encountered
    I actually encountered error when I run the flutter project sometimes. The error usually was unclear, it just happen like that even though there is no error or mistake in the code I wrote.

3.  How I fixed them
    For the case I fixed the layouting, I tried to learn what are the correct widget to do a certain layout arrangement. For example, I learnt that MainAxisAlignment and crossAxisALignment properties are really useful in case of placing widgets properly. I also used SizedBox for spacing and adjusted padding and alignment so the profile card looks neat and centered on the screen.

    For the errors I encounterd, I just usually fixed them by doing a hot restart while checking the terminal logs, and sometimes rebuilding the project when Flutter behaved unexpectedly even though the code had no obvious mistakes.

4.  Remaining questions
    I still have some questions about how to make the UI more responsive on different screen sizes, how to manage user data dynamically instead of hardcoding it, and how to connect this profile screen to a real backend or database in a KRS system.
