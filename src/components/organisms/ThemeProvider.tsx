import React, {FunctionComponent} from "react";
import {ThemeProvider as SCThemeProvider} from "styled-components";
import theme from "../../theme";

const ThemeProvider: FunctionComponent = ({children}) => {
    return (
        <SCThemeProvider theme={theme}>{children as React.ReactElement}</SCThemeProvider>
    );
};

export default ThemeProvider;
