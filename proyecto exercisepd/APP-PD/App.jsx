import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import LoginScreen from "./src/views/Login/Login";
import Registro from './src/views/formulario/formulario';
import Menu from './src/views/menu/menu';
import Notificaciones from './src/views/agr-notificacion/AGR-Notificacion';
import Discapacidades from './src/views/agr-discapacidad/AGR-Discapacidad';
import Rutina from "./src/views/agr-rutina/AGR-Rutina";
import Cuerpo from './src/views/usuario-Dis/user-Discapacidad';
import Rutinas from './src/views/usuario-Rut/user-Rutina';
import Notificacion from './src/views/usuario-Not/user-Notificacion';

const Stack = createNativeStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <>
          <Stack.Screen name="Inicio" component={LoginScreen} />
          <Stack.Screen name="Registro" component={Registro} />
          <Stack.Screen name="Menu" component={Menu} />
          <Stack.Screen name="Notificaciones" component={Notificaciones} />
          <Stack.Screen name="Discapacidades" component={Discapacidades} />
          <Stack.Screen name="Rutina" component={Rutina} />
          <Stack.Screen name="Cuerpo" component={Cuerpo} />
          <Stack.Screen name="Rutinas" component={Rutinas} />
          <Stack.Screen name="Notificacion" component={Notificacion} />


        </>
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
