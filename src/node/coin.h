// Copyright (c) 2019 The Emircoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef EMIRCOIN_NODE_COIN_H
#define EMIRCOIN_NODE_COIN_H

#include <map>

class COutPoint;
class Coin;

/**
 * Look up unspent output information. Returns coins in the mempool and in the
 * current chain UTXO set. Iterates through all the keys in the map and
 * populates the values.
 *
 * @param[in,out] coins map to fill
 */
void FindCoins(std::map<COutPoint, Coin>& coins);

#endif // EMIRCOIN_NODE_COIN_H
