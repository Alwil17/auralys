import { Colors } from '@/constants/Colors';
import { SharedStyles } from '@/constants/SharedStyles';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import { StyleSheet, Text, TextInput, TouchableOpacity, View } from 'react-native';
import AssessmentHeader from '../../components/ui/AssessmentHeader';
import { useAssessment } from '../../contexts/AssessmentContext';

export default function NameScreen() {
  const router = useRouter();
  const { updateData } = useAssessment();
  const [name, setName] = useState('');

  const handleNameChange = (text: string) => {
    setName(text);
    updateData('name', text);
  };

  const handleContinue = () => {
    if (name.trim()) {
      // Aller vers l'écran de résultats ou terminer l'assessment
      router.push('/welcome');
    }
  };

  return (
    <View style={styles.container}>
      <AssessmentHeader
        currentStep={7}
        totalSteps={7}
        onBack={() => router.back()}
      />
      
      <View style={styles.content}>
        <Text style={[SharedStyles.headingSmExtrabold, styles.title]}>
          Want to know you !
        </Text>
        
        <View style={styles.subtitleContainer}>
          <Text style={[SharedStyles.paragraphMd, styles.subtitle]}>Please, tell me your name !!!</Text>
          <Text style={[SharedStyles.paragraphMd, styles.subtitle]}>How should I call you ?</Text>
        </View>

        <View style={styles.inputContainer}>
          <TextInput
            style={styles.textInput}
            value={name}
            onChangeText={handleNameChange}
            placeholder="Grey"
            placeholderTextColor={Colors.light.gray30}
            autoFocus={true}
            returnKeyType="done"
            onSubmitEditing={handleContinue}
          />
        </View>

        <TouchableOpacity 
          style={[
            styles.continueButton,
            !name.trim() && styles.disabledButton
          ]}
          onPress={handleContinue}
          disabled={!name.trim()}
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
    paddingTop: 40,
    alignItems: 'center',
  },
  title: {
    textAlign: 'center',
    marginBottom: 30,
    color: '#2D3748',
    fontSize: 32,
  },
  subtitleContainer: {
    alignItems: 'center',
    marginBottom: 60,
  },
  subtitle: {
    color: Colors.light.gray60,
    textAlign: 'center',
    lineHeight: 24,
  },
  inputContainer: {
    width: '100%',
    marginBottom: 60,
  },
  textInput: {
    backgroundColor: 'white',
    borderRadius: 30,
    paddingHorizontal: 25,
    paddingVertical: 18,
    fontSize: 30,
    borderWidth: 2,
    borderColor: '#E2E8F0',
    color: '#2D3748',
    fontWeight: '500',
    textAlign: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 3,
  },
  continueButton: {
    backgroundColor: '#D53F8C',
    borderRadius: 30,
    paddingVertical: 18,
    paddingHorizontal: 40,
    width: '100%',
    alignItems: 'center',
    marginTop: 'auto',
    marginBottom: 40,
    shadowColor: '#D53F8C',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 5,
  },
  disabledButton: {
    backgroundColor: '#CBD5E0',
    shadowOpacity: 0,
    elevation: 0,
  },
  continueText: {
    fontSize: 18,
    color: 'white',
    fontWeight: '700',
    letterSpacing: 1,
  },
});
