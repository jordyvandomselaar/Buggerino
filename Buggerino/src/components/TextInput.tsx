import React, {FunctionComponent} from 'react';
import {
  View,
  TextInput as RNTextInput,
  TextInputProps,
  Text,
} from 'react-native';
import styled from 'styled-components';
import {Container} from './Layout';

const StyledTextInput = styled(RNTextInput)`
  border: 1px solid #b9b9b9;
  padding: 10px;
  border-radius: 5px;
`;

const Label = styled(Text)``;

interface Props extends TextInputProps {
  label: string;
}

const TextInput: FunctionComponent<Props> = ({label, ...props}) => {
  return (
    <View>
      <Container>
        <Label>{label}</Label>
      </Container>
      <StyledTextInput {...props} />
    </View>
  );
};

export default TextInput;
