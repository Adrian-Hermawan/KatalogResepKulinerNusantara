# 🍲 Katalog Resep Kuliner Nusantara

Aplikasi direktori resep masakan khas Nusantara berbasis Android yang dibangun menggunakan framework **Flutter**. Project ini dibuat untuk memenuhi tugas Ujian Tengah Semester (UTS) Ganjil Tahun Akademik 2026/2027 mata kuliah **Pemrograman Mobile Lanjut** (Kode MK: `INF3022`)[span_1](start_span)[span_1](end_span).

---

## 👨‍💻 Anggota Kelompok

| No | Nama Lengkap | NIM | Peran |
| :--- | :--- | :--- | :--- |
| 1 | Adrian Hermawan | 25170013 | UI/UX & Inisialisasi Project |
| 2 | Sabila Pasha | 25170010 | Data Model & Detail Resep |
| 3 | Achmad Fauzy Ramadhan | 25170005 | Fitur Favorit & Dokumentasi |
| 4 | Kent Muhammad Rafli | 25170027 | Fitur Favorit & Dokumentasi |

* **Program Studi:** S1 Teknik Informatika / Semester III[span_2](start_span)[span_2](end_span)
* **Dosen Pengampu:** Eko Budihartono, S.T., M.Kom.[span_3](start_span)[span_3](end_span)
* **Studi Kasus:** Kasus 6 - Katalog Resep Kuliner Nusantara (Master-Detail UI)[span_4](start_span)[span_4](end_span)

---

## ✨ Fitur Utama Aplikasi

1. **Katalog Grid Menu Masakan:** Menampilkan daftar kuliner Nusantara secara responsif menggunakan `GridView.builder`[span_5](start_span)[span_5](end_span).
2. **Animasi Transisi Halus (`Hero`):** Transisi animasi mulus pada gambar makanan saat berpindah dari layar utama ke layar detail[span_6](start_span)[span_6](end_span).
3. **Layar Detail Interaktif (`SliverAppBar` & `CustomScrollView`):** Menampilkan foto hidangan, informasi waktu memasak, porsi, daerah asal, rincian bahan-bahan, serta langkah-langkah memasak[span_7](start_span)[span_7](end_span).
4. **Bookmark Resep Favorit:** Pengguna dapat menandai dan menyimpan resep favorit untuk dilihat kembali pada halaman khusus **Resep Favorit Saya**[span_8](start_span)[span_8](end_span).
5. **Dukungan Aset Lokal (Offline):** Seluruh gambar resep dimuat secara lokal dari folder `assets/images/` sehingga dapat diakses dengan cepat tanpa ketergantungan koneksi internet.

---

## 🛠️ Teknologi & Komponen Pembelajaran

* **Framework:** Flutter (Bahasa Pemrograman Dart)[span_9](start_span)[span_9](end_span)
* **Target Perangkat:** Android (Minimal Android 8.0 Oreo)[span_10](start_span)[span_10](end_span)
* **Widget & Konsep Utama:**
  * `GridView.builder`[span_11](start_span)[span_11](end_span)
  * `Hero` Animation[span_12](start_span)[span_12](end_span)
  * `SliverAppBar` & `CustomScrollView`[span_13](start_span)[span_13](end_span)
  * Navigasi Multi-Layar dengan Parameter (`Navigator.push`)[span_14](start_span)[span_14](end_span)
  * Paket `google_fonts` untuk tipografi tema kuliner

---

## 📂 Struktur Folder Project

```text
lib/
├── data/
│   └── dummy_recipes.dart      # Data resep kuliner Nusantara
├── models/
│   └── resep_model.dart        # Model struktur data resep
├── screens/
│   ├── home_screen.dart        # Layar utama (Grid katalog resep)
│   ├── detail_screen.dart      # Layar detail resep (SliverAppBar & Hero)
│   └── halaman_favorit.dart    # Layar daftar resep favorit
└── main.dart                   # Entry point & konfigurasi tema aplikasi

# Katalog Resep Kuliner Nusantara

Project UTS

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
