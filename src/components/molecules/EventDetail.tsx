import React from "react";
import {Error} from "../../types/Error";
import {BugsnagEvent} from "../../types/BugsnagEvent";
import {Card, Text} from "react-native-elements";

interface IProps {
    error: Error
    event: BugsnagEvent,
}

const EventDetail = ({error, event}: IProps) => {
    return (
        <Card title={error.message}>
            <Text h1>Foo</Text>
        </Card>
    );
};

export default EventDetail;
