-include .env

NETWORK_ARGS := --rpc-url http://localhost:7545 --private-key $(DEFAULT_GANACHE_KEY) --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
endif

deployplatform:
	@forge script script/DeployPlatform.s.sol:DeployPlatform $(NETWORK_ARGS)
deploytoken:
	@forge script script/DeployToken.s.sol:DeployToken $(NETWORK_ARGS)