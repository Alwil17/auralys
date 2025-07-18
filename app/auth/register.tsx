import CircleHeader from "@/components/ui/CircleHeader";
import InputField from "@/components/ui/InputField";
import { Colors } from "@/constants/Colors";
import { Routes } from "@/constants/Routes";
import { SharedStyles } from "@/constants/SharedStyles";
import { AntDesign } from "@expo/vector-icons";
import { Link } from "expo-router";
import { useState } from "react";
import { ActivityIndicator, Dimensions, Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";

export default function RegisterScreen() {
    const [logoLoaded, setLogoLoaded] = useState(false);
    const [passwordVisible, setPasswordVisible] = useState(false);

    return (

        <View style={styles.container}>
            {/* Header avec logo */}
            <CircleHeader customStyles={styles.svgCurve} />
            {/* <View style={styles.header} /> */}
            <View>
                {!logoLoaded && (
                    <ActivityIndicator
                        size="small"
                        color={Colors.light.purple}
                        style={styles.logoLoader}
                    />
                )}
                <Image
                    source={require("../../assets/icons/logo.png")}
                    style={[styles.logo, { opacity: logoLoaded ? 1 : 0 }]}
                    onLoad={() => setLogoLoaded(true)}
                    fadeDuration={200}
                />
            </View>

            {/* Formulaire de connexion */}
            <View style={styles.formContainer}>
                <Text style={SharedStyles.headingSmExtrabold}>Sign up to Auralys</Text>

                <View style={SharedStyles.formBody}>
                    {/* Inputs */}
                    <InputField icon="mail" label="Email Address" placeholder="Email Address" keyboardType="email-address" />
                    <InputField
                        icon="lock"
                        label="Password"
                        placeholder="Enter your password..."
                        secureTextEntry={!passwordVisible}
                    />
                    <InputField
                        icon="lock"
                        label="Password Confirmation"
                        placeholder="Confirm your password..."
                        secureTextEntry={!passwordVisible}
                    />

                    {/* Sign In Button */}
                    <TouchableOpacity style={SharedStyles.button}>
                        <Text style={[SharedStyles.textLgExtrabold, styles.buttonText]}>Sign Up</Text>
                        <AntDesign name="arrowright" size={20} color="#fff" />
                    </TouchableOpacity>
                </View>

                <View style={styles.footerContainer}>
                    {/* Links */}
                    <Text style={styles.footerText}>
                        Already have an account? <Link href={Routes.AUTH.LOGIN} style={SharedStyles.link} replace>Sign In.</Link>
                    </Text>
                </View>
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: { flex: 1, backgroundColor: Colors.light.background, alignItems: "center", paddingHorizontal: 24 },
    formContainer: {
        flex: 1,
        justifyContent: "flex-start",
        alignItems: "center",
        width: "100%",
        marginTop: 40,
        gap: 30
    },
    svgCurve: {
        position: 'absolute',
        width: Dimensions.get('window').width,
        backgroundColor: Colors.light.purple, height: 0
    },
    imageContainer: {
        position: 'relative',
        justifyContent: 'center',
        alignItems: 'center',
    },
    logoLoader: {
        width: 50,
        height: 50,
        marginTop: 80,
        borderRadius: 30,
        backgroundColor: Colors.light.background,
    },
    logo: { width: 50, height: 50, marginTop: 80, marginBottom: 24, resizeMode: 'contain', borderRadius: 30, },
    buttonText: { color: "#fff", marginRight: 8 },
    socialRow: { flexDirection: "row", alignItems: "center", justifyContent: "center", width: 120, gap: 8 },
    socialIcon: { paddingVertical: 10, paddingHorizontal: 12, borderColor: Colors.light.borderColor, borderWidth: 1, borderRadius: 30 },
    footerText: { fontSize: 14, color: "#666" },
    footerContainer: { flexDirection: "column", justifyContent: "center", alignItems: "center" }
});
