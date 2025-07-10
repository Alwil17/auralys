import { Stack } from "expo-router";
import { SafeAreaView, StyleSheet } from "react-native";
import { AssessmentProvider } from "../../contexts/AssessmentContext";

export default function Layout() {
    return (
        <AssessmentProvider>
            <SafeAreaView style={styles.container}>
                <Stack
                        screenOptions={{
                            headerShown: false,
                        }}
                    >
                        <Stack.Screen name="index" />
                        <Stack.Screen name="step1" />
                        <Stack.Screen name="step2" />
                        <Stack.Screen name="step4" />
                    </Stack>
            </SafeAreaView>
        </AssessmentProvider>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#FFF9F6",
        marginTop: 30, // Remove top margin to avoid white space
    },
});
