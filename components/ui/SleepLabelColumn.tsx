import { Colors } from '@/constants/Colors';
import React from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';

interface SleepLabelColumnProps {
  sleepLevels: any[];
  selectedIndex: number;
  onSelection: (index: number) => void;
  itemHeight: number;
}

export default function SleepLabelColumn({ sleepLevels, selectedIndex, onSelection, itemHeight }: SleepLabelColumnProps) {
  return (
    <View style={styles.leftColumn}>
      {sleepLevels.map((item, index) => (
        <TouchableOpacity
          key={index}
          style={[
            styles.labelItem,
            { 
              height: itemHeight,
            //   backgroundColor: selectedIndex === index ? item.bgColor : 'transparent' 
            }
          ]}
          onPress={() => onSelection(index)}
        >
          <Text style={[styles.labelText, selectedIndex === index && styles.selectedLabel]}>
            {item.label}
          </Text>
          <View style={styles.hoursContainer}>
            <Text style={styles.clockIcon}>🕐</Text>
            <Text style={[styles.hoursText, selectedIndex === index && styles.selectedHours]}>
              {item.hours}
            </Text>
          </View>
        </TouchableOpacity>
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  leftColumn: {
    flex: 1,
    alignItems: 'flex-start',
  },
  labelItem: {
    justifyContent: 'center',
    alignItems: 'flex-start',
    paddingVertical: 8,
    borderRadius: 15,
    marginBottom: 5,
  },
  labelText: {
    fontSize: 18,
    fontWeight: '600',
    color: '#A0AEC0',
    marginBottom: 2,
  },
  selectedLabel: {
    color: Colors.light.secondaryText,
    fontWeight: '700',
  },
  hoursContainer: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  clockIcon: {
    fontSize: 12,
    marginRight: 4,
  },
  hoursText: {
    fontSize: 12,
    color: '#A0AEC0',
    fontWeight: '500',
  },
  selectedHours: {
    color: Colors.light.secondaryText,
    fontWeight: '600',
  },
});
