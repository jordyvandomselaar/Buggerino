import React from "react";
import {View} from "react-native";
import {Input, Text} from "react-native-elements";
import {NavigationScreenComponent, NavigationScreenProps} from "react-navigation";
import styled, {css} from "styled-components";
import {NavigationStackOptions} from "react-navigation-stack/lib/typescript/types";
import theme from "../../theme";

const Wrapper = styled(View)`
  padding: 50px 20px;
  background-color: ${props => props.theme.colours.primary};
  flex: 1;
  color: #FFF;
`;

const LoginScreen: NavigationScreenComponent<{}, NavigationStackOptions, NavigationScreenProps> = () => {
    return (
        <Wrapper>
            <Text h1>Welcome to Buggerino!</Text>
            <Text>Please log in with your Bugsnag credentials to get started</Text>
            <Input placeholder="Username"/>
            <Input placeholder="Password"/>
        </Wrapper>
    );
};

LoginScreen.navigationOptions = {
    headerStyle: {
        backgroundColor: theme.colours.primary,
    },
}

export default LoginScreen;
