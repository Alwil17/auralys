import { Colors } from '@/constants/Colors';
import { SharedStyles } from '@/constants/SharedStyles';
import { Ionicons } from '@expo/vector-icons';
import React from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';

interface AssessmentHeaderProps {
  currentStep: number;
  totalSteps: number;
  onBack: () => void;
}

export default function AssessmentHeader({ currentStep, totalSteps, onBack }: Readonly<AssessmentHeaderProps>) {
  return (
    <View style={styles.header}>
      <TouchableOpacity onPress={onBack} style={styles.backButton}>
        <Ionicons name="chevron-back" size={24} color="#2D3748" />
      </TouchableOpacity>
      <Text style={styles.title}>Assessment</Text>
      <View style={styles.progressContainer}>
        <Text style={SharedStyles.textSmbold}>{currentStep} of {totalSteps}</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    paddingVertical: 15,
    backgroundColor: '#FFF9F6',
  },
  backButton: {
    padding: 5,
  },
  title: {
    fontSize: 18,
    fontWeight: '600',
    color: '#2D3748',
  },
  progressContainer: {
    backgroundColor: Colors.light.secondaryBackground,
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 30,
  },
});
