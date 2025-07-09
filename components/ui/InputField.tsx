import { SharedStyles } from '@/constants/SharedStyles';
import { Feather } from '@expo/vector-icons';
import { StyleSheet, Text, TextInput, TextInputProps, View } from 'react-native';

type InputFieldProps = {
    icon: React.ComponentProps<typeof Feather>['name'];
    label?: string;
} & TextInputProps;

/**
 * InputField is a simple component that wraps a TextInput and provides
 * a label and an icon. The label is rendered above the TextInput, and
 * the icon is rendered inside the TextInput.
 * @param icon The name of the icon from the Feather library.
 * @param label The label to render above the TextInput.
 * @param props Other props to pass to TextInput.
 * @returns A View that contains the label, icon, and TextInput.
 */
export default function InputField({ icon, label, ...props }: InputFieldProps) {
    return (
        <View style={styles.container}>
            {label && <Text style={SharedStyles.textSmExtrabold}>{label}</Text>}
            <View style={styles.inputWrapper}>
                <Feather name={icon} size={20} color="#7D7D7D" />
                <TextInput
                    style={[SharedStyles.textMdbold, {marginLeft: 8 }]}
                    placeholderTextColor="#999"
                    {...props}
                />
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flexDirection: 'column',
        width: '100%',
        gap: 8
    },
    inputWrapper: {
        flexDirection: 'row',
        alignItems: 'center',
        backgroundColor: '#F8F8F8',
        paddingHorizontal: 14,
        borderRadius: 24,
        height: 52,
        marginBottom: 16,
        borderColor: '#eee',
        borderWidth: 1,
    }
}); 
