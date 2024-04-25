import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String createHTMLWizardEmail(
  String logo,
  String name,
  String phone,
  String email,
  String contrucType,
  String barnSize,
  String localtionDescript,
  String street,
  String city,
  String zip,
) {
  // create html email with all arg include  logo at top of email. format address
  return '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submission Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            color: #007bff;
            font-size: 14px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }
        ul li span {
            font-weight: bold;
        }
        ul li a {
            color: #007bff;
            text-decoration: none;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="$logo" alt="Logo" style="max-width: 250px; display: block; margin: auto;">
    <h1>New quote request!</h1>
    <br>
   
    <ul>
     <li>Name: <span>$name</a></span></li>
        <li>Phone: <span><a href="tel:$phone">$phone</a></span></li>
        <li>Email: <span><a href="mailto:$email">$email</a></span></li>
        <li>Construction Type: <span>$contrucType</span></li>
        <li>Barn Size: <span>$barnSize</span></li>
        <li>Location Description: <span>$localtionDescript</span></li>
        <li>Address: <span>$street, $city, Florida, $zip</span></li>
    </ul>
    
    <p class="footer">Click on Phone or Email to contact customer</p>
</div>
</body>
</html>




''';
}

String createHTMLContactUsEmail(
  String name,
  String phone,
  String email,
  String type,
  String message,
  String logo,
) {
  // create html email with all arg, use the logo at top of email
  return '''
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #007bff;
        }
        p {
            margin: 10px 0;
            font-size: 16px;
        }
        .info {
            background-color: #e9ecef;
            padding: 10px;
            border-radius: 5px;
            margin: 5px 0;
            display: inline-block;
            text-align: left;
        }
        .info a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="$logo" alt="Logo" style="max-width: 250px; margin-bottom: 20px;">
        <h1>Contact Us</h1>
        <p class="info">Name: <strong>$name</strong></p>
        <p class="info">Phone: <a href="tel:$phone"><strong>$phone</strong></a></p>
        <p class="info">Email: <a href="mailto:$email"><strong>$email</strong></a></p>
        <p class="info">Type: <strong>$type</strong></p>
        <p class="info">Message: <strong>$message</strong></p>
    </div>
</body>
</html>


''';
}
