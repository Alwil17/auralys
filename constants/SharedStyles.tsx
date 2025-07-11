import { StyleSheet } from "react-native";
import { Colors } from "./Colors";

export const SharedStyles = StyleSheet.create({
    headingSmExtrabold: {
        fontSize: 30,
        fontWeight: 'bold',
        color: Colors.light.text,
        fontFamily: 'Urbanist-ExtraBold',
        lineHeight: 38,
    },
    textSmExtrabold: {
        fontSize: 14,
        fontWeight: '700',
        color: Colors.light.text,
        fontFamily: 'Urbanist-ExtraBold',
    },
    textMdbold: {
        fontSize: 16,
        fontWeight: 'bold',
        fontFamily: 'Urbanist-Bold',
    },
    textSmbold: {
        fontSize: 14,
        fontWeight: 'bold',
        fontFamily: 'Urbanist-Bold',
    },
    textLgExtrabold: {
        fontSize: 18,
        fontWeight: 'bold',
        fontFamily: 'Urbanist-ExtraBold',
    },
    text2XlExtrabold: {
        fontSize: 24,
        fontWeight: 'bold',
        fontFamily: 'Urbanist-ExtraBold',
    },
    link: {
        color: Colors.light.blue,
        fontWeight: '600',
        textDecorationLine: 'underline',
        fontFamily: 'Urbanist-Bold',
    },
    button: {
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: Colors.light.purple,
        paddingVertical: 14,
        paddingHorizontal: 32,
        borderRadius: 28,
        marginTop: 12
    },
    formBody: {
        flexDirection: "column",
        justifyContent: "flex-start",
        width: "100%",
        gap: 10
    },
});