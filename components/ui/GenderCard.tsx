import { SharedStyles } from '@/constants/SharedStyles';
import React from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from "react-native";

interface GenderCardProps {
  gender: 'male' | 'female';
  selectedGender: 'male' | 'female' | null;
  onGenderSelect: (gender: 'male' | 'female') => void;
}

export default function GenderCard({ gender, selectedGender, onGenderSelect }: Readonly<GenderCardProps>) {
  const genderData = {
    male: {
      text: 'I am Male',
      avatar: '👨🏽',
      symbol: '♂'
    },
    female: {
      text: 'I am Female',
      avatar: '👩🏽',
      symbol: '♀'
    }
  };

  const data = genderData[gender];

  return (
    <TouchableOpacity
      style={[
        styles.optionCard,
        selectedGender === gender && styles.selectedCard
      ]}
      onPress={() => onGenderSelect(gender)}
    >
      <View style={styles.optionContent}>
        <View style={styles.labelContent}>
          <Text style={SharedStyles.textMdbold}>{data.text}</Text>
          <Text style={styles.genderSymbol}>{data.symbol}</Text>
        </View>
        <Text style={styles.avatar}>{data.avatar}</Text>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  optionCard: {
    backgroundColor: 'white',
    borderRadius: 20,
    padding: 20,
    borderWidth: 2,
    borderColor: '#E2E8F0',
  },
  selectedCard: {
    borderColor: '#805AD5',
    backgroundColor: '#F7FAFC',
  },
  optionContent: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  labelContent: {
    flexDirection: 'column',
    justifyContent: 'space-between',
    gap: 50
  },
  optionText: {
    fontSize: 16,
    fontWeight: '500',
    color: '#2D3748',
  },
  avatarContainer: {
    flex: 1,
    alignItems: 'center',
  },
  avatar: {
    fontSize: 60,
  },
  genderSymbol: {
    fontSize: 24,
    color: '#718096',
  },
});