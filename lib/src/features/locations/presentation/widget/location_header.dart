import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LocationHeader extends StatefulWidget {
  final ValueNotifier<bool> isWriting;
  final ValueNotifier<bool> isSearching;
  final TextEditingController searchController;

  const LocationHeader({
    super.key,
    required this.isWriting,
    required this.isSearching,
    required this.searchController,
  });

  @override
  State<LocationHeader> createState() => _LocationHeaderState();
}

class _LocationHeaderState extends State<LocationHeader> {
  @override
  void dispose() {
    widget.isWriting.value = false;
    widget.isWriting.dispose();

    widget.isSearching.value = false;
    widget.isSearching.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black.withOpacity(0.7),
                ),
              )),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: widget.searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          widget.isWriting.value = true;
                        } else {
                          widget.isWriting.value = false;
                        }
                      },
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          widget.isSearching.value = true;
                        } else {
                          widget.isSearching.value = false;
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Search",
                        contentPadding: EdgeInsets.zero,
                        isCollapsed: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
