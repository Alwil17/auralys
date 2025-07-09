import { Colors } from "@/constants/Colors";
import { AntDesign } from "@expo/vector-icons";
import { Link } from "expo-router";
import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";

export default function WelcomeScreen() {
    return (
        <View style={styles.container}>
            <Image
                source={require("../../assets/icons/logo.png")}
                style={styles.logoImage}
            />
            <Text style={styles.base}>
                Welcome to{' '}
                <Text style={styles.brand}>Auralys</Text>
                <Text style={styles.emoji}> 💙</Text>
            </Text>

            <Text style={styles.subtitle}>
                Your gentle AI companion for emotional balance and daily serenity 🌿
            </Text>

            <Image
                source={require("../../assets/images/luma.png")}
                style={styles.mascotteImage}
            />

            <TouchableOpacity style={styles.button}>
                <Text style={styles.buttonText}>Get Started</Text>
                <AntDesign name="arrowright" size={20} color="#fff" />
            </TouchableOpacity>

            <Link href="/auth/login" replace asChild>
                <Text>
                    Already have an account?{' '}
                    <Text style={{ color: Colors.light.blue, fontWeight: '600', textDecorationLine: 'underline' }}>
                        Sign In
                    </Text>
                </Text>
            </Link>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: Colors.light.background,
        alignItems: "center",
        justifyContent: "center",
        gap: 30,
    },
    base: {
        fontSize: 28,
        fontWeight: '600',
        color: Colors.light.text,
        textAlign: 'center',
    },
    brand: {
        color: Colors.light.purple,
        fontWeight: '700',
    },
    emoji: {
        fontSize: 28,
    },
    subtitle: {
        fontSize: 18,
        color: '#555',
        textAlign: 'center',
    },
    logoImage: {
        width: 50,
        height: 50,
        backgroundColor: "transparent",
        borderRadius: 30,
        borderColor: "transparent",
        resizeMode: 'contain',
    },
    mascotteImage: {
        width: 300,
        height: 300,
        backgroundColor: "transparent",
        borderRadius: 150,
        borderColor: "transparent",
        resizeMode: 'contain',
    },
    button: {
        flexDirection: "row",
        alignItems: "center",
        backgroundColor: Colors.light.purple,
        paddingVertical: 16,
        paddingHorizontal: 24,
        borderRadius: 30,
        elevation: 2,
    },
    buttonText: {
        color: "#fff",
        fontWeight: "600",
        marginRight: 8,
        fontSize: 16,
    },
});