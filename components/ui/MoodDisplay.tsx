import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

interface MoodDisplayProps {
  mood: {
    label: string;
    color: string;
    emoji: string;
  };
}

export default function MoodDisplay({ mood }: MoodDisplayProps) {
  return (
    <View style={styles.container}>
      <Text style={styles.label}>I Feel {mood.label}.</Text>
      <View style={[styles.bigEmoji, { backgroundColor: mood.color }]}>
        <Text style={styles.bigEmojiText}>{mood.emoji}</Text>
      </View>
      <Text style={styles.arrowDown}>⌄</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    marginBottom: 60,
  },
  label: {
    fontSize: 18,
    color: '#718096',
    fontWeight: '600',
    marginBottom: 20,
  },
  bigEmoji: {
    width: 90,
    height: 90,
    borderRadius: 45,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 15,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.2,
    shadowRadius: 8,
    elevation: 5,
  },
  bigEmojiText: {
    fontSize: 50,
  },
  arrowDown: {
    fontSize: 24,
    color: '#A0AEC0',
  },
});
