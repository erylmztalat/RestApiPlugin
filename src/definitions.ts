export interface RestAPIPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
