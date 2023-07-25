import { WebPlugin } from '@capacitor/core';

import type { RestAPIPlugin } from './definitions';

export class RestAPIWeb extends WebPlugin implements RestAPIPlugin {
  constructor() {
    super({
      name: 'RestAPI',
      platforms: ['web'],
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }

  async getLatestCover(options: { amount: number }): Promise<{covers: string[]}> {
    const response = await fetch('https://public.softgames.com/code-challenge/manifest.json');
    if (!response.ok) {
        throw new Error('Network response was not ok');
    }

    const data = await response.json();
    const covers = data.data.slice(0, options.amount).map((item: any) => item.cover);

    return { covers: covers };
  }
}
