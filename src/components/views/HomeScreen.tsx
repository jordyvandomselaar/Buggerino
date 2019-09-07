import React from "react";
import {View} from "react-native";
import {Text} from "react-native-elements";
import OrganizationSelector from "../organisms/OrganizationSelector";
import {NavigationScreenProps} from "react-navigation";

const HomeScreen = (props: NavigationScreenProps) => {
    return (
        <View>
            <Text>Welcome to Buggerino!</Text>
            <Text>Please start by selecting an organization</Text>
            <OrganizationSelector {...props}/>
        </View>
    );
};

export default HomeScreen;
