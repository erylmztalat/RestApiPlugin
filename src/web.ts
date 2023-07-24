import { WebPlugin } from '@capacitor/core';

import type { RestAPIPlugin } from './definitions';

export class RestAPIWeb extends WebPlugin implements RestAPIPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
