import CircleHeader from "@/components/ui/CircleHeader";
import InputField from "@/components/ui/InputField";
import { Colors } from "@/constants/Colors";
import { Routes } from "@/constants/Routes";
import { SharedStyles } from "@/constants/SharedStyles";
import { AntDesign, FontAwesome } from "@expo/vector-icons";
import { Link, router } from "expo-router";
import { useState } from "react";
import { ActivityIndicator, Dimensions, Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";

export default function LoginScreen() {
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
                <Text style={SharedStyles.headingSmExtrabold}>Sign in to Auralys</Text>

                <View style={SharedStyles.formBody}>
                    {/* Inputs */}
                    <InputField icon="mail" label="Email" placeholder="Email Address" keyboardType="email-address" />
                    <InputField
                        icon="lock"
                        label="Password"
                        placeholder="Enter your password..."
                        secureTextEntry={!passwordVisible}
                    />

                    {/* Sign In Button */}
                    <TouchableOpacity style={SharedStyles.button} onPress={() => { router.push(Routes.ASSESSMENTS.INDEX) }}>
                        <Text style={[SharedStyles.textLgExtrabold, styles.buttonText]}>Sign In</Text>
                        <AntDesign name="arrowright" size={20} color="#fff" />
                    </TouchableOpacity>
                </View>


                {/* Social Login */}
                <View style={styles.socialRow}>
                    <FontAwesome name="apple" size={22} color="#333" style={styles.socialIcon} />
                    <AntDesign name="google" size={22} color="#333" style={styles.socialIcon} />
                    <FontAwesome name="instagram" size={22} color="#333" style={styles.socialIcon} />
                </View>

                <View style={styles.footerContainer}>
                    {/* Links */}
                    <Text style={styles.footerText}>
                        Don’t have an account? <Link href={Routes.AUTH.REGISTER} style={SharedStyles.link}>Sign Up.</Link>
                    </Text>
                    <Text style={[SharedStyles.link, { marginTop: 8 }]}>Forgot Password</Text>
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
    logoLoader: {
        width: 50,
        height: 50,
        marginTop: 80,
        borderRadius: 30,
        backgroundColor: Colors.light.background,
    },
    logo: { width: 50, height: 50, marginTop: 80, resizeMode: 'contain', borderRadius: 30, },
    buttonText: { color: "#fff", marginRight: 8 },
    socialRow: { flexDirection: "row", alignItems: "center", justifyContent: "center", width: 120, gap: 8 },
    socialIcon: { paddingVertical: 10, paddingHorizontal: 12, borderColor: Colors.light.borderColor, borderWidth: 1, borderRadius: 30 },
    footerText: { fontSize: 14, color: "#666" },
    footerContainer: { flexDirection: "column", justifyContent: "center", alignItems: "center" }
});
