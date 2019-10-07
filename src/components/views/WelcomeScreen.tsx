import React, {FunctionComponent, useEffect} from "react";
import {SafeAreaView, View} from "react-native";
import {Text} from "react-native-elements"
import {NavigationDrawerScreenComponent, NavigationDrawerScreenProps} from "react-navigation-drawer";

const WelcomeScreen: FunctionComponent<NavigationDrawerScreenProps> = () => {
    return (
        <SafeAreaView>
            <Text>Hi!</Text>
        </SafeAreaView>
    );
};

export default WelcomeScreen;
