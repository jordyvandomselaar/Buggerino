import React from "react";
import {BugsnagError} from "../../types/BugsnagError";
import {ListItem, Text} from "react-native-elements";
import styled from "styled-components";
import {BugsnagEvent} from "../../types/BugsnagEvent";
import {View} from "react-native";

interface IProps {
    error: BugsnagError;
    event?: BugsnagEvent;
    onSelectError?: (errorId: string) => void;
    onSelectEvent?: (errorId: string) => void;
    type?: "event" | "error"
}

const ErrorClass = styled(Text)`
  font-weight: bold;
`;

const Subtitle = styled(Text)`
    color: grey;
    font-size: 13px;
`;

const Title = styled(Text)`
  font-size: 20px;
`;

const ErrorItem = ({error, onSelectError, event, onSelectEvent, type = "error"}: IProps) => {
    if (!!onSelectEvent && !event) {
        throw new Error("Cannot use onSelectEvent without event");
    }

    const rightSubtitle = (new Date(!!event ? event.received_at : error.last_seen)).toLocaleString();

    return (
        <ListItem
            title={<Title><ErrorClass>{error.error_class} </ErrorClass>{error.context}</Title>}
            subtitle={
                <View>
                    <Text>{error.message}</Text>
                    {type === "error" && <Subtitle>{error.events} all time events</Subtitle>}
                </View>
            }
            rightSubtitle={rightSubtitle}
            onPress={() => {
                if (!!onSelectError) {
                    onSelectError(error.id);
                }

                if (!!onSelectEvent) {
                    onSelectEvent(event.id);
                }
            }}
        />
    );
};

export default ErrorItem;
