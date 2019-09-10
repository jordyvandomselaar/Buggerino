import React from "react";
import {View} from "react-native";
import {Text} from "react-native-elements";
import {NavigationScreenProps} from "react-navigation";
import ProjectSelector from "../organisms/ProjectSelector";
import ErrorSelector from "../organisms/ErrorSelector";

const ErrorListScreen = (props: NavigationScreenProps) => {
    return (
        <View>
            <ErrorSelector {...props}/>
        </View>
    );
};

ErrorListScreen.navigationOptions = {
    title: "Error list"
};

export default ErrorListScreen;
