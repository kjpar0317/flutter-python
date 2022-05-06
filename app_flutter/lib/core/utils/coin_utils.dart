class CoinUtils {
  static List<String> search_coins = [
    "btc-bitcoin",
    "eth-ethereum",
    "usdt-tether",
    "xrp-xrp",
    "sol-solana",
    "ada-cardano",
    "luna-terra",
    "avax-avalanche",
    "doge-dogecoin",
    "dot-polkadot",
    "trx-tron",
    "etc-ethereum-classic",
    "xmr-monero",
    "waves-waves",
    "mkr-maker",
    "dash-dash",
    "bat-basic-attention-token",
    "kda-kadena",
    "omg-omg-network",
    "icx-icon",
    "zel-zelcash",
    "ren-republic-protocol",
    "bico-bicompany"
  ];

  static String convertCoinIdToNm(String coinid) {
    return coinid.substring(0, coinid.indexOf('-')).toUpperCase();
  }

  static String covnertCoinNmToId(String coinNm) {
    for (int i = 0; i < search_coins.length; i++) {
      if (convertCoinIdToNm(search_coins[i]) == coinNm) {
        return search_coins[i];
      }
    }

    // default value
    return search_coins[0];
  }
}
