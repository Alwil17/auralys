import React from 'react'
import { StyleSheet, Text, View } from 'react-native'
import { GestureDetector } from 'react-native-gesture-handler'
import Animated, { useAnimatedStyle } from 'react-native-reanimated'

interface SleepSliderProps {
  translateY: any
  selectedIndex: number
  sleepLevels: any[]
  panGesture: any
  sliderHeight: number
  itemHeight?: number
  knobSize?: number
}

export default function SleepSlider({
  translateY,
  selectedIndex,
  sleepLevels,
  panGesture,
  sliderHeight,
  itemHeight = 85,
  knobSize = 50,
}: SleepSliderProps) {
  // Knob centré sur la ligne, partant du haut du slider (0)
  const animatedKnobStyle = useAnimatedStyle(() => ({
    transform: [{ translateY: translateY.value }],
    backgroundColor: sleepLevels[selectedIndex].color,
  }))

  // La barre démarre depuis le centre du knob jusqu'en bas
  const animatedLineStyle = useAnimatedStyle(() => {
    // Position de départ = centre du knob
    const lineTop = translateY.value + knobSize / 2
    const lineHeight = sliderHeight - lineTop
    return {
      top: lineTop,
      height: Math.max(0, lineHeight),
      backgroundColor: sleepLevels[selectedIndex].color,
    }
  })

  return (
    <View style={[styles.sliderTrack, { height: sliderHeight }]}>
      <View style={styles.trackLine} />
      <GestureDetector gesture={panGesture}>
        <View style={styles.gestureArea}>
          <Animated.View style={[styles.sliderKnob, { width: knobSize, height: knobSize, borderRadius: knobSize / 2, left: 15 }, animatedKnobStyle]}>
            <Text style={styles.knobEmoji}>{sleepLevels[selectedIndex].emoji}</Text>
          </Animated.View>
        </View>
      </GestureDetector>
      <Animated.View style={[styles.orangeLine, animatedLineStyle]} />
    </View>
  )
}

const styles = StyleSheet.create({
  sliderTrack: {
    width: 40,
    alignItems: 'center',
    position: 'relative',
    marginHorizontal: 20,
    marginTop: 10, // Pour aligner avec le SleepLabelColumn
  },
  trackLine: {
    position: 'absolute',
    width: 4,
    height: '100%',
    backgroundColor: '#E2E8F0',
    borderRadius: 2,
    left: 18,
  },
  gestureArea: {
    position: 'absolute',
    width: 80,
    height: '100%',
    left: -20,
    zIndex: 10,
  },
  sliderKnob: {
    position: 'absolute',
    justifyContent: 'center',
    alignItems: 'center',
    elevation: 5,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.3,
    shadowRadius: 6,
  },
  orangeLine: {
    position: 'absolute',
    width: 6,
    borderRadius: 3,
    left: 17,
    zIndex: 1,
  },
  knobEmoji: {
    fontSize: 24,
  },
})
