import { MotiView } from 'moti';
import * as React from 'react';
import { useEffect } from 'react';
import { StyleSheet, TextInput, View } from 'react-native';
import Animated, {
    Easing,
    useAnimatedProps,
    useSharedValue,
    withTiming,
} from 'react-native-reanimated';

const _color = "#e1a2f7";
const _size = 100;

const AnimatedTextInput = Animated.createAnimatedComponent(TextInput);

/**
 * A full-screen loading animation that shows a loading circle and a percentage text.
 * The percentage will increase from 0 to 100 over 3 seconds.
 * The loading circle is made up of 3 circles that fade in and out in a loop.
 * The percentage text is animated using React Native Reanimated.
 */
export default function LoadingScreen() {
    const progress = useSharedValue(0);

    useEffect(() => {
        progress.value = withTiming(100, {
            duration: 3000,
            easing: Easing.out(Easing.exp),
        });
    }, []);

    const animatedProps = useAnimatedProps(() => ({
        text: `${Math.round(progress.value)}%`,
        defaultValue: `${Math.round(progress.value)}%`,
    }));

    return (
        <View style={styles.container}>
            <View style={styles.circleWrapper}>
                {[...Array(3).keys()].map((index) => (
                    <MotiView
                        key={index}
                        from={{ opacity: 0.7, scale: 1 }}
                        animate={{ opacity: 0, scale: 4 }}
                        transition={{
                            type: "timing",
                            duration: 2000,
                            easing: Easing.inOut(Easing.ease),
                            delay: index * 400,
                            repeatReverse: false,
                            loop: true
                        }}
                        style={styles.circle}
                    />
                ))}

                {/* ddd! */}
                <AnimatedTextInput
                    animatedProps={animatedProps}
                    style={styles.percentText}
                    editable={false}
                />
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: { flex: 1, justifyContent: 'center', alignItems: 'center' },
    circleWrapper: {
        width: _size,
        height: _size,
        justifyContent: 'center',
        alignItems: 'center',
        position: 'relative',
    },
    circle: {
        width: _size,
        height: _size,
        backgroundColor: _color,
        borderRadius: _size / 2,
        position: 'absolute',
    },
    percentText: {
        fontSize: 18,
        fontWeight: 'bold',
        color: '#333',
        position: 'absolute',
        textAlign: 'center',
    },
});