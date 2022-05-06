import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:app_flutter/models/coin_schedule.dart';

class CoinScheduleDataSource extends CalendarDataSource {
  CoinScheduleDataSource(List<CoinSchedule> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return DateTime.parse(appointments![index].date);
  }

  @override
  DateTime getEndTime(int index) {
    if (appointments![index].date_to != null &&
        appointments![index].date_to != '') {
      return DateTime.parse(appointments![index].date_to);
    }
    return DateTime.parse(appointments![index].date);
  }

  @override
  String getSubject(int index) {
    return appointments![index].name;
  }

  @override
  Color getColor(int index) {
    // search_coins = ["btc-bitcoin", "eth-ethereum", "usdt-tether", "xrp-xrp", "sol-solana", "ada-cardano", "luna-terra", "avax-avalanche", "doge-dogecoin", "dot-polkadot", "trx-tron", "etc-ethereum-classic",
    //             "xmr-monero", "waves-waves", "mkr-maker", "dash-dash", "bat-basic-attention-token", "kda-kadena", "omg-omg-network", "icx-icon", "zel-zelcash", "ren-republic-protocol", "bico-bicompany"]
    if (appointments![index].coin == "btc-bitcoin") {
      // return appointments![index].background;
      return Color.fromARGB(255, 248, 185, 49);
    } else if (appointments![index].coin == "eth-ethereum") {
      // return appointments![index].background;
      return Color.fromARGB(255, 181, 182, 184);
    } else if (appointments![index].coin == "usdt-tether") {
      // return appointments![index].background;
      return Color.fromARGB(255, 22, 182, 70);
    } else if (appointments![index].coin == "xrp-xrp") {
      // return appointments![index].background;
      return Color.fromARGB(255, 84, 87, 85);
    } else if (appointments![index].coin == "sol-solana") {
      // return appointments![index].background;
      return Color.fromARGB(255, 214, 70, 195);
    } else if (appointments![index].coin == "ada-cardano") {
      // return appointments![index].background;
      return Color.fromARGB(255, 83, 146, 230);
    } else if (appointments![index].coin == "luna-terra") {
      // return appointments![index].background;
      return Color.fromARGB(255, 240, 213, 63);
    } else if (appointments![index].coin == "avax-avalanche") {
      // return appointments![index].background;
      return Color.fromARGB(255, 235, 50, 50);
    } else if (appointments![index].coin == "doge-dogecoin") {
      // return appointments![index].background;
      return Color.fromARGB(255, 189, 160, 99);
    } else if (appointments![index].coin == "dot-polkadot") {
      // return appointments![index].background;
      return Color.fromARGB(255, 243, 142, 204);
    } else if (appointments![index].coin == "trx-tron") {
      // return appointments![index].background;
      return Color.fromARGB(255, 158, 73, 73);
    } else if (appointments![index].coin == "etc-ethereum-classic") {
      // return appointments![index].background;
      return Color.fromARGB(255, 92, 158, 112);
    } else if (appointments![index].coin == "kda-kadena") {
      // return appointments![index].background;
      return Color.fromARGB(255, 231, 73, 223);
    } else if (appointments![index].coin == "zel-zelcash") {
      // return appointments![index].background;
      return Color.fromARGB(255, 43, 85, 223);
    } else {
      // return appointments![index].background;
      return Color.fromARGB(255, 149, 157, 229);
    }
  }

  @override
  bool isAllDay(int index) {
    // return appointments![index].isAllDay;
    return false;
  }
}
