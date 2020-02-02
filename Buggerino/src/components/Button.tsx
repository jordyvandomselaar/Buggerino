import React, {FunctionComponent} from 'react';
import {Container} from './Layout';
import {Text} from 'react-native';
import {RectButton, RectButtonProperties} from 'react-native-gesture-handler';
import styled from 'styled-components';

const StyledRectButton = styled(RectButton)`
  width: 100%;
  height: 50px;
  border: 1px solid;
  justify-content: center;
  align-items: center;
`;

interface Props extends RectButtonProperties {
  title: string;
}

const Button: FunctionComponent<Props> = ({title, ...props}) => {
  return (
    <StyledRectButton {...props}>
      <Text>{title}</Text>
    </StyledRectButton>
  );
};

export default Button;
