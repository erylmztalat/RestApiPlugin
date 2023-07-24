import { registerPlugin } from '@capacitor/core';

import type { RestAPIPlugin } from './definitions';

const RestAPI = registerPlugin<RestAPIPlugin>('RestAPI', {
  web: () => import('./web').then(m => new m.RestAPIWeb()),
});

export * from './definitions';
export { RestAPI };
