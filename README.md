# capacitor-restapi-plugin

A Capacitor plugin for fetching and processing cover images from a remote API.

## Install

```bash
npm install capacitor-restapi-plugin
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`getLatestCover(...)`](#getlatestcover)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### getLatestCover(...)

```typescript
getLatestCover(options: { amount: number; }) => Promise<{ covers: string[]; }>
```

| Param         | Type                             |
| ------------- | -------------------------------- |
| **`options`** | <code>{ amount: number; }</code> |

**Returns:** <code>Promise&lt;{ covers: string[]; }&gt;</code>

--------------------

</docgen-api>
