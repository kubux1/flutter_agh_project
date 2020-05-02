import 'package:flutter/material.dart';
import 'package:touristadvisor/Favorites/Command.dart';

class FavoriteWidget extends StatefulWidget {
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const FavoriteWidget({Key key, this.onAdd, this.onRemove}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState(onAdd, onRemove);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = false;
  final VoidCallback _onAdd;
  final VoidCallback _onRemove;

  _FavoriteWidgetState(this._onAdd, this._onRemove);

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        if(_onRemove != null){
          _onRemove();
        }
        _isFavorite = false;
      } else {
        if(_onAdd != null){
          _onAdd();
        }
        _isFavorite = true;
      }
    });
  }

  void onPressed(Command ){

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: (_isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
          color: (_isFavorite ? Colors.red : Colors.black),
          onPressed: _toggleFavorite,
        ),
      ],
    );
  }
}