import { Colors } from '@/constants/Colors'
import { SharedStyles } from '@/constants/SharedStyles'
import React from 'react'
import { Dimensions, Image, Modal, StyleSheet, Text, TouchableOpacity, View } from 'react-native'

interface ConsentModalProps {
  visible: boolean
  onClose: () => void
  onAccept: () => void
}

export default function ConsentModal({ visible, onClose, onAccept }: ConsentModalProps) {
  return (
    <Modal
      transparent
      visible={visible}
      animationType="fade"
      onRequestClose={onClose}
    >
      <View style={styles.overlay}>
        <View style={styles.card}>
          {/* Illustration */}
          <Image
            source={require('../../assets/images/consent.png')} // remplace par ton illustration locale
            style={styles.illustration}
            resizeMode="contain"
          />

          {/* Question */}
          <Text style={[SharedStyles.text2XlExtrabold, styles.title]}>
            Can I analyze your mood to personalize your experience?
          </Text>

          {/* Buttons */}
          <View style={styles.actions}>
            <TouchableOpacity style={styles.noBtn} onPress={onClose}>
              <Text style={styles.noText}>No thanks</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.yesBtn} onPress={onAccept}>
              <Text style={styles.yesText}>Yes, I'm okay</Text>
            </TouchableOpacity>
          </View>
        </View>
        {/* Close floating button */}
        <TouchableOpacity style={styles.fabClose} onPress={onClose}>
          <Text style={styles.closeIcon}>×</Text>
        </TouchableOpacity>
      </View>
    </Modal>
  )
}

const CARD_WIDTH = Dimensions.get('window').width * 0.85

const styles = StyleSheet.create({
  overlay: {
    flex: 1,
    backgroundColor: 'rgba(44, 44, 44, 0.40)', // semi-transparent
    justifyContent: 'center',
    alignItems: 'center',
  },
  card: {
    width: CARD_WIDTH,
    backgroundColor: 'white',
    borderRadius: 40,
    alignItems: 'center',
    padding: 28,
    shadowColor: '#000',
    shadowOpacity: 0.16,
    shadowRadius: 32,
    shadowOffset: { width: 0, height: 12 },
    elevation: 12,
  },
  illustration: {
    width: '100%',
    height: 260,
    marginBottom: 24,
  },
  title: {
    color: Colors.light.text,
    textAlign: 'center',
    marginBottom: 34,
  },
  actions: {
    flexDirection: 'row',
    width: '100%',
    justifyContent: 'space-between',
    marginTop: 10,
  },
  noBtn: {
    flex: 1,
    borderWidth: 1,
    borderColor: Colors.light.text,
    borderRadius: 30,
    paddingVertical: 14,
    marginRight: 12,
    backgroundColor: Colors.light.background,
  },
  noText: {
    textAlign: 'center',
    color: '#232044',
    fontWeight: 'bold',
    fontSize: 16,
  },
  yesBtn: {
    flex: 1,
    backgroundColor: Colors.light.purple,
    borderRadius: 30,
    paddingVertical: 14,
    marginLeft: 12,
  },
  yesText: {
    textAlign: 'center',
    color: '#fff',
    fontWeight: 'bold',
    fontSize: 16,
  },
  fabClose: {
    position: 'absolute',
    bottom: 70,
    alignSelf: 'center',
    width: 64,
    height: 64,
    borderRadius: 40,
    backgroundColor: '#fff',
    justifyContent: 'center',
    alignItems: 'center',
    elevation: 10,
    shadowColor: '#222',
    shadowOpacity: 0.16,
    shadowRadius: 10,
    shadowOffset: { width: 0, height: 3 },
  },
  closeIcon: {
    fontSize: 32,
    color: '#232044',
    fontWeight: 'bold',
    marginTop: -2,
  },
})
