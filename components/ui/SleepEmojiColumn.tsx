import React, { useEffect } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import Animated, { useAnimatedStyle, useSharedValue, withSpring } from 'react-native-reanimated';

interface SleepEmojiColumnProps {
  sleepLevels: any[];
  selectedIndex: number;
  onSelection: (index: number) => void;
}

export default function SleepEmojiColumn({ sleepLevels, selectedIndex, onSelection }: SleepEmojiColumnProps) {
  return (
    <View style={styles.rightColumn}>
      {sleepLevels.map((item, index) => {
        const isSelected = selectedIndex === index;
        const scale = useSharedValue(isSelected ? 1.2 : 1);
        
        useEffect(() => {
          scale.value = withSpring(selectedIndex === index ? 1.2 : 1);
        }, [selectedIndex]);
        
        const animatedEmojiStyle = useAnimatedStyle(() => ({
          transform: [{ scale: scale.value }],
        }));

        return (
          <TouchableOpacity
            key={index}
            style={[
              styles.emojiCircle,
              {
                backgroundColor: item.color,
                opacity: isSelected ? 1 : 0.6,
              },
            ]}
            onPress={() => onSelection(index)}
          >
            <Animated.View style={animatedEmojiStyle}>
              <Text style={styles.emojiText}>{item.emoji}</Text>
            </Animated.View>
          </TouchableOpacity>
        );
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  rightColumn: {
    flex: 1,
    alignItems: 'flex-end',
  },
  emojiCircle: {
    width: 52,
    height: 52,
    borderRadius: 30,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 25,
    marginLeft: 10,
  },
  emojiText: {
    fontSize: 23,
    fontWeight: 'bold',
    color: '#fff',
    textAlign: 'center',
  },
});
