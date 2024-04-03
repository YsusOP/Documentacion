import React, { useState } from 'react';
import { View, Button, Platform, StyleSheet, Alert } from 'react-native';
import DateTimePicker from '@react-native-community/datetimepicker';
import { Input } from 'react-native-elements';
import axios from 'axios';

const App = () => {
  const [nombreNotificacion, setNombreNotificacion] = useState('');
  const [fecha, setFecha] = useState(new Date());
  const [mensaje, setMensaje] = useState('');
  const [showDatePicker, setShowDatePicker] = useState(false);

  const handleChangeDate = (event, selectedDate) => {
    if (Platform.OS === 'android') {
      setShowDatePicker(true);
      setFecha(selectedDate || fecha);
    }
  };

  const handleEnviar = async () => {
    try {
      const formData = new FormData();
      formData.append('Nombre', nombreNotificacion);
      formData.append('Fecha', formatDate(new Date())); // Enviar la fecha actual formateada
      formData.append('Descripcion', mensaje);

      const response = await axios.post('http://127.0.0.1:5000/subir_notificacion', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      });

      if (response.status === 200) {
        console.log('La notificación se subió correctamente');
        Alert.alert('Éxito', 'La notificación se subió correctamente');
      } else {
        console.log('La solicitud falló con código:', response.status);
      }
    } catch (error) {
      console.error('Error en la solicitud:', error);
      Alert.alert('Error', 'Hubo un error al enviar la notificación');
    }
  };

  const formatDate = (date) => {
    const year = date.getFullYear();
    let month = date.getMonth() + 1;
    let day = date.getDate();

    // Asegurar que el mes y el día tengan dos dígitos
    month = month < 10 ? '0' + month : month;
    day = day < 10 ? '0' + day : day;

    return `${year}-${month}-${day}`;
  };

  const getFechaMinima = () => {
    const fechaActual = new Date();
    return fechaActual;
  };

  return (
    <View style={styles.container}>
      <View style={styles.body}>
        <Input
          label="Nombre de notificación"
          placeholder="Ingresa el nombre de la notificación"
          value={nombreNotificacion}
          onChangeText={(text) => setNombreNotificacion(text)}
        />
        {showDatePicker && Platform.OS === 'android' && (
          <DateTimePicker
            testID="dateTimePicker"
            value={fecha}
            minimumDate={getFechaMinima()}
            mode="date"
            is24Hour={true}
            display="default"
            onChange={(event, selectedDate) => handleChangeDate(event, selectedDate)}
          />
        )}
        <Input
          label="Mensaje"
          placeholder="Escribe tu mensaje"
          multiline
          numberOfLines={4}
          value={mensaje}
          onChangeText={(text) => setMensaje(text)}
        />
        <Button title="Enviar" onPress={handleEnviar} />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  body: {
    flex: 1,
    padding: 20,
    justifyContent: 'center',
  },
});

export default App;