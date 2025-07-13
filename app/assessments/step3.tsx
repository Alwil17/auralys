import { SharedStyles } from '@/constants/SharedStyles';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import AssessmentHeader from '../../components/ui/AssessmentHeader';
import MoodDisplay from '../../components/ui/MoodDisplay';
import MoodWheel from '../../components/ui/MoodWheel';
import { useAssessment } from '../../contexts/AssessmentContext';

const MOODS = [
  { label: 'Awful', color: '#8D5524', emoji: '😫' },
  { label: 'Sad', color: '#FF6B6B', emoji: '☹️' },
  { label: 'Neutral', color: '#FFD166', emoji: '😐' },
  { label: 'Happy', color: '#4ECDC4', emoji: '😊' },
  { label: 'Euphoric', color: '#66D37E', emoji: '😁' }
];

const TAU = 2 * Math.PI;
const arc = TAU / MOODS.length;

export default function MoodRouletteScreen() {
  const router = useRouter();
  const { updateData } = useAssessment();
  const [selectedMood, setSelectedMood] = useState(2);

  const getIndex = (angle: number) => {
    const normalizedAngle = ((angle % TAU) + TAU) % TAU;
    const idx = Math.round((TAU - normalizedAngle) / arc) % MOODS.length;
    return (idx + MOODS.length) % MOODS.length;
  };

  const updateSelectedMood = (newMoodIndex: number) => {
    setSelectedMood(newMoodIndex);
    updateData('mood', MOODS[newMoodIndex].label);
  };

  const handleRotationUpdate = (rotation: number) => {
    // Optionnel: mise à jour en temps réel pendant la rotation
  };

  const handleRotationEnd = () => {
    // Snap logique ici si nécessaire
  };

  const handleContinue = () => {
    router.push('/assessments/step4');
  };

  return (
    <GestureHandlerRootView style={styles.container}>
      <AssessmentHeader
        currentStep={3}
        totalSteps={7}
        onBack={() => router.back()}
      />

      <View style={styles.content}>
        <Text style={[SharedStyles.headingSmExtrabold, styles.question]}>
          How would you describe your mood?
        </Text>

        <MoodDisplay mood={MOODS[selectedMood]} />

        <MoodWheel
          moods={MOODS}
          selectedMood={selectedMood}
          onRotationUpdate={handleRotationUpdate}
          onRotationEnd={handleRotationEnd}
        />

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
    paddingHorizontal: 20,
    paddingTop: 30,
  },
  question: {
    textAlign: 'center',
    marginBottom: 40,
    color: '#2D3748',
  },
  continueButton: {
    backgroundColor: '#D53F8C',
    borderRadius: 25,
    paddingVertical: 18,
    alignItems: 'center',
    marginBottom: 40,
  },
  continueText: {
    fontSize: 18,
    color: 'white',
    fontWeight: '600',
  },
});