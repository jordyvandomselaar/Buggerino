import React from "react";
import OrganizationList from "../molecules/OrganizationList";
import {useSelector} from "react-redux";
import {AppState} from "../../store";
import {Organization} from "../../types/Organization";
import {NavigationScreenProps} from "react-navigation";

const OrganizationSelector = ({navigation}: NavigationScreenProps) => {
    const organizations = useSelector<AppState, Organization[]>(state => state.organizations.organizations);

    const handleRedirect = (organizationId: string) => navigation.navigate("ProjectList", {organizationId});

    return (
        <OrganizationList organizations={organizations}
                          onSelectOrganization={handleRedirect}/>
    );
};

export default OrganizationSelector;
