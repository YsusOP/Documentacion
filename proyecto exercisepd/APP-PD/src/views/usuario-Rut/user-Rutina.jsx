import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import axios from 'axios';

const Rutinas = ({ route }) => {
  const [rutinas, setRutinas] = useState([]);
  const [error, setError] = useState('');

  // Obtener el idDiscapacidad de los parámetros de navegación
  const { idDiscapacidad } = route.params;

  useEffect(() => {
    // Hacer la solicitud a la API Flask para obtener las rutinas por idDiscapacidad
    axios.get(`http://127.0.0.1:5000/obtener_rutinas/${idDiscapacidad}`)
      .then(response => {
        console.log(response.data); // Verifica los datos en la consola
        setRutinas(response.data.rutinas);
      })
      .catch(error => {
        console.error('Error al obtener las rutinas:', error);
        setError('Error al obtener las rutinas. Por favor, inténtelo de nuevo más tarde.');
      });
  }, [idDiscapacidad]);

  return (
    <View style={styles.container}>
      <View style={styles.rutinasContainer}>
        <Text style={styles.titulo}>Rutinas</Text>
        {error ? <Text style={styles.error}>{error}</Text> : null}
        <ScrollView style={styles.scrollView}>
          {rutinas.map((rutina, index) => (
            <View key={index} style={styles.rutina}>
              <Text style={styles.tituloRutina}>{rutina.Nombre_Ejercicio}</Text>
              <Text><Text style={styles.negrita}>Duración:</Text> {rutina.DuracionMin} minutos</Text>
              <Text><Text style={styles.negrita}>Series:</Text> {rutina.Series}</Text>
              <Text><Text style={styles.negrita}>Repeticiones por Serie:</Text> {rutina.RepeticionesPorSerie}</Text>
              <Text><Text style={styles.negrita}>Descripción:</Text> {rutina.Descripcion}</Text>
            </View>
          ))}
        </ScrollView>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  rutinasContainer: {
    flex: 1,
    padding: 10,
  },
  titulo: {
    fontSize: 20,
    textAlign: 'center',
    marginBottom: 10,
  },
  error: {
    color: 'red',
    textAlign: 'center',
    marginBottom: 10,
  },
  scrollView: {
    flex: 1,
  },
  rutina: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    padding: 10,
    marginBottom: 10,
  },
  tituloRutina: {
    fontWeight: 'bold',
    marginBottom: 5,
  },
  negrita: {
    fontWeight: 'bold',
  },
});

export default Rutinas;