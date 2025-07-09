import { SharedStyles } from '@/constants/SharedStyles';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import AssessmentHeader from '../../components/ui/AssessmentHeader';
import { useAssessment } from '../../contexts/AssessmentContext';

const ages = [16, 17, 18, 19, 20];

export default function AgeScreen() {
  const router = useRouter();
  const { data, updateData } = useAssessment();
  const [selectedAge, setSelectedAge] = useState<number | null>(data.age || null);

  const handleAgeSelect = (age: number) => {
    setSelectedAge(age);
    updateData('age', age);
  };

  const handleContinue = () => {
    // Ici vous pouvez rediriger vers la prochaine question ou terminer l'assessment
    router.push('/welcome');
  };

  return (
    <View style={styles.container}>
      <AssessmentHeader
        currentStep={2}
        totalSteps={7}
        onBack={() => router.back()}
      />
      
      <View style={styles.content}>
        <Text style={[SharedStyles.headingSmExtrabold, { textAlign: 'center' }]}>What's your age?</Text>
        
        <View style={styles.agesContainer}>
          {ages.map((age) => (
            <TouchableOpacity
              key={age}
              style={[
                styles.ageOption,
                selectedAge === age && styles.selectedAge
              ]}
              onPress={() => handleAgeSelect(age)}
            >
              <Text style={[
                styles.ageText,
                selectedAge === age && styles.selectedAgeText
              ]}>
                {age}
              </Text>
            </TouchableOpacity>
          ))}
        </View>

        <TouchableOpacity 
          style={[styles.continueButton, !selectedAge && styles.disabledButton]} 
          onPress={handleContinue}
          disabled={!selectedAge}
        >
          <Text style={styles.continueText}>Continue →</Text>
        </TouchableOpacity>
      </View>
    </View>
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
    gap: 40,
  },
  agesContainer: {
    alignItems: 'center',
    gap: 20,
    marginBottom: 60,
  },
  ageOption: {
    backgroundColor: '#E2E8F0',
    borderRadius: 30,
    paddingHorizontal: 40,
    paddingVertical: 15,
    minWidth: 100,
    alignItems: 'center',
  },
  selectedAge: {
    backgroundColor: '#68D391',
  },
  ageText: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#718096',
  },
  selectedAgeText: {
    color: 'white',
  },
  continueButton: {
    backgroundColor: '#D53F8C',
    borderRadius: 25,
    paddingVertical: 18,
    alignItems: 'center',
    marginTop: 'auto',
    marginBottom: 40,
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
