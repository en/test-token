# test-token

1. git clone https://github.com/en/test-token.git
2. cd test-token
3. npm install
4. npm install -g truffle
5. modify contracts/TestToken.sol，change token name, symbol, decimals
6. truffle compile
7. modify truffle.js, add mainnet configuration
8. truffle migrate --network mainnet
