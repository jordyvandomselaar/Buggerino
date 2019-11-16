import React from "react";
import OrganizationList from "../molecules/OrganizationList";
import {useSelector} from "react-redux";
import {AppState} from "../../store";
import {Organization} from "../../types/Organization";
import {NavigationStackScreenComponent} from "react-navigation-stack"
import {AsyncStorage} from "react-native";

const OrganizationSelector: NavigationStackScreenComponent = ({navigation}) => {
    const organizations = useSelector<AppState, Organization[]>(state => state.organizations.organizations);

    const handleRedirect = (organizationId: string) => navigation.navigate("ProjectList", {organizationId});

    AsyncStorage.getItem("organizationId").then(organizationId => {
        if(organizationId) {
            handleRedirect(organizationId);
        }
    });

    return (
        <OrganizationList organizations={organizations}
                          onSelectOrganization={handleRedirect}/>
    );
};

export default OrganizationSelector;
