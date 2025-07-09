import { View, ViewStyle } from "react-native";
import Svg, { Circle } from "react-native-svg";

type CircleHeaderProps = {
    customStyles?: ViewStyle;
};

export default function CircleHeader({ customStyles }: CircleHeaderProps) {
    return (
        <View style={{position: 'absolute', top: 0, left: 0, right: 0, height: 200}}>
            <Svg height="80%"
                width="100%"
                viewBox="0 0 375 160">
                <Circle cx="188" cy="-320" r="480" fill="#E876DB" />
            </Svg>
        </View>
    );
}