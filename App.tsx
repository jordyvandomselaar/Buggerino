import React from "react";
import {Header} from "react-native-elements";
import {View} from "react-native";
import OrganizationSelector from "./src/components/views/OrganizationSelector";

const App = () => {
    return (
        <View>
            <Header
                leftComponent={{icon: 'menu', color: '#fff'}}
                centerComponent={{text: 'Buggerino', style: {color: '#fff'}}}
            />

            <OrganizationSelector/>
        </View>
    );
};

export default App;
