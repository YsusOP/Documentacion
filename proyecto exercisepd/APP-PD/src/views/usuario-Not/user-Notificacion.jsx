import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import axios from 'axios';

const Notificacion = () => {
  const [notificaciones, setNotificaciones] = useState([]);

  useEffect(() => {
    axios.get('http://127.0.0.1:5000/obtener_notificaciones')
      .then(response => {
        console.log(response.data); // Verifica los datos en la consola
        setNotificaciones(response.data.notificaciones);
      })
      .catch(error => {
        console.error('Error al obtener las notificaciones:', error);
      });
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.titulo}>Notificaciones</Text>
      <ScrollView style={styles.scrollView}>
        {notificaciones.map(notificacion => (
          <View key={notificacion.idNotificacion} style={styles.notificacion}>
            <Text style={styles.tituloNotificacion}>{notificacion.nombre}</Text>
            <Text>{notificacion.descripcion}</Text>
            <Text>{notificacion.fechaNotificacion}</Text>
          </View>
        ))}
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 10,
  },
  titulo: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 10,
  },
  scrollView: {
    flex: 1,
  },
  notificacion: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    padding: 10,
    marginBottom: 10,
  },
  tituloNotificacion: {
    fontWeight: 'bold',
    marginBottom: 5,
  },
});

export default Notificacion;