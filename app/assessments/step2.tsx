import { Routes } from '@/constants/Routes';
import { SharedStyles } from '@/constants/SharedStyles';
import { useRouter } from 'expo-router';
import React, { useRef, useState } from 'react';
import { Dimensions, ScrollView, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import AssessmentHeader from '../../components/ui/AssessmentHeader';
import { useAssessment } from '../../contexts/AssessmentContext';

const ages = Array.from({ length: 85 }, (_, i) => i + 16); // Ages de 16 à 100
const { height: screenHeight } = Dimensions.get('window');
const ITEM_HEIGHT = 60;
const VISIBLE_ITEMS = 5;

export default function AgeScreen() {
  const router = useRouter();
  const { data, updateData } = useAssessment();
  const [selectedAge, setSelectedAge] = useState<number | null>(data.age || null);
  const scrollViewRef = useRef<ScrollView>(null);
  const [scrollY, setScrollY] = useState(0);

  const handleAgeSelect = (age: number) => {
    setSelectedAge(age);
    updateData('age', age);
  };

  const handleContinue = () => {
    // Ici vous pouvez rediriger vers la prochaine question ou terminer l'assessment
    router.push(Routes.ASSESSMENTS.STEP3);
  };

  const renderAgeItem = (age: number, index: number) => {
    const inputRange = [
      (index - 2) * ITEM_HEIGHT,
      (index - 1) * ITEM_HEIGHT,
      index * ITEM_HEIGHT,
      (index + 1) * ITEM_HEIGHT,
      (index + 2) * ITEM_HEIGHT,
    ];

    // Calculer l'opacité et l'échelle basée sur la position
    const centerPosition = index * ITEM_HEIGHT;
    const distance = Math.abs(scrollY - centerPosition);
    const maxDistance = ITEM_HEIGHT * 2;
    
    const opacity = Math.max(0.3, 1 - (distance / maxDistance));
    const scale = Math.max(0.7, 1 - (distance / (maxDistance * 2)));

    return (
      <TouchableOpacity
        key={age}
        style={[
          styles.ageItem,
          {
            opacity,
            transform: [{ scale }],
          },
          selectedAge === age && styles.selectedAgeItem
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
    );
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
        
        <View style={styles.scrollContainer}>
          {/* Overlay gradients pour l'effet de fade */}
          <View style={styles.topGradient} />
          <View style={styles.bottomGradient} />
          
          {/* Ligne de sélection centrale */}
          <View style={styles.selectionLine} />
          
          <ScrollView
            ref={scrollViewRef}
            style={styles.ageScrollView}
            contentContainerStyle={styles.scrollContent}
            showsVerticalScrollIndicator={false}
            snapToInterval={ITEM_HEIGHT}
            decelerationRate="fast"
            onScroll={(event) => {
              setScrollY(event.nativeEvent.contentOffset.y);
            }}
            scrollEventThrottle={16}
            contentInsetAdjustmentBehavior="never"
          >
            {/* Espacement du haut */}
            <View style={{ height: ITEM_HEIGHT * 2 }} />
            
            {ages.map((age, index) => renderAgeItem(age, index))}
            
            {/* Espacement du bas */}
            <View style={{ height: ITEM_HEIGHT * 2 }} />
          </ScrollView>
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
  scrollContainer: {
    height: ITEM_HEIGHT * VISIBLE_ITEMS,
    position: 'relative',
    alignItems: 'center',
  },
  ageScrollView: {
    width: 120,
    height: ITEM_HEIGHT * VISIBLE_ITEMS,
  },
  scrollContent: {
    alignItems: 'center',
  },
  ageItem: {
    height: ITEM_HEIGHT,
    justifyContent: 'center',
    alignItems: 'center',
    width: 100,
  },
  selectedAgeItem: {
    backgroundColor: 'rgba(104, 211, 145, 0.2)',
    borderRadius: 15,
  },
  ageText: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#2D3748',
  },
  selectedAgeText: {
    color: '#68D391',
  },
  topGradient: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    height: ITEM_HEIGHT * 2,
    backgroundColor: 'rgba(255, 249, 246, 0.9)',
    zIndex: 1,
    pointerEvents: 'none',
  },
  bottomGradient: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    height: ITEM_HEIGHT * 2,
    backgroundColor: 'rgba(255, 249, 246, 0.9)',
    zIndex: 1,
    pointerEvents: 'none',
  },
  selectionLine: {
    position: 'absolute',
    top: ITEM_HEIGHT * 2,
    left: 0,
    right: 0,
    height: ITEM_HEIGHT,
    borderTopWidth: 1,
    borderBottomWidth: 1,
    borderColor: 'rgba(104, 211, 145, 0.3)',
    zIndex: 1,
    pointerEvents: 'none',
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
