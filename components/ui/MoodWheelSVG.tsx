import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import Svg, { Path } from 'react-native-svg';

interface MoodWheelSVGProps {
  moods: any[];
  selectedMood: number;
}

const RADIUS = 140;
const TAU = 2 * Math.PI;

function polarToCartesian(cx: number, cy: number, r: number, angle: number) {
  return {
    x: cx + r * Math.cos(angle),
    y: cy + r * Math.sin(angle),
  };
}

function describeArc(cx: number, cy: number, r: number, startAngle: number, endAngle: number) {
  const start = polarToCartesian(cx, cy, r, startAngle);
  const end = polarToCartesian(cx, cy, r, endAngle);
  const largeArcFlag = endAngle - startAngle <= Math.PI ? '0' : '1';

  return [
    `M${cx},${cy}`,
    `L${start.x},${start.y}`,
    `A${r},${r} 0 ${largeArcFlag} 1 ${end.x},${end.y}`,
    `Z`
  ].join(' ');
}

export default function MoodWheelSVG({ moods, selectedMood }: MoodWheelSVGProps) {
  const arc = TAU / moods.length;

  const generateSections = () => {
    return moods.map((mood, index) => {
      const startAngle = arc * index;
      const endAngle = arc * (index + 1);
      const middleAngle = startAngle + arc / 2;
      
      const emojiRadius = RADIUS * 0.7;
      const emojiPos = polarToCartesian(0, 0, emojiRadius, middleAngle);

      return {
        ...mood,
        startAngle,
        endAngle,
        middleAngle,
        emojiPos,
        index,
      };
    });
  };

  const sections = generateSections();

  return (
    <>
      <Svg
        width={RADIUS * 2}
        height={RADIUS * 2}
        style={styles.svg}
        viewBox={`0 0 ${RADIUS * 2} ${RADIUS * 2}`}
      >
        {sections.map((section) => (
          <Path
            key={section.index}
            d={describeArc(RADIUS, RADIUS, RADIUS - 5, section.startAngle, section.endAngle)}
            fill={section.color}
            opacity={selectedMood === section.index ? 1 : 0.6}
            stroke="white"
            strokeWidth="2"
          />
        ))}
      </Svg>

      {sections.map((section) => (
        <View
          key={`emoji-${section.index}`}
          style={[
            styles.emojiCircle,
            {
              left: RADIUS + section.emojiPos.x - 25,
              top: RADIUS + section.emojiPos.y - 25,
              transform: [{ scale: selectedMood === section.index ? 1.2 : 1 }],
            }
          ]}
        >
          <Text style={styles.emojiText}>{section.emoji}</Text>
        </View>
      ))}
    </>
  );
}

const styles = StyleSheet.create({
  svg: {
    position: 'absolute',
  },
  emojiCircle: {
    position: 'absolute',
    width: 50,
    height: 50,
    borderRadius: 25,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'white',
    borderWidth: 2,
    borderColor: '#E2E8F0',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 4,
    elevation: 3,
  },
  emojiText: {
    fontSize: 28,
  },
});
