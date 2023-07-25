export interface RestAPIPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  getLatestCover(options: { amount: number }): Promise<{covers: string[]}>;
}

