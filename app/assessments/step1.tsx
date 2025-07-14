import { Colors } from '@/constants/Colors';
import { Routes } from '@/constants/Routes';
import { SharedStyles } from '@/constants/SharedStyles';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import { Alert, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import AssessmentHeader from '../../components/ui/AssessmentHeader';
import GenderCard from '../../components/ui/GenderCard';
import { useAssessment } from '../../contexts/AssessmentContext';

export default function GenderScreen() {
  const router = useRouter();
  const { data, updateData } = useAssessment();
  const [selectedGender, setSelectedGender] = useState<'male' | 'female' | null>(data.gender || null);

  const handleGenderSelect = (gender: 'male' | 'female') => {
    setSelectedGender(gender);
    updateData('gender', gender);
  };

  const handleContinue = () => {
    if (selectedGender) {
      router.push(Routes.ASSESSMENTS.STEP2);
    } else {
      Alert.alert('Please select an option');
    }
  };

  const handleSkip = () => {
    router.push(Routes.ASSESSMENTS.STEP2);
  };

  return (
    <View style={styles.container}>
      <AssessmentHeader
        currentStep={1}
        totalSteps={7}
        onBack={() => router.back()}
      />

      <View style={styles.content}>
        <Text style={[SharedStyles.headingSmExtrabold, { textAlign: 'center' }]}>What's your official gender?</Text>

        <View style={{ gap: 15 }}>
          <GenderCard
            gender="male"
            selectedGender={selectedGender}
            onGenderSelect={handleGenderSelect}
          />

          <GenderCard
            gender="female"
            selectedGender={selectedGender}
            onGenderSelect={handleGenderSelect}
          />
        </View>

        <View>
          <TouchableOpacity style={styles.skipButton} onPress={handleSkip}>
            <Text style={styles.skipText}>Prefer to skip, thanks ✕</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={[styles.continueButton, !selectedGender && styles.disabledButton]}
            onPress={handleContinue}
          >
            <Text style={styles.continueText}>Continue →</Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: Colors.light.background,
  },
  content: {
    flex: 1,
    paddingHorizontal: 20,
    paddingTop: 30,
    gap: 40,
  },
  question: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#2D3748',
    textAlign: 'center',
    marginBottom: 40,
  },
  skipButton: {
    backgroundColor: '#E6FFFA',
    borderRadius: 25,
    paddingVertical: 15,
    alignItems: 'center',
    marginBottom: 20,
  },
  skipText: {
    fontSize: 16,
    color: '#38A169',
    fontWeight: '500',
  },
  continueButton: {
    backgroundColor: '#D53F8C',
    borderRadius: 25,
    paddingVertical: 18,
    alignItems: 'center',
  },
  disabledButton: {
    backgroundColor: '#CBD5E0',
  },
  continueText: {
    fontSize: 18,
    color: 'white',
    fontWeight: '600',
  },
});