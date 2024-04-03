import React, { useState } from 'react';
import { View, Button, Text, TextInput, StyleSheet } from 'react-native';
import axios from 'axios';

const App = () => {
  const [nombre, setNombre] = useState('');
  const [descripcion, setDescripcion] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (event) => {
    event.preventDefault();
    const formData = new FormData();
    formData.append('Nombre', nombre);
    formData.append('Descripcion', descripcion);
    try {
      const response = await axios.post('http://127.0.0.1:5000/discapacidad', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      });

      if (response.data.mensaje) { // Verifica si la respuesta contiene un mensaje
        console.log(response.data.mensaje);
        alert(response.data.mensaje);
        setNombre('');
        setDescripcion('');
        setError('');
      } else {
        setError('Error al enviar la discapacidad');
      }
    } catch (error) {
      console.error(error);
      setError('Error al enviar la discapacidad');
    }
  };

  return (
    <View style={styles.container}>
      <View style={styles.inputContainer}>
        <Text style={styles.label}>Nombre</Text>
        <TextInput
          style={styles.input}
          placeholder="Ingresa tu nombre"
          value={nombre}
          onChangeText={(text) => setNombre(text)}
        />
        {error !== '' && <Text style={styles.errorText}>{error}</Text>}
      </View>

      <View style={styles.inputContainer}>
        <Text style={styles.label}>Descripción</Text>
        <TextInput
          style={[styles.input, styles.textArea]}
          placeholder="Describe algo"
          multiline
          numberOfLines={4}
          value={descripcion}
          onChangeText={(text) => setDescripcion(text)}
        />
        {error !== '' && <Text style={styles.errorText}>{error}</Text>}
      </View>

      <Button
        title="Enviar"
        onPress={handleSubmit}
        disabled={error !== ''}
        color="#007AFF"
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  inputContainer: {
    marginBottom: 20,
  },
  label: {
    fontWeight: 'bold',
    marginBottom: 5,
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    padding: 10,
  },
  textArea: {
    height: 100,
    textAlignVertical: 'top',
  },
  errorText: {
    color: 'red',
    marginTop: 5,
  },
});

export default App;
