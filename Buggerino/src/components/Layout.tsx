import styled from 'styled-components';
import {View} from 'react-native';
import {
  space,
  flexbox,
  FlexboxProps,
  SpaceProps,
  ColorProps,
  color,
  LayoutProps,
  layout,
  border,
  BorderProps,
} from 'styled-system';

interface Props
  extends FlexboxProps,
    SpaceProps,
    ColorProps,
    LayoutProps,
    BorderProps {}

export const Container = styled(View)<Props>`
  ${space}
  ${flexbox}
  ${color}
  ${layout}
  ${border}
`;
