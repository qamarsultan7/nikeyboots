
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Resources/constants.dart';

TextField searchbar() {
    return TextField(
            decoration: InputDecoration(
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
                contentPadding: const EdgeInsets.all(20),
                hintStyle: const TextStyle(fontWeight: FontWeight.w400,color: Color.fromARGB(122, 0, 0, 0)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SvgPicture.asset(
                    'Assets/Icons/search.svg',
                    width: 18,
                    height: 18,
                  ),
                ),
                hintText: 'Looking for shoes',
                filled: true,
                fillColor: KCONSTANTWHITECOLOR,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50))),
          );
  }
