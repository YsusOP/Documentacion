import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity, Image, Modal } from 'react-native';
import Discapa from "../agr-discapacidad/AGR-Discapacidad"
import Notifi from "../agr-notificacion/AGR-Notificacion"
import Rut from "../agr-rutina/AGR-Rutina"
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { NavigationContainer, useNavigation } from '@react-navigation/native';
const Tab = createBottomTabNavigator();

const LogoutScreen = () => {
  const navigation = useNavigation();
  return (
    <View style={styles.container}>
      <Text style={styles.X}>Estás seguro de que deseas cerrar la sesión?</Text>
      <TouchableOpacity onPress={() => {
        navigation.reset({
          routes: [{name:'Inicio'}],
        });
      }}>
        <Text style={styles.logoutButtonText}>Cerrar Sesión</Text>
      </TouchableOpacity>
    </View>
  );
};

const HomeScreen = () => {
  const navigation = useNavigation();
  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <View style={styles.circleButton}>
          <TouchableOpacity 
          style={styles.rightButton}
          onPress={() => navigation.navigate('Home')}>
            <Image
              source={require('../menu/casita.jpg')}
              style={styles.circleButtonImage}
            />
          </TouchableOpacity>
        </View>
      </View>
      <View style={styles.circleContainer}>
        <TouchableOpacity style={styles.buttonWithText}
        onPress={() => navigation.navigate('Discapacidad')}>
          <View style={styles.circle}>
            <Image
              source={require('../menu/ExercisePD.jpg')}
              style={styles.circleImage}
            />
            </View>
          <Text style={styles.circleText}>Añadir Discapacidad</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.buttonWithText}
        onPress={() => navigation.navigate('Rutina')}>
          <View style={styles.circle}>
            <Image
              source={require('../menu/Rutina.jpg')}
              style={styles.circleImage}
            />
            </View>
          <Text style={styles.circleText}>Añadir Rutina</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.buttonWithText}
        onPress={() => navigation.navigate('Notificacion')}>
          <View style={styles.circle}>            
            <Image
              source={require('../menu/Campana.jpg')}
              style={styles.circleImage}
            />
          </View>
          <Text style={styles.circleText}>Notificaciones</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}
const LeftScreen = () => (
  <View style={styles.container}>
  </View>
);
const Perfil = () => (
  <View style={styles.container}>
    <Text>Contenido de la pantalla derecha</Text>
  </View>
);
const Discapacidad = () => (
  <View style={styles.container}>
    <Discapa/>
  </View>
);
const Rutina = () => (
  <View style={styles.container}>
    <Rut/>
  </View>
);
const Notificacion = () => (
  <View style={styles.container}>
    <Notifi/>
  </View>
);

const App = () => (
<Tab.Navigator screenOptions={{headerShown: false,}}>
  <Tab.Screen
    name="Inicio"
    component={HomeScreen}
    options={{
      tabBarIcon: ({ focused }) => (
        <Image
          source={focused ? require('../menu/casita.jpg') : require('../menu/casita.jpg')}
          style={{ width: 35, height: 35 }}
        />
      )
    }}
  />
  <Tab.Screen
    name="Discapacidad"
    component={Discapacidad}
    options={{
      tabBarIcon: ({ focused }) => (
        <Image
          source={focused ? require('../menu/ExercisePD.jpg') : require('../menu/ExercisePD.jpg')}
          style={{ width: 35, height: 35 }}
        />
      )
    }}
  />
  <Tab.Screen
    name="Rutina"
    component={Rutina}
    options={{
      tabBarIcon: ({ focused }) => (
        <Image
          source={focused ? require('../menu/Rutina.jpg') : require('../menu/Rutina.jpg')}
          style={{ width: 35, height: 35 }}
        />
      )
    }}
  />
  <Tab.Screen
    name="Notificacion"
    component={Notificacion}
    options={{
      tabBarIcon: ({ focused }) => (
        <Image
          source={focused ? require('../menu/Campana.jpg') : require('../menu/Campana.jpg')}
          style={{ width: 35, height: 35}}
        />
      )
    }}
  />
  <Tab.Screen
        name="Cerrar Sesión"
        component={LogoutScreen}
        options={{
          tabBarIcon: ({ focused }) => (
            <Image
              source={focused ? require('../menu/X.jpg') : require('../menu/X.jpg')}
              style={{ width: 35, height: 35 }}
            />
          )
        }}
      />
</Tab.Navigator>

);

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    padding: 16,
    alignItems: 'center',
    backgroundColor: "#189FD9",
  },
  circleButton: {
    width: 50,
    height: 50,
    borderRadius: 25,
    overflow: 'hidden',
  },
  rightButton: {
    width: 50,
    height: 50,
    borderRadius: 25,
    overflow: 'hidden',
    backgroundColor: '#3498db',
  },
  circleButtonImage: {
    width: '100%',
    height: '100%',
  },
  circleContainer: {
    flexDirection: 'column',
    justifyContent: 'flex-end',
    alignItems: 'flex-start',
    flex: 1,
    margin: 20,
    marginBottom: 120,
  },
  buttonWithText: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    marginBottom: 20,
  },
  circle: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: '#3498db',
    overflow: 'hidden',
    marginRight: 10,
  },
  circleImage: {
    width: '100%',
    height: '100%',
  },
  circleText: {
    fontSize: 18,
    textAlign: 'center',
  },
  logoutButtonText: {
    fontSize: 30,
    textAlign: 'center',
  },
  X: {
    fontSize: 30,
    textAlign: 'center',
  },
});

export default App;