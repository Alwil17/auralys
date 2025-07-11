import { Routes } from '@/constants/Routes';
import { SharedStyles } from '@/constants/SharedStyles';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import Animated, { useAnimatedStyle, useSharedValue, withSpring } from 'react-native-reanimated';
import AssessmentHeader from '../../components/ui/AssessmentHeader';
import { useAssessment } from '../../contexts/AssessmentContext';
import ConsentModal from './step6';

const STRESS_LEVELS = [
  { value: 1, label: 'Very Low', color: '#4ECDC4' },
  { value: 2, label: 'Low', color: '#45B7D1' },
  { value: 3, label: 'Moderate', color: '#96CEB4' },
  { value: 4, label: 'High', color: '#FECA57' },
  { value: 5, label: 'Extremely Stressed Out', color: '#FF6B6B' },
];

export default function StressLevelScreen() {
  const router = useRouter();
  const { updateData } = useAssessment();
  const [selectedLevel, setSelectedLevel] = useState(5);
  const [showConsentModal, setShowConsentModal] = useState(false);

  
  const scale = useSharedValue(1);
  const opacity = useSharedValue(1);

  const handleLevelSelect = (level: number) => {
    setSelectedLevel(level);
    updateData('stressLevel', level);
    
    // Animation pour le grand chiffre
    scale.value = withSpring(0.8, { duration: 100 }, () => {
      scale.value = withSpring(1.1, { duration: 150 }, () => {
        scale.value = withSpring(1, { duration: 200 });
      });
    });
    
    // Animation d'opacité
    opacity.value = withSpring(0.7, { duration: 100 }, () => {
      opacity.value = withSpring(1, { duration: 200 });
    });
  };

  const handleContinue = () => {
    setShowConsentModal(true);
  };

  // callback si l’utilisateur accepte
  const handleAcceptConsent = () => {
    setShowConsentModal(false);
    router.push(Routes.ASSESSMENTS.STEP7); // ou prochaine étape
  };

  // callback si l’utilisateur refuse ou ferme
  const handleCloseConsent = () => {
    setShowConsentModal(false);
    // tu peux router ailleurs ou juste fermer le modal
  };

  const animatedNumberStyle = useAnimatedStyle(() => ({
    transform: [{ scale: scale.value }],
    opacity: opacity.value,
  }));

  const selectedStressLevel = STRESS_LEVELS.find(level => level.value === selectedLevel);

  return (
    <View style={styles.container}>
      <AssessmentHeader
        currentStep={5}
        totalSteps={7}
        onBack={() => router.back()}
      />
      
      <View style={styles.content}>
        <Text style={[SharedStyles.headingSmExtrabold, styles.question]}>
          How would you rate your stress level?
        </Text>
        
        <View style={styles.numberContainer}>
          <Animated.Text 
            style={[
              styles.bigNumber, 
              { color: selectedStressLevel?.color || '#3D4852' },
              animatedNumberStyle
            ]}
          >
            {selectedLevel}
          </Animated.Text>
        </View>

        <View style={styles.levelsContainer}>
          {STRESS_LEVELS.map((level) => {
            const isSelected = selectedLevel === level.value;
            
            return (
              <TouchableOpacity
                key={level.value}
                style={[
                  styles.levelButton,
                  isSelected && {
                    backgroundColor: level.color,
                    transform: [{ scale: 1.2 }],
                    elevation: 8,
                    shadowColor: level.color,
                    shadowOffset: { width: 0, height: 4 },
                    shadowOpacity: 0.3,
                    shadowRadius: 8,
                  }
                ]}
                onPress={() => handleLevelSelect(level.value)}
                activeOpacity={0.8}
              >
                <Animated.Text style={[
                  styles.levelText,
                  isSelected && styles.selectedLevelText
                ]}>
                  {level.value}
                </Animated.Text>
              </TouchableOpacity>
            );
          })}
        </View>

        <View style={styles.descriptionContainer}>
          <Text style={[
            styles.descriptionText,
            { color: selectedStressLevel?.color || '#718096' }
          ]}>
            {selectedStressLevel?.label}
          </Text>
        </View>

        <TouchableOpacity 
          style={[
            styles.continueButton,
            { backgroundColor: selectedStressLevel?.color || '#D53F8C' }
          ]}
          onPress={handleContinue}
          activeOpacity={0.9}
        >
          <Text style={styles.continueText}>Continue →</Text>
        </TouchableOpacity>
      </View>

      <ConsentModal
        visible={showConsentModal}
        onClose={handleCloseConsent}
        onAccept={handleAcceptConsent}
      />
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
    alignItems: 'center',
  },
  question: {
    textAlign: 'center',
    marginBottom: 40,
    paddingHorizontal: 10,
  },
  numberContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: -60,
  },
  bigNumber: {
    fontSize: 180,
    fontWeight: '900',
    lineHeight: 200,
    textShadowColor: 'rgba(0, 0, 0, 0.1)',
    textShadowOffset: { width: 0, height: 2 },
    textShadowRadius: 4,
  },
  levelsContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    width: '100%',
    marginBottom: 30,
    paddingHorizontal: 5,
    alignItems: 'center',
  },
  levelButton: {
    width: 56,
    height: 56,
    borderRadius: 28,
    backgroundColor: '#E2E8F0',
    justifyContent: 'center',
    alignItems: 'center',
    borderWidth: 2,
    borderColor: 'transparent',
  },
  levelText: {
    fontSize: 20,
    fontWeight: '700',
    color: '#718096',
  },
  selectedLevelText: {
    color: 'white',
    fontWeight: '800',
  },
  descriptionContainer: {
    minHeight: 50,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 40,
  },
  descriptionText: {
    fontSize: 18,
    textAlign: 'center',
    fontWeight: '600',
    letterSpacing: 0.5,
  },
  continueButton: {
    borderRadius: 30,
    paddingVertical: 18,
    paddingHorizontal: 40,
    width: '100%',
    alignItems: 'center',
    marginBottom: 40,
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 8,
  },
  continueText: {
    fontSize: 18,
    color: 'white',
    fontWeight: '700',
    letterSpacing: 1,
  },
});