# Sound-Processing
![Version](https://img.shields.io/badge/version-1.0-brightgreen.svg?style=flat-square)

## Autor
Miguel Ángel Medina Ramírez <br>
Correo: miguel.medina108@alu.ulpgc.es

## Indice
1. [Introducción](#introducción)
2. [Dependencias](#dependencias)
3. [Implementación](#implementación) <br>
    3.1 [Diagrama](#diagrama)<br>
    3.2 [Algoritmo de Ordenación](#algoritmo-de-ordenación)<br>
    3.2 [Sonido](#Sonido)<br>
4. [Eventos](#eventos)
5. [Bibliografía](#bibliografía)

## Introducción
Para esta práctica se ha hecho una integración de los componentes de sonido y gráficos que disponen processing.El objetivo es comprobar como suenan algunos algoritmos de ordenación, para ello se ha escogido parte de una sonate de piano, donde sus notas se asignarán a un vector de enteros, cada vez que algún algoritmo inicié un cambio en el orden de los elmentos sonará la nota asignada.

## Dependencias
Para poder ejecutar y probar la práctica solamente se necesita clonar este repositorio y el editor de processing con las siguientes dependencias:
- La librería **sound** para poder reproducir sonidos. Su instalación se encuentra en la documentación de la práctica.

## Implementación

### Diagrama

<p align="center">
  <img src="data/diagrama.png" alt="uml">
</p>
<p align="center">
  Figura 1: Diagrama UML
</p>
<br>

### Algoritmo de Ordenación

### Sonido

## Eventos

<table style="width:100%">
  <tr>
    <th>Tecla</th>
    <th>Uso</th>
  </tr>
  <tr>
    <td>Q</td>
    <td>Ordenar con Selection Sort</td>
  </tr>
  <tr>
    <td>W</td>
    <td>Ordenar con Bubble Sort</td>
  </tr>
  <tr>
    <td>E</td>
    <td>Ordenar con Insertion Sort</td>
  </tr>
  <tr>
    <td>R</td>
    <td>Ordenar con Gnome Sort</td>
  </tr>
  <tr>
    <td>S</td>
    <td>Distribuir los datos del vector aleatorimente</td>
  </tr>
</table>

## Bibliografía

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [processing.org](https://processing.org/)
* [Sonata de Piano](https://pianoletternotes.blogspot.com/2019/05/giornos-theme-jojos-bizarre-adventure.html)
* [Algoritmo de Ordenación](https://www.geeksforgeeks.org/sorting-algorithms/)