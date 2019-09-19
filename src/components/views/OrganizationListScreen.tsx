import React from "react";
import {View} from "react-native";
import {Text, Button} from "react-native-elements";
import OrganizationSelector from "../organisms/OrganizationSelector";
import {NavigationScreenProps} from "react-navigation";

const OrganizationListScreen = (props: NavigationScreenProps) => {
    return (
        <View>
            <Text h3>Welcome to Buggerino!</Text>
            <Text h4>Please start by selecting an organization</Text>
            <OrganizationSelector {...props}/>
        </View>
    );
};

export default OrganizationListScreen;
