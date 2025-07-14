import { Stack, useRouter } from "expo-router";
import * as SplashScreen from 'expo-splash-screen';
import { useCallback, useEffect, useState } from "react";
import { View } from "react-native";

// Keep the splash screen visible while we fetch resources
SplashScreen.preventAutoHideAsync();

// Set the animation options. This is optional.
SplashScreen.setOptions({
  duration: 1000,
  fade: true,
});

export default function RootLayout() {
  const router = useRouter();
  const [appIsReady, setAppIsReady] = useState(false);

  useEffect(() => {
    async function prepare() {
      try {
        // Simulate a loading delay
        await new Promise(resolve => setTimeout(resolve, 500));
      } catch (e) {
        console.warn(e);
      } finally {
        // Hide the splash screen
        setAppIsReady(true);
      }
    }

    prepare();
  }, []);

  const onLayoutRootView = useCallback(async () => {
    if (appIsReady) {
      console.log("App is ready, hiding splash screen");
      await SplashScreen.hideAsync();
      // Attendre un peu pour que le Stack soit monté
      setTimeout(() => {
        router.push("/intro/quote");
      }, 100);
    }
  }, [appIsReady, router]);

  if (!appIsReady) {
    console.log("App is not ready, showing splash screen");
    return null;
  }

  return (
    <View style={{ flex: 1 }} onLayout={onLayoutRootView}>
      <Stack> 
        <Stack.Screen name="index" options={{ headerShown: false }} />
        <Stack.Screen name="intro/loading" options={{ headerShown: false }} />
        <Stack.Screen name="intro/quote" options={{ headerShown: false }} />
        <Stack.Screen name="welcome/index" options={{ headerShown: false }} />
        <Stack.Screen name="auth/login" options={{ headerShown: false }} />
        <Stack.Screen name="auth/register" options={{ headerShown: false }} />
        <Stack.Screen name="assessments" options={{ headerShown: false }} />
      </Stack>
    </View>
  );
}