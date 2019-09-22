import React from "react";
import {View} from "react-native";
import {Button, Input, Text} from "react-native-elements";
import {NavigationScreenComponent, NavigationScreenProps} from "react-navigation";
import styled from "styled-components";
import {NavigationStackOptions} from "react-navigation-stack/lib/typescript/types";
import {useDispatch, useSelector} from "react-redux";
import {setPassword, setUsername} from "../../store/user/actions";
import {AppState} from "../../store";

const Wrapper = styled(View)`
  padding: 50px 20px;
  flex: 1;
`;

const FormWrapper = styled(View)`
    padding-top: 20px;
    padding-bottom: 20px;
`;

const ContentWrapper = styled(View)`
  padding-top: 20px;
`;

const LoginScreen: NavigationScreenComponent<{}, NavigationStackOptions, NavigationScreenProps> = () => {
    const dispatch = useDispatch();
    const username = useSelector<AppState, string>(state => state.user.username);
    const password = useSelector<AppState, string>(state => state.user.password);

    return (
        <Wrapper>
            <Text h1>Welcome to Buggerino!</Text>
            <ContentWrapper>
                <Text>Please log in with your Bugsnag credentials to get started.</Text>
            </ContentWrapper>
            <FormWrapper>
                <Input label="Username" value={username} onChangeText={username => dispatch(setUsername(username))}/>
                <Input label="Password" value={password} onChangeText={password => dispatch(setPassword(password))}
                       secureTextEntry/>
            </FormWrapper>
            <Button title="Login"/>
        </Wrapper>
    );
};


export default LoginScreen;
