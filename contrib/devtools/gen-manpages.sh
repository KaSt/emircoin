#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

EMIRCOIND=${EMIRCOIND:-$BINDIR/emircoind}
EMIRCOINCLI=${EMIRCOINCLI:-$BINDIR/emircoin-cli}
EMIRCOINTX=${EMIRCOINTX:-$BINDIR/emircoin-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/emircoin-wallet}
EMIRCOINQT=${EMIRCOINQT:-$BINDIR/qt/emircoin-qt}

[ ! -x $EMIRCOIND ] && echo "$EMIRCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($EMIRCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for emircoind if --version-string is not set,
# but has different outcomes for emircoin-qt and emircoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$EMIRCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $EMIRCOIND $EMIRCOINCLI $EMIRCOINTX $WALLET_TOOL $EMIRCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
