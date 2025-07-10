import { SharedStyles } from '@/constants/SharedStyles';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { Gesture, GestureHandlerRootView } from 'react-native-gesture-handler';
import { runOnJS, useSharedValue, withSpring } from 'react-native-reanimated';
import AssessmentHeader from '../../components/ui/AssessmentHeader';
import SleepEmojiColumn from '../../components/ui/SleepEmojiColumn';
import SleepLabelColumn from '../../components/ui/SleepLabelColumn';
import SleepSlider from '../../components/ui/SleepSlider';
import { useAssessment } from '../../contexts/AssessmentContext';

const SLEEP_LEVELS = [
  { label: 'Excellent', emoji: '😊', color: '#9ACD32', hours: '7-9 HOURS', bgColor: '#F0F8E8' },
  { label: 'Good', emoji: '🙂', color: '#FFD700', hours: '6-7 HOURS', bgColor: '#FFF9E6' },
  { label: 'Fair', emoji: '😐', color: '#D2B48C', hours: '5 HOURS', bgColor: '#F5F0E8' },
  { label: 'Poor', emoji: '☹️', color: '#FF8C00', hours: '3-4 HOURS', bgColor: '#FFF0E6' },
  { label: 'Worst', emoji: '😵', color: '#9D4EDD', hours: '<3 HOURS', bgColor: '#F3E8FF' },
];

const ITEM_HEIGHT = 70;
const SLIDER_HEIGHT = 350;

export default function SleepAssessmentScreen() {
  const router = useRouter();
  const { updateData } = useAssessment();
  const [selectedIndex, setSelectedIndex] = useState(3);
  const translateY = useSharedValue(selectedIndex * ITEM_HEIGHT + 20);

  const updateSelection = (index: number) => {
    setSelectedIndex(index);
    updateData('sleepQuality', SLEEP_LEVELS[index].label);
  };

  const handleSelection = (index: number) => {
    updateSelection(index);
    translateY.value = withSpring(index * ITEM_HEIGHT + 25, { damping: 15, stiffness: 150 });
  };

  const panGesture = Gesture.Pan()
    .onUpdate((event) => {
      const newY = Math.max(25, Math.min(SLIDER_HEIGHT - 50, event.translationY + selectedIndex * ITEM_HEIGHT + 25));
      translateY.value = newY;
    })
    .onEnd(() => {
      const newIndex = Math.round((translateY.value - 25) / ITEM_HEIGHT);
      const clampedIndex = Math.max(0, Math.min(SLEEP_LEVELS.length - 1, newIndex));
      translateY.value = withSpring(clampedIndex * ITEM_HEIGHT + 25, { damping: 15, stiffness: 150 });
      runOnJS(updateSelection)(clampedIndex);
    });

  const handleContinue = () => router.push('/assessments/step5');

  return (
    <GestureHandlerRootView style={styles.container}>
      <AssessmentHeader currentStep={4} totalSteps={7} onBack={() => router.back()} />

      <View style={styles.content}>
        <Text style={[SharedStyles.headingSmExtrabold, styles.question]}>
          How would you rate your sleep quality?
        </Text>

        <View style={styles.sliderContainer}>
          <SleepLabelColumn
            sleepLevels={SLEEP_LEVELS}
            selectedIndex={selectedIndex}
            onSelection={handleSelection}
            itemHeight={ITEM_HEIGHT}
          />

          <SleepSlider
            translateY={translateY}
            selectedIndex={selectedIndex}
            sleepLevels={SLEEP_LEVELS}
            panGesture={panGesture}
            sliderHeight={SLIDER_HEIGHT}
          />

          <SleepEmojiColumn
            sleepLevels={SLEEP_LEVELS}
            selectedIndex={selectedIndex}
            onSelection={handleSelection}
          />
        </View>

        <TouchableOpacity style={styles.continueButton} onPress={handleContinue}>
          <Text style={styles.continueText}>Continue →</Text>
        </TouchableOpacity>
      </View>
    </GestureHandlerRootView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFF9F6',
  },
  content: {
    flex: 1,
    paddingHorizontal: 10,
    paddingTop: 30,
  },
  question: {
    textAlign: 'center',
    marginBottom: 60,
    color: '#2D3748',
  },
  sliderContainer: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    justifyContent: 'space-between',
    height: SLIDER_HEIGHT,
    paddingHorizontal: 15,
  },
  continueButton: {
    backgroundColor: '#D53F8C',
    borderRadius: 25,
    paddingVertical: 18,
    alignItems: 'center',
    marginTop: 'auto',
    marginBottom: 40,
  },
  continueText: {
    fontSize: 18,
    color: 'white',
    fontWeight: '600',
  },
});
