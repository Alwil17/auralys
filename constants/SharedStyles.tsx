import { StyleSheet } from "react-native";
import { Colors } from "./Colors";

export const SharedStyles = StyleSheet.create({
    headingSmExtrabold: {
        fontSize: 30,
        fontWeight: '900',
        color: Colors.light.text,
    },
    textSmExtrabold: {
        fontSize: 14,
        fontWeight: '900',
        color: Colors.light.text,
    },
    textMdbold: {
        fontSize: 16,
        fontWeight: 'bold'
    },
    textLgExtrabold: {
        fontSize: 18,
        fontWeight: '900'
    },
    link: {
        color: Colors.light.blue,
        fontWeight: '600',
        textDecorationLine: 'underline'
    },
    button: {
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: Colors.light.purple,
        paddingVertical: 14,
        paddingHorizontal: 32,
        borderRadius: 28,
        marginTop: 12,
    },
    formBody: {
        flexDirection: "column",
        justifyContent: "flex-start",
        width: "100%",
        gap: 10
    },
});