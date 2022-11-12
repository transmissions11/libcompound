# libcompound

Get up to date cToken data using 20% less gas without mutating state.

## Gas Benchmarks

Benchmarks taken from a recent run of the [test suite](src/test) on a mainnet fork.

### LibCompound

| Method      | balanceOfUnderlying Gas | exchangeRateCurrent Gas |
| ----------- | ----------------------- | ----------------------- |
| Direct Call | 69,254                  | 64,170                  |
| LibCompound | 64,140                  | 54,664                  |

### LibFuse

| Method      | balanceOfUnderlying Gas | exchangeRateCurrent Gas |
| ----------- | ----------------------- | ----------------------- |
| Direct Call | 100,738                 | 95,485                  |
| LibFuse     | 71,419                  | 65,582                  |

## Getting Started

```sh
git clone https://github.com/transmissions11/libcompound.git
cd libcompound
make
```
