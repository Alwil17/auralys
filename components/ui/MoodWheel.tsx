import React from 'react';
import { StyleSheet, View } from 'react-native';
import { Gesture, GestureDetector } from 'react-native-gesture-handler';
import Animated, { useAnimatedStyle, useSharedValue } from 'react-native-reanimated';
import MoodWheelSVG from './MoodWheelSVG';


interface MoodWheelProps {
  moods: any[];
  selectedMood: number;
  onRotationUpdate: (rotation: number) => void;
  onRotationEnd: () => void;
}

export default function MoodWheel({ moods, selectedMood, onRotationUpdate, onRotationEnd }: MoodWheelProps) {
  const rotation = useSharedValue(0);
  const lastRotation = useSharedValue(0);

  const panGesture = Gesture.Pan()
    .onStart(() => {
      lastRotation.value = rotation.value;
    })
    .onUpdate((event) => {
      const deltaAngle = -event.translationX * 0.005;
      rotation.value = lastRotation.value + deltaAngle;
      onRotationUpdate(rotation.value);
    })
    .onEnd(() => {
      onRotationEnd();
    });

  const rouletteStyle = useAnimatedStyle(() => ({
    transform: [{ rotate: `${rotation.value - Math.PI / 2}rad` }],
  }));

  return (
    <View style={styles.container}>
      <GestureDetector gesture={panGesture}>
        <Animated.View style={[styles.wheel, rouletteStyle]}>
          <MoodWheelSVG moods={moods} selectedMood={selectedMood} />
        </Animated.View>
      </GestureDetector>
      <View style={styles.pointer} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    width: 280,
    height: 280,
    justifyContent: 'center',
    alignItems: 'center',
    alignSelf: 'center',
    marginBottom: 40,
  },
  wheel: {
    width: 280,
    height: 280,
    justifyContent: 'center',
    alignItems: 'center',
  },
  pointer: {
    position: 'absolute',
    top: 5,
    width: 16,
    height: 16,
    borderRadius: 8,
    backgroundColor: '#2D3748',
    borderWidth: 2,
    borderColor: 'white',
    zIndex: 10,
  },
});
