# Tugas 7: Elemen Dasar Flutter

> Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023

---

## 1. Stateless Widget VS Stateful Widget
Stateless widget adalah widget yang tidak pernah berubah. Stateless widget adalah subclass dari `StatelessWidget`. Sementara stateful widget adalah widget yang dinamis yaitu dapat berubah-ubah tampilannya ketika terjadi interaksi dengan pengguna. Stateful widget adalah subclass dari `StatefulWidget`

## 2. Widget yang digunakan
- `MaterialApp`: Aplikasi yang menggunakan desain material
- `Scaffold`: Implementasi dasar dari tampilan struktur visual desain material 
- `AppBar`: Bar di atas layar
- `Center`: Meletakkan child widget di tengah-tengah parent
- `Text`: Isi teks
- `Column`: Meletakkan child widget dalam satu kolom
- `Padding`: Memberikan spasi di sekitar child widget
- `Row`: Meletakkan child widget dalam satu baris
- `FloatingActionButton`: Menampilkan button melayang
- `Spacer`: Memberi spasi yang memakan seluruh ruang yang tersisa

## 3. Fungsi `setState()`
`setState()` berguna untuk mengubah data yang dinamis dan akan menyebabkan build ulang pada objek tersebut. Variabel yang terdampak adalah variabel yang diubah nilainya dalam fungsi `setState()` tersebut.

## 4. `const` vs `final`
`const` dan `final` merupakan sama-sama variabel yang bersifat immutable. Perbedaannya adalah pada `const` bersifat immutable sejak compile-time. Berbeda dengan `final` yang immutable saat running-time

## 5. Implementasi

Merubah title pada `AppBar` menjadi Program Counter
```dart
home: const MyHomePage(title: 'Program Counter'),
```

Membuat variabel `isEven` untuk mengecek apakah `_counter` genap atau ganjil
```dart
var isEven = _counter % 2 == 0;
```

Membuat conditional logic untuk menampilkan text
```dart
Text(
    isEven ? 'GENAP' : 'GANJIL',
    style: TextStyle(color: isEven ? Colors.red : Colors.blue),
),
```

Membuat tampilan `FloatingActionButton` untuk mengurangi dan menambah counter
```dart
floatingActionButton: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
        children: [
        if (_counter > 0)
            FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            ),
        const Spacer(),
        FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
        ),
        ],
    ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation
        .centerFloat
)
```

Membuat fungsi handler untuk Decrement dan Increment
```dart
void _incrementCounter() {
    setState(() {
        _counter++;
    });
}

void _decrementCounter() {
    setState(() {
        if (_counter > 0) {
            _counter--;
        }
    });
}
```
