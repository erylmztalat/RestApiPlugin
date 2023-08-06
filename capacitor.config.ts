import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.example.app',
  appName: 'capacitor-restapi-plugin',
  webDir: 'www',
  server: {
    androidScheme: 'https'
  }
};

export default config;
