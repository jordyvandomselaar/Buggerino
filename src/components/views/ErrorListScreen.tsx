import React from "react";
import {View} from "react-native";
import {NavigationStackScreenComponent} from "react-navigation-stack"
import ErrorSelector from "../organisms/ErrorSelector";

const ErrorListScreen: NavigationStackScreenComponent = props => {
    return (
        <View>
            <ErrorSelector {...props}/>
        </View>
    );
};

ErrorListScreen.navigationOptions = {
    title: "Errors"
};

export default ErrorListScreen;
