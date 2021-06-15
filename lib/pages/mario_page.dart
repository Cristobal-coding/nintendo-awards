import 'package:flutter/material.dart';

class MarioPage extends StatelessWidget {
  const MarioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 500,
          height: 500,
          color: Colors.blue,
          child: Image.network(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/0c2b4cc2-d07d-4fbd-b02e-2080981b29a1/dekkxur-219a5a02-c8dd-4dbd-b7f3-c0f7729380e0.jpg/v1/fill/w_1600,h_900,q_75,strp/rupture_by_t1na_dekkxur-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvMGMyYjRjYzItZDA3ZC00ZmJkLWIwMmUtMjA4MDk4MWIyOWExXC9kZWtreHVyLTIxOWE1YTAyLWM4ZGQtNGRiZC1iN2YzLWMwZjc3MjkzODBlMC5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.ASlSAqFfqT2ESBxjeguGsXoCtfiiIgbpHQxaByRoCB0')),
    );
  }
}
