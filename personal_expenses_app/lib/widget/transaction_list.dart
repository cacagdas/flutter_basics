import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widget/transaction_item.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Text(
              'No Transactions added yet!',
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset('assets/images/waiting.png',
                    fit: BoxFit.cover)),
          ],
        );
      },
    )
        : ListView(
        children: transactions
            .map((tx) =>
            TransactionItem(
              key: ValueKey(tx.id),
              transaction: tx,
              deleteTx: deleteTx,
            ))
            .toList());
  }
}
