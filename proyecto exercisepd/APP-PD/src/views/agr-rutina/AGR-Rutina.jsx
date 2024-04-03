import React, { useState, useEffect } from 'react';
import { View, Text, TextInput, Button, Alert, StyleSheet, Picker } from 'react-native';
import axios from 'axios';


const AdmRutina = () => {
  const [Nombre_Ejercicio, setNombreEjercicio] = useState('');
  const [Descripcion, setDescripcion] = useState('');
  const [DuracionMin, setDuracionMin] = useState('');
  const [Series, setSeries] = useState('');
  const [RepeticionesPorSerie, setRepeticionesPorSerie] = useState('');
  const [Discapacidad_idDiscapacidad, setDiscapacidadId] = useState('');
  const [discapacidades, setDiscapacidades] = useState([]);
  const [error, setError] = useState('');

  const handleSubmit = async () => {
    let isValid = true;

    if (Nombre_Ejercicio.trim() === '') {
      Alert.alert('Error', 'Por favor ingrese el nombre del ejercicio');
      isValid = false;
    }

    if (Descripcion.trim() === '') {
      Alert.alert('Error', 'Por favor ingrese la descripción del ejercicio');
      isValid = false;
    }

    if (DuracionMin.trim() === '' || !/^\d+$/.test(DuracionMin)) {
      Alert.alert('Error', 'La duración debe ser un número');
      isValid = false;
    }

    if (Series.trim() === '' || !/^\d+$/.test(Series)) {
      Alert.alert('Error', 'El número de series debe ser un número');
      isValid = false;
    }

    if (RepeticionesPorSerie.trim() === '' || !/^\d+$/.test(RepeticionesPorSerie)) {
      Alert.alert('Error', 'El número de repeticiones por serie debe ser un número');
      isValid = false;
    }

    if (Discapacidad_idDiscapacidad.trim() === '' || !/^\d+$/.test(Discapacidad_idDiscapacidad)) {
      Alert.alert('Error', 'El ID de la discapacidad debe ser un número');
      isValid = false;
    }

    if (!isValid) {
      return;
    }

    try {
      const formData = new FormData();
      formData.append('Nombre_Ejercicio', Nombre_Ejercicio);
      formData.append('Descripcion', Descripcion);
      formData.append('DuracionMin', DuracionMin);
      formData.append('Series', Series);
      formData.append('RepeticionesPorSerie', RepeticionesPorSerie);
      formData.append('Discapacidad_idDiscapacidad', Discapacidad_idDiscapacidad);

      const response = await axios.post('http://127.0.0.1:5000/registrar_rutina', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      });

      if (response.status === 200) {
        console.log('La solicitud fue exitosa');
        const data = response.data;
        Alert.alert(data.mensaje);
      } else {
        console.log('La solicitud falló con código:', response.status);
      }
    } catch (error) {
      console.error('Error en la solicitud:', error);
    }
  };
  useEffect(() => {
    obtenerDiscapacidades();
  }, []);
  const obtenerDiscapacidades = async () => {
    try {
      const response = await axios.get('http://127.0.0.1:5000/obtener_discapacidades');
      setDiscapacidades(response.data.discapacidades);
    } catch (error) {
      console.error('Error al obtener las discapacidades:', error);
      setError('Error al obtener las discapacidades');
    }
  };

  return (
    <View style={styles.container}>
    <View style={styles.body}>
      <TextInput
        style={styles.input}
        placeholder="Nombre ejercicio"
        value={Nombre_Ejercicio}
        onChangeText={(text) => setNombreEjercicio(text)}
      />

      <TextInput
        style={styles.input}
        placeholder="Descripción del ejercicio"
        value={Descripcion}
        onChangeText={(text) => setDescripcion(text)}
        multiline
      />

<TextInput
  style={styles.input}
  placeholder="Duración en minutos"
  value={DuracionMin}
  onChangeText={(text) => {
    if (/^\d+$/.test(text) || text === '') {
      setDuracionMin(text);
    }
  }}
  keyboardType="numeric"
/>

<TextInput
  style={styles.input}
  placeholder="Número de series"
  value={Series}
  onChangeText={(text) => {
    if (/^\d+$/.test(text) || text === '') {
      setSeries(text);
    }
  }}
  keyboardType="numeric"
/>

<TextInput
  style={styles.input}
  placeholder="Repeticiones por Serie"
  value={RepeticionesPorSerie}
  onChangeText={(text) => {
    if (/^\d+$/.test(text) || text === '') {
      setRepeticionesPorSerie(text);
    }
  }}
  keyboardType="numeric"
/>

      {error !== '' && <Text style={styles.errorText}>{error}</Text>}

      <Picker
        selectedValue={Discapacidad_idDiscapacidad}
        onValueChange={(itemValue, itemIndex) => setDiscapacidadId(itemValue)}>
        <Picker.Item label="Seleccione una discapacidad" value="" />
        {discapacidades.map((discapacidad) => (
          <Picker.Item key={discapacidad.idDiscapacidad} label={discapacidad.nombre} value={discapacidad.idDiscapacidad} />
        ))}
      </Picker>

      <Button title="Agregar Rutina" onPress={handleSubmit} />
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
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    padding: 10,
    marginBottom: 10,
  },
});

export default AdmRutina;