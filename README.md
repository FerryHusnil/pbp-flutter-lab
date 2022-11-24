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
---

# Tugas 8: Flutter Form

> Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023

---

## 1. Perbedaan `Navigator.push` dan `Navigator.pushReplacement`

`Navigator.push` berguna untuk menambah route baru pada stack sementara `Navigator.pushReplacement` berfungsi mengganti route teratas pada stack pada route yang baru

## 2. Widget yang Digunakan

- Scaffold : Construct a skeleton to build widget(s).
- Appbar : default widget to create navbar-like appbar
- Center : Layout Widget to position children on the middle
- Column : Layout widget for column display
- Row : Layout widget for Row Display
- Text : Text creation
- Padding : Widget to wrap children with padding
- Spacer : Widget to create space between children, behaves like flex
- Container : Widget as container to contains any other widget, behaves like div on html
- Form : Widget of form
- ListTile : Behaves like inline widget that stores children on linear ordering (leading, traliing, etc)
- Drawer : side-navbar like
- Expanded : Widget that takes all the remaining space
- MaterialPageRoute : Widget that refresh and render the entire page
- TextFormField : input field
- Navigator : Widget that manage set of child widget with stack
- RoundedRectangleBorder : Creates a rounded rectangle border.
- SizedBox : Creates a fixed size box.
- DropdownButtonFormField : Creates a `[DropdownButton]` widget that is a `[FormField]`, wrapped in an `[InputDecorator]`.
- DropdownMenuItem : Creates an item for a dropdown menu.
- ElevatedButton : Create an ElevatedButton.
- TextButton : Create a TextButton.


## 3. Jenis-Jenis Event

- onSaved: event yang terjadi ketika widget disimpan
- onPressed: event yang terjadi ketika widget di tekan
- onTap: event yang terjadi ketika widget di tap
- onChanged: event yang terjadi ketika widget diubah

## 4. Cara Kerja `Navigator` dalam Mengganti Halaman

`Navigator` mengatur route dalam aplikasi dengan cara menggunakan stack yang menyimpan page-page dalam aplikasi.

## 5. Implementasi

- Membuat drawer ke dalam satu file agar drawer dapat digunakan di berbagai page di `drawer_app.dart`
- Menyimpan data model budget pada `budget.dart`
- Membuat page untuk menambah budget pada `add_budget_page.dart`
- Membuat page untuk menampilkan data-data budget yang sudah ditambah dari form pada `data_budget_page.dart`

---

# Tugas 9: Integrasi Web Service pada Flutter

> Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023

---

## Pengambilan JSON Tanpa Membuat Model Terlebih Dahulu

Pengambilan JSON tanpa model bisa saja yaitu outputnya berupa `Map[str, dynamic]`. Kelemahannya adalah kita tidak bisa mengetahui tipe data yang sebenarnya dari item-item yang terdapat pada `dynamic` ini.

## Widget yang Digunakan

- `FutureBuilder`: Widget yang dipakai untuk menampilkan data diambil oleh `Future` dari web service

- `CheckboxListTile`: Widget untuk menampilkan checkbox dan label

- `InkWell`: Widget yang berguna untuk menambahkan even handler `onTap`. 

## Mekanisme Pengambilan Data dari JSON

Fungsi `fetchMyWatchlist` dengan class `Future` berguna untuk melakukan fetch data dari JSON dari web service secara asynchronous dan mereturn `List<MyWatchlist>`. Kemudian widget `FutureBuilder` berguna untuk menampilkan data yang telah di fetch dari parameter `future`, yakni `snapshot.hasData` saat `future` berisi data, `snapshot.hasError` saat `future` terdapat error, Apabila data masih dalam proses fetch data maka `snapshot.data` akan bernilai null, sehingga tampilan akan menampilkan loading. 

## Implementasi

- Menambahkan navigasi baru untuk page `MyWatchlistPage` dengan menggunakan `Navigator.pushReplacement`.

- Membuat model `MyWatchlist` untuk mengatur bagaimana bentuk dari response JSON.

- Membuat suatu fungsi `fetchMyWatchlist` yang berfungsi untuk melakukan fetch data JSON

- Membuat isi dari `MyWatchlistPage` dengan menggunakan `FutureBuilder` untuk menampilkan data hasil fetch dan menambahkan widget `InkWell` pada masing-masing data untuk menambahkan event handler `onTap` untuk menuju page `DetailWatchlistPage` yang berisi detail untuk masing-masing data `myWatchlist`

- Untuk implementasi bonus, menambahkan checkbox dengan menggunakan widget `CheckboxListTile` agar user bisa merubah status apakah widget sudah ditonton atau belum dengan event handler `onChanged` yang akan merubah state dari `MyWatchlist` menggunakan `setState`. Serta menambahkan warna border yang warnya bergantung pada status `watched` yang ada pada data `MyWatchlist`.