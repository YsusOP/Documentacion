import React, { useState, useEffect } from 'react';
import { View, TextInput, StyleSheet, ScrollView, Text, Button, TouchableOpacity } from 'react-native';
import axios from 'axios';
import { useNavigation } from '@react-navigation/native';

const Cuerpo = () => {
  const [discapacidades, setDiscapacidades] = useState([]);
  const [busqueda, setBusqueda] = useState('');
  const navigation = useNavigation();

  useEffect(() => {
    // Lógica para obtener las discapacidades
    axios.get('http://127.0.0.1:5000/obtener_discapacidades')
      .then(response => {
        // Verificar los datos en la consola
        console.log(response.data);

        // Actualizar el estado con los datos de las discapacidades
        setDiscapacidades(response.data.discapacidades);
      })
      .catch(error => {
        // Manejo de errores
        console.error('Error al obtener las discapacidades:', error);
      });
  }, []); // Este efecto se ejecuta una vez al montar el componente

  // Función para manejar el cambio en el input de búsqueda
  const handleChangeBusqueda = (text) => {
    setBusqueda(text);
  };

  // Función para redirigir a la pantalla de "Rutinas" con la ID de la discapacidad seleccionada
  const redirectToRutinas = (idDiscapacidad) => {
    navigation.navigate('Rutinas', { idDiscapacidad });
  };

  // Filtrar las discapacidades basadas en la búsqueda
  const discapacidadesFiltradas = discapacidades.filter(discapacidad =>
    discapacidad.nombre.toLowerCase().includes(busqueda.toLowerCase())
  );

  return (
    <View style={styles.container}>
      <View style={styles.content}>
        <TextInput
          value={busqueda}
          onChangeText={handleChangeBusqueda}
          placeholder="Buscar discapacidad..."
          style={styles.input}
        />
        <ScrollView style={styles.scrollView}>
          {discapacidadesFiltradas.map((discapacidad) => (
            <TouchableOpacity
              key={discapacidad.idDiscapacidad}
              style={styles.tarjeta}
              onPress={() => redirectToRutinas(discapacidad.idDiscapacidad)}
            >
              <Text style={styles.titulo}>{discapacidad.nombre}</Text>
              <Text>{discapacidad.descripcion}</Text>
            </TouchableOpacity>
          ))}
        </ScrollView>
        <View style={styles.botonesContainer}>
          <Button title="Ir a Notificaciones" onPress={() => navigation.navigate('Notificacion')} />
          <Button title="Cerrar Sesión" onPress={() => navigation.navigate('Inicio')} />
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  content: {
    flex: 1,
    padding: 10,
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    padding: 10,
    marginBottom: 10,
  },
  scrollView: {
    flex: 1,
  },
  tarjeta: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    padding: 10,
    marginBottom: 10,
  },
  titulo: {
    fontWeight: 'bold',
    marginBottom: 5,
  },
  botonesContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 10,
  },
});

export default Cuerpo;
