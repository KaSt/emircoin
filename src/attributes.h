// Copyright (c) 2009-2010 Emiris Nakamoto
// Copyright (c) 2009-2018 The Emircoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef EMIRCOIN_ATTRIBUTES_H
#define EMIRCOIN_ATTRIBUTES_H

#if defined(__has_cpp_attribute)
#  if __has_cpp_attribute(nodiscard)
#    define NODISCARD [[nodiscard]]
#  endif
#endif
#ifndef NODISCARD
#  if defined(_MSC_VER) && _MSC_VER >= 1700
#    define NODISCARD _Check_return_
#  else
#    define NODISCARD __attribute__((warn_unused_result))
#  endif
#endif

#endif // EMIRCOIN_ATTRIBUTES_H
