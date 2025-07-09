import { Routes } from '@/constants/Routes';
import { AntDesign } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import { MotiView } from "moti";
import { useEffect, useState } from 'react';
import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";

export default function QuoteScreen() {
    const router = useRouter();

    const quoteText =
        "You do not have to be good. You only have to let the soft animal of your body love what it loves.";

    const [displayedText, setDisplayedText] = useState('');

    useEffect(() => {
        let i = 0;
        const interval = setInterval(() => {
            if (i < quoteText.length) {
                const char = quoteText[i] ?? '';
                setDisplayedText((prev) => prev + char);
                i++;
            } else {
                clearInterval(interval);
            }
        }, 30); // vitesse (ms/lettre)
        return () => clearInterval(interval);
    }, []);

    const handleContinue = () => {
        router.push(Routes.WELCOME);
    };

    return (
        <View style={styles.container}>
            <View style={styles.quoteContainer}>
                <Image
                    source={require("../../assets/icons/ios-light.png")}
                    style={styles.logoImage}
                />
                <Text style={styles.quote}>"{displayedText}"</Text>

                <MotiView
                    from={{ opacity: 0, translateY: 20 }}
                    animate={{ opacity: 1, translateY: 0 }}
                    transition={{
                        type: "timing",
                        duration: 300
                    }}
                >
                    <Text style={styles.author}>— Mary Oliver, Wild Geese</Text>
                </MotiView>
            </View>

            <MotiView
                from={{ opacity: 0, translateY: 20 }}
                animate={{ opacity: 1, translateY: 0 }}
                transition={{
                    type: "timing",
                    duration: 300
                }}
            >
                <TouchableOpacity style={styles.button} onPress={handleContinue}>
                    <Text style={styles.buttonText}>Continue</Text>
                    <AntDesign name="arrowright" size={20} color="#fff" />
                </TouchableOpacity>
            </MotiView>

        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#F5EFFF",
        alignItems: "center",
        justifyContent: "center",
        paddingHorizontal: 32,
    },
    quoteContainer: {
        width: "100%",
        alignItems: "flex-start",
        marginBottom: 40,
    },
    quote: {
        fontSize: 36,
        fontStyle: "italic",
        textAlign: "left",
        color: "#5A3F8C",
        marginBottom: 64
    },
    author: {
        fontSize: 16,
        color: "#6B5B95",
        textAlign: "left"
    },
    button: {
        flexDirection: "row",
        alignItems: "center",
        backgroundColor: "#A971E1",
        paddingVertical: 12,
        paddingHorizontal: 24,
        borderRadius: 24,
        elevation: 2,
    },
    buttonText: {
        color: "#fff",
        fontWeight: "600",
        marginRight: 8,
        fontSize: 16,
    },
    logoImage: {
        width: 50,
        height: 50,
        marginBottom: 64,
        backgroundColor: "transparent",
        borderRadius: 30,
        borderColor: "transparent",
        resizeMode: 'contain',
    },
});