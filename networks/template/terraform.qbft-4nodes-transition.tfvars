#
#  This network setups with 3 nodes and has 4th node as an extra node
#

number_of_nodes         = 4
consensus               = "istanbul"
addtional_geth_args     = "--allow-insecure-unlock"
qbftBlock               = { block = 100, enabled = true }
qbft_empty_block_period = { block = 120, emptyblockperiod = 5 }
transition_config = { transitions: [{ "block": 100, "algorithm": "qbft" }, { "block": 120, "emptyblockperiodseconds": 5 }, { "block": 250, "emptyblockperiodseconds": 1 }] }
