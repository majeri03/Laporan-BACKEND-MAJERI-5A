| Nama     | MAJERI         |
|----------|----------------|
| NIM      | 105841103622   | 
| Kelas    | 5A             | 
| LAB      | BACKEND        | 
-----------------------------




# Pengenalan Nest JS [1]

## A. Pendahuluan

NestJS adalah framework backend progresif yang berbasis TypeScript, meskipun juga dapat digunakan dengan JavaScript. Framework ini dirancang untuk membangun aplikasi server-side yang efisien, skalabel, dan mudah dipelihara. NestJS mengadopsi arsitektur modular dan memanfaatkan berbagai konsep modern dari Node.js, termasuk pola desain seperti Dependency Injection (DI) dan Inversion of Control (IoC). Dengan struktur yang mirip dengan Angular, NestJS memungkinkan pengembang yang sudah familiar dengan framework frontend tersebut untuk lebih mudah beradaptasi.

## B. Dasar-Dasar Backend

### 1. Apa itu Backend?

Backend adalah bagian dari pengembangan perangkat lunak yang berfungsi sebagai otak aplikasi. Tanggung jawab utama backend termasuk mengelola data, logika bisnis, autentikasi, dan komunikasi antara frontend dan database. Jika frontend adalah bagian yang terlihat oleh pengguna, backend berfungsi di belakang layar untuk memastikan semuanya berjalan dengan baik.

### 2. Komponen Utama Backend

- **Server**: Tempat program backend berjalan (contoh: Apache, Nginx).
- **Database**: Tempat penyimpanan data (contoh: MySQL, PostgreSQL, MongoDB).
- **API (Application Programming Interface)**: Cara backend berkomunikasi dengan frontend atau sistem lain.
- **Logika Bisnis**: Aturan dan proses yang menentukan bagaimana data diproses dan keputusan dibuat.

### 3. Proses Kerja Backend

1. **Frontend Request**: Pengguna melakukan tindakan, seperti mengklik tombol di aplikasi.
2. **Server Processing**: Backend menerima permintaan, memprosesnya sesuai logika bisnis, dan mengambil data dari database jika diperlukan.
3. **Response to Frontend**: Backend mengirimkan hasil pemrosesan ke frontend untuk ditampilkan kepada pengguna.

## C. Teknologi Backend Terkenal dalam JavaScript/TypeScript

### 1. Node.js

Node.js adalah runtime JavaScript yang berjalan di server, memungkinkan pengembang menggunakan JavaScript untuk backend dan menciptakan aplikasi yang cepat dan skalabel.

### 2. Express.js

Express.js adalah framework minimalis untuk Node.js yang mempermudah pengelolaan routing dan middleware.

### 3. NestJS

NestJS adalah framework yang dibangun di atas TypeScript, cocok untuk aplikasi yang kompleks dengan struktur modular dan mendukung dependency injection.

### 4. Next.js (API Routes)

Next.js adalah framework React yang juga mendukung backend melalui API routes, memungkinkan pengembangan fullstack dalam satu framework.

## D. Kelebihan NestJS

1. **Modularitas**: Struktur yang terorganisir membantu pengembangan dan pemeliharaan kode.
2. **Berbasis TypeScript**: Menyediakan keamanan tipe dan autocompletion, mengurangi potensi bug.
3. **Fleksibilitas**: Dapat menggunakan berbagai library Node.js yang ada.
4. **Dukungan untuk Pengembangan Skala Besar**: Cocok untuk aplikasi besar seperti microservices dan REST API.
5. **Integrasi Built-in**: Terintegrasi dengan ORM, validasi, GraphQL, dan microservices.
6. **Scalable dan Cloud-Ready**: Dirancang untuk mendukung arsitektur modern berbasis cloud.
7. **Komunitas yang Kuat**: Dokumentasi lengkap dan banyak plugin tersedia.
8. **Pendekatan Declarative**: Membantu pengembang baru mengikuti praktik terbaik.
9. **Meningkatkan Produktivitas Tim**: Arsitektur yang konsisten memudahkan kerja tim.
10. **Dukungan Middleware dan Guard**: Kontrol penuh atas request/response.
11. **Dukungan Dependency Injection**: Mempermudah pengelolaan ketergantungan antar komponen.

## E. Kapan Menggunakan NestJS?

NestJS sangat cocok digunakan untuk:

- Membuat aplikasi backend dengan struktur yang kompleks.
- Aplikasi berbasis microservices.
- Aplikasi yang membutuhkan pengelolaan banyak modul.
- Aplikasi yang membutuhkan GraphQL API.
- Tim yang sudah familiar dengan TypeScript atau Angular.

## F. Cara Membuat Proyek NestJS

1. Install NestJS CLI:
   ```bash
   npm i -g @nestjs/cli
   ```
2. Inisialisasi proyek:
   ```bash
   nest new nama_proyek
   ```
3. Masuk ke direktori proyek:
   ```bash
   cd nama_proyek
   ```

## G. Contoh Kode: Membuat API Sederhana dengan NestJS

Berikut adalah contoh kode untuk membuat API sederhana menggunakan NestJS:

### 1. Buat Modul dan Controller
Buat file `app.controller.ts`:
```typescript
import { Controller, Get } from '@nestjs/common';

@Controller('api')
export class AppController {
  @Get('hello')
  getHello(): string {
    return 'Hello, World!';
  }
}
```

### 2. Buat Modul Utama
Buat file `app.module.ts`:
```typescript
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';

@Module({
  imports: [],
  controllers: [AppController],
  providers: [],
})
export class AppModule {}
```

### 3. Buat File `main.ts`
Buat file `main.ts`:
```typescript
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { ValidationPipe } from '@nestjs/common';
import * as cookieParser from 'cookie-parser';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.use(cookieParser());

  app.useGlobalPipes(
    new ValidationPipe({
      transform: true,
    }),
  );

  const config = new DocumentBuilder()
    .setTitle('Belajar NestJS MAJERI')
    .setDescription(
      'NestJS always Backend',
    )
    .setVersion('1.0')
    .addBearerAuth()
    .build();

  const documentFactory = () => SwaggerModule.createDocument(app, config);

  SwaggerModule.setup('api', app, documentFactory); 

  await app.listen(process.env.PORT ?? 3001);


}
bootstrap();
```

### 4. Menjalankan Aplikasi
Jalankan aplikasi menggunakan perintah:
```bash
npm start run:dev
```

Setelah aplikasi berjalan, Anda dapat mengakses endpoint `http://localhost:3001/` untuk melihat pesan "Hello, World!". dan untuk mengakses api di `http://localhost:3001/api`

## H. Kesimpulan

NestJS adalah framework yang sangat kuat dan fleksibel untuk pengembangan aplikasi backend menggunakan TypeScript. Dengan fitur-fitur canggih dan struktur yang terorganisir, NestJS cocok untuk berbagai jenis aplikasi, terutama yang membutuhkan pengelolaan yang kompleks. Dengan komunitas yang aktif dan dokumentasi yang lengkap, pengembang dapat dengan mudah menemukan dukungan dan sumber daya untuk menyelesaikan berbagai permasalahan dalam pengembangan.



#  Controller dan Services di NestJS [2]

## A. Pendahuluan

Modul ini membahas konsep Controller dan Services dalam framework NestJS dengan menggunakan analogi hotel. Controller diibaratkan sebagai resepsionis yang berfungsi sebagai penghubung antara tamu (klien) dan staf hotel (Service). Dalam konteks aplikasi, Controller bertanggung jawab untuk menerima dan mengelola permintaan dari pengguna, sedangkan Service menangani logika bisnis dan interaksi dengan sumber data.

## B. Controller

Controller berperan sebagai penerima permintaan HTTP dari pengguna. Tugas utamanya adalah:

1. **Menerima Permintaan**: Controller menerima berbagai jenis permintaan, seperti GET, POST, PUT, dan DELETE dari endpoint yang ditentukan.
2. **Mendengarkan Data**: Controller mengekstrak informasi dari permintaan, baik dari URL, body, maupun query parameter.
3. **Mendelegasikan Tugas**: Controller tidak melakukan logika bisnis secara langsung, tetapi mendelegasikan tugas tersebut ke Service yang sesuai.
4. **Mengirimkan Respons**: Setelah menerima hasil dari Service, Controller mengubah data tersebut menjadi format yang sesuai dan mengirimkannya kembali kepada pengguna.

### Contoh Kode Controller

Berikut adalah contoh kode untuk Controller yang mengelola pengguna:

```typescript
@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('mahasiswa')
  getMahasiswa() {
    return this.appService.getMahasiswa();
  }

  @Post('mahasiswa')
  @ApiBody({ type: CreateMahasiswaDTO })
  createMahasiswa(@Body() mahasiswa: CreateMahasiswaDTO) {
    return this.appService.addMahasiswa(mahasiswa);
  }

  @Delete('mahasiswa/:nim')
  deleteMahasiswa(@Param('nim') nim: string) {
    return this.appService.deleteMahasiswa(nim);
  }

  @Put('mahasiswa/:nim')
  @ApiBody({ type: CreateMahasiswaDTO })
  updateMahasiswa(
    @Param('nim') nim: string,
    @Body() mahasiswa: CreateMahasiswaDTO,
  ) {
    return this.appService.updateMahasiswa(nim, mahasiswa);
  }
}
```

## C. Service

Service dalam aplikasi NestJS berfungsi sebagai tempat di mana semua logika bisnis dijalankan. Tugas utama Service meliputi:

1. **Menerima Instruksi dari Controller**: Service menerima permintaan dari Controller untuk menjalankan berbagai tugas.
2. **Mengolah Data**: Service melakukan validasi, manipulasi, dan akses ke database sesuai kebutuhan aplikasi.
3. **Interaksi dengan Sumber Data**: Service bertanggung jawab untuk berkomunikasi dengan database atau API eksternal.
4. **Mengembalikan Hasil ke Controller**: Setelah menyelesaikan tugasnya, Service mengembalikan hasil ke Controller untuk disampaikan kepada pengguna.

### Contoh Kode Service

Berikut adalah contoh kode untuk Service yang mengelola pengguna:

```typescript
import {BadRequestException,HttpException,Injectable,InternalServerErrorException, NotFoundException,} from '@nestjs/common';
import { PrismaService } from './prisma.service';
import { Prisma } from '@prisma/client';
import { CreateMahasiswaDTO } from './dto/create-mahasiswa.dto';
import { registerUserDTO } from './dto/register-user.dto';
import { compareSync } from 'bcrypt';

@Injectable()
export class AppService {

  getHello(): string {
    return 'Hello World!';
  }

  async getMahasiswa() {
    return await this.prisma.mahasiswa.findMany();
  }

  async addMahasiswa(data: CreateMahasiswaDTO) {
    const mahasiswa = await this.prisma.mahasiswa.findFirst({
      where: {
        nim: data.nim,
      },
    });

    if (mahasiswa != null)
      throw new NotFoundException('Mahasiswa dengan nim ini sudah ada');

    await this.prisma.mahasiswa.create({
      data: data,
    });

    return this.prisma.mahasiswa.findMany();
  }

  async deleteMahasiswa(nim: string) {
    const exist = this.prisma.mahasiswa.findFirst({
      where: {
        nim: nim,
      },
    });

    if (!exist) {
      throw new NotFoundException('NIM Tidak Ditemukan');
    }

    await this.prisma.mahasiswa.delete({
      where: {
        nim: nim,
      },
    });

    return await this.prisma.mahasiswa.findMany();
  }

  async updateMahasiswa(nim: string, data: Partial<CreateMahasiswaDTO>) {
    const mahasiswa = await this.prisma.mahasiswa.findFirst({
      where: {
        nim: nim,
      },
    });

    if (mahasiswa == null) throw new NotFoundException('NIM tidak di temukan');
    await this.prisma.mahasiswa.update({
      where: {
        nim: nim,
      },
      data: data,
    });

    return this.prisma.mahasiswa.findFirst({
      where: {
        nim: nim,
      },
    });
  }
  async getRuangan() {
    return await this.prisma.ruangan.findMany();
  }

  async addRuangan(data: Prisma.RuanganCreateInput) {
    const exist = await this.prisma.ruangan.findUnique({
      where: { id: data.id },
    });

    if (exist) {
      throw new BadRequestException('ID sudah digunakan.');
    }

    return await this.prisma.ruangan.create({
      data,
    });
  }
}
```

## D. DTO (Data Transfer Object)

DTO adalah pola desain yang digunakan untuk mentransfer data antara lapisan dalam aplikasi. Dalam NestJS, DTO memastikan struktur data yang konsisten dan aman, serta memungkinkan validasi data menggunakan library seperti `class-validator`.

### Contoh Penggunaan DTO

```typescript
import { ApiProperty } from "@nestjs/swagger";
import { Jenis_kelamin } from "@prisma/client";
import { IsEnum, IsNotEmpty, IsString, Length, MinLength } from "class-validator";

export class CreateMahasiswaDTO {

    // membuat properties nim yang bersifat string, tidak boleh kosong, dan panjangnya 
    // 30 karakter
    @ApiProperty({ description : "NIM Mahasiswa", type : String, example : "105841103622" })
    @IsString()
    @IsNotEmpty()
    @Length(1, 30)
    nim : string;

    //membuat properties nama yang bersifat string, tidak boleh kosong, dan panjangnya
    // 30 karakter
    @ApiProperty({ description : "Nama Mahasiswa", type : String, example : "MAJERI" })
    @IsString()
    @IsNotEmpty()
    @Length(1, 30)
    nama : string

    @ApiProperty({ description : "Kelas", type : String, example : "5A" })
    @IsString()
    @IsNotEmpty()
    @Length(1, 30)
    kelas : string

    @ApiProperty({ description : "Jurusan", type : String, example : "Informatika" })
    @IsString()
    @IsNotEmpty()
    @Length(1, 30)
    jurusan : string

    @ApiProperty({ description : "Jenis Kelamin", enum : Jenis_kelamin, example : "L" })
    @IsEnum(Jenis_kelamin)   
    jenis_kelamin : Jenis_kelamin
}
```

## E. Kode Respon

Kode respon yang umum digunakan dalam aplikasi NestJS adalah:

- **200**: Sukses
- **201**: Sukses Menambahkan Data
- **400**: Kesalahan – Bad Request
- **401**: Kesalahan – Tidak Terautentikasi
- **404**: Kesalahan – Tidak Ditemukan

## F. Kesimpulan

Modul ini menjelaskan peran penting Controller dan Service dalam arsitektur aplikasi NestJS. Controller bertugas untuk mengelola permintaan dari klien, sedangkan Service menangani logika bisnis dan interaksi dengan data. Penggunaan DTO semakin memperkuat struktur data dan validasi dalam aplikasi, memastikan keamanan dan konsistensi data yang ditransfer. Dengan memahami konsep-konsep ini, pengembang dapat membangun aplikasi yang lebih terorganisir dan efisien.







# Autentikasi pada Proyek NestJS [3]

#### 1. **Pengertian Authentication**
Authentication adalah proses untuk memastikan identitas seseorang, aplikasi, atau sistem. Dalam konteks aplikasi, autentikasi berfungsi melindungi sumber daya dan data dari akses tidak sah. Autentikasi juga menjadi langkah pertama dalam sistem keamanan aplikasi modern.

#### 2. **Jenis-jenis Authentication**
Metode autentikasi yang biasa digunakan meliputi:
- **Password-Based Authentication**: Menggunakan kombinasi username dan password.
- **Two-Factor Authentication (2FA)**: Menambahkan langkah verifikasi kedua, seperti kode OTP.
- **Multi-Factor Authentication (MFA)**: Kombinasi lebih dari dua metode autentikasi.
- **Biometric Authentication**: Menggunakan sidik jari atau pengenalan wajah.
- **Token-Based Authentication**: Menggunakan token untuk validasi pengguna.
- **Single Sign-On (SSO)**: Mengizinkan pengguna mengakses beberapa aplikasi dengan satu kredensial.
- **OAuth**: Protokol untuk otorisasi pihak ketiga.

#### 3. **Proses Autentikasi di Aplikasi NestJS**
Proses autentikasi melibatkan langkah-langkah berikut:
1. Pengguna memasukkan kredensial.
2. Data dikirimkan ke server.
3. Server memvalidasi username dan password.
4. Jika valid, server memberikan token kepada pengguna.

#### 4. **Konfigurasi dan Implementasi Authentication**
- **Library yang Digunakan**:
  - `bcrypt`: Untuk hashing password.
  - `@nestjs/jwt` dan `jsonwebtoken`: Untuk membuat dan mengelola token JWT.
  - `@types/bcrypt`: Memberikan tipe pada fungsi `bcrypt`.

- **Model Prisma**: 
  Model pengguna dibuat menggunakan schema berikut:
  ```prisma
  model User {
  id       Int @id @default(autoincrement())
  username String  @db.VarChar(50) @unique
  password String
  role     UserRole

  created_at DateTime @default(now())
  }
  enum UserRole {
    ADMIN
    USER
  }
  ```
  Untuk menyinkronkan schema dengan database, digunakan perintah:
  ```
  npx prisma db push
  ```

- **Registrasi Pengguna**:
  - Dilakukan pengecekan apakah username sudah terdaftar menggunakan query:
    ```javascript
    const user = await this.prisma.user.findFirst({
      where: { username: data.username },
    });
    if (user) throw new BadRequestException("Username ini sudah digunakan");
    ```
  - Password di-hash menggunakan `bcrypt`:
    ```javascript
    const hash = hashSync(data.password, 10);
    ```
  - Data pengguna disimpan dalam database:
    ```javascript
    const newUser = await this.prisma.user.create({
      data: { username: data.username, password: hash },
    });
    return newUser;
    ```

- **Route Register**:
  Route untuk registrasi pengguna ditambahkan dalam controller:
  ```javascript
  @Post("register")
  register(@Body() user: RegisterUserDTO) {
    return this.appService.register(user);
  }
  ```

#### 5. **Penggunaan Token JWT untuk Autentikasi**
- Setelah berhasil login, pengguna menerima token JWT.
- Token ini harus dikirim dalam header `Authorization` dengan format `Bearer <token>` pada setiap permintaan ke server.

#### 6. **Validasi Login**
Method login memanfaatkan fungsi `compareSync` dari `bcrypt` untuk membandingkan password yang dimasukkan dengan password yang di-hash di database:
```javascript
if (!compareSync(data.password, user.password)) {
  throw new UnauthorizedException("Password salah");
}
```

#### 7. **Integrasi dengan Swagger**
Swagger digunakan untuk mempermudah pengujian API. Dengan menambahkan `addBearerAuth` pada `main.ts`, Swagger memungkinkan pengguna menyetel header Authorization secara langsung.

#### 8. **Keuntungan Implementasi**
- **Keamanan Data**: Password yang disimpan di database dienkripsi sehingga lebih aman.
- **Kemudahan Validasi**: Dengan JWT, autentikasi bisa dilakukan dengan cepat tanpa memerlukan validasi ulang ke database.
- **Modularisasi**: Setiap bagian autentikasi dibuat dalam modul terpisah sehingga mudah dikembangkan dan diperbaiki di masa depan.


#  Middleware Guard pada Proyek NestJS [4]
#### 1. **Pengertian Middleware**
Middleware adalah perangkat lunak yang berada di antara sistem operasi dan aplikasi atau antara dua komponen dalam sebuah sistem. Dalam aplikasi web, middleware adalah fungsi yang dijalankan sebelum permintaan mencapai controller atau route handler. 

#### 2. **Fungsi Middleware**
Middleware memiliki berbagai kegunaan, antara lain:
- **Logging**: Mencatat aktivitas request untuk tujuan pemantauan.
- **Autentikasi**: Memvalidasi identitas pengguna sebelum mengakses sumber daya.
- **Manipulasi Request/Response**: Menambahkan, memodifikasi, atau memvalidasi data yang dikirim atau diterima.
- **Error Handling**: Mengelola error yang terjadi selama proses permintaan.
- **Pipeline Request-Response**: Menyederhanakan alur data dalam aplikasi web.

#### 3. **Jenis Middleware di NestJS**
- **Class-based Middleware**: Middleware yang didefinisikan menggunakan class dengan decorator `@Injectable`.
- **Function-based Middleware**: Middleware yang ditulis sebagai fungsi biasa.

#### 4. **Guard untuk Autentikasi**
**Guard** adalah fitur di NestJS yang bertindak sebagai middleware khusus untuk mengelola akses terhadap route berdasarkan kondisi tertentu, seperti validasi token.

##### a. **Membuat Guard**
- Guard harus mengimplementasikan interface `CanActivate` dari `@nestjs/common`.
- Deklarasikan Guard dengan `@Injectable`.

**Contoh Implementasi Guard:**
```typescript
import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { AppService } from './app.service';

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(
    private readonly jwtService: JwtService,
    private readonly appService: AppService,
  ) {}

  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest();
    const authHeader = request.headers['authorization'];

    if (!authHeader) {
      throw new UnauthorizedException('Authorization header is missing');
    }

    const token = authHeader.split(' ')[1];
    try {
      const payload = this.jwtService.verify(token);
      const user = this.appService.auth(payload.id);
      request.user = user;
      return true;
    } catch (err) {
      throw new UnauthorizedException('Invalid token');
    }
  }
}
```

##### b. **Cara Kerja Guard**
1. **Mengambil Token**: Guard membaca token dari header `Authorization`.
2. **Validasi Token**: Token divalidasi menggunakan `JwtService.verify()`. Jika validasi gagal, `UnauthorizedException` dilempar.
3. **Mendapatkan Data Pengguna**: ID dari token digunakan untuk mengambil informasi pengguna melalui `AppService.auth()`.
4. **Menyisipkan Data ke Request**: Data pengguna disimpan dalam `request.user` agar bisa diakses di controller.

#### 5. **Decorator untuk Data Pengguna**
Untuk mempermudah akses data pengguna dalam `request.user`, dibuat custom decorator:
```typescript
import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const UserDecorator = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    return request.user;
  },
);
```

##### Keuntungan:
- Meminimalkan kode boilerplate.
- Mengizinkan pengembang langsung mengambil data pengguna sebagai parameter metode dalam controller.

#### 6. **Implementasi Guard di Controller**
Untuk mengamankan route, Guard digunakan dengan decorator `@UseGuards`. Contoh:
```typescript
import { Controller, Get, UseGuards } from '@nestjs/common';
import { UserDecorator } from './user.decorator';
import { AuthGuard } from './auth.guard';
import { User } from './entity/user.entity';

@Controller()
export class AppController {
  @Get('/auth')
  @UseGuards(AuthGuard)
  auth(@UserDecorator() user: User) {
    return user;
  }
}
```

#### 7. **Global Module**
Guard diintegrasikan dalam modul global agar dapat digunakan di seluruh proyek tanpa harus mengimpor berulang kali:
```typescript
import { Global, Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { AppService } from './app.service';
import { AuthGuard } from './auth.guard';

@Global()
@Module({
  imports: [JwtModule.register({})],
  providers: [AppService, AuthGuard],
  exports: [AppService, AuthGuard],
})
export class AuthModule {}
```

#### 8. **Swagger dan Authorization Header**
Swagger UI diintegrasikan untuk mengatur header Authorization dengan token yang valid:
```typescript
const config = new DocumentBuilder()
  .setTitle('Lab Backend')
  .setDescription('Lab Authentication')
  .setVersion('1.0')
  .addBearerAuth()
  .build();
```
Pengaturan ini memungkinkan pengguna menguji API dengan menambahkan token langsung dari Swagger UI.

---

### Kesimpulan
Dengan middleware Guard, autentikasi dapat dilakukan secara otomatis pada setiap permintaan yang membutuhkan validasi. Guard memberikan fleksibilitas dalam membangun pipeline autentikasi yang aman dan terstruktur. Custom decorator juga mempermudah pengelolaan data pengguna dalam request tanpa perlu kode tambahan di setiap route.

















###  Middleware Guard pada Proyek NestJS

#### 1. **Pengertian Middleware**
Middleware adalah perangkat lunak yang berada di antara sistem operasi dan aplikasi atau antara dua komponen dalam sebuah sistem. Dalam aplikasi web, middleware adalah fungsi yang dijalankan sebelum permintaan mencapai controller atau route handler. 

#### 2. **Fungsi Middleware**
Middleware memiliki berbagai kegunaan, antara lain:
- **Logging**: Mencatat aktivitas request untuk tujuan pemantauan.
- **Autentikasi**: Memvalidasi identitas pengguna sebelum mengakses sumber daya.
- **Manipulasi Request/Response**: Menambahkan, memodifikasi, atau memvalidasi data yang dikirim atau diterima.
- **Error Handling**: Mengelola error yang terjadi selama proses permintaan.
- **Pipeline Request-Response**: Menyederhanakan alur data dalam aplikasi web.

#### 3. **Jenis Middleware di NestJS**
- **Class-based Middleware**: Middleware yang didefinisikan menggunakan class dengan decorator `@Injectable`.
- **Function-based Middleware**: Middleware yang ditulis sebagai fungsi biasa.

#### 4. **Guard untuk Autentikasi**
**Guard** adalah fitur di NestJS yang bertindak sebagai middleware khusus untuk mengelola akses terhadap route berdasarkan kondisi tertentu, seperti validasi token.

##### a. **Membuat Guard**
- Guard harus mengimplementasikan interface `CanActivate` dari `@nestjs/common`.
- Deklarasikan Guard dengan `@Injectable`.

**Contoh Implementasi Guard:**
```typescript
import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { AppService } from './app.service';

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(
    private readonly jwtService: JwtService,
    private readonly appService: AppService,
  ) {}

  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest();
    const authHeader = request.headers['authorization'];

    if (!authHeader) {
      throw new UnauthorizedException('Authorization header is missing');
    }

    const token = authHeader.split(' ')[1];
    try {
      const payload = this.jwtService.verify(token);
      const user = this.appService.auth(payload.id);
      request.user = user;
      return true;
    } catch (err) {
      throw new UnauthorizedException('Invalid token');
    }
  }
}
```

##### b. **Cara Kerja Guard**
1. **Mengambil Token**: Guard membaca token dari header `Authorization`.
2. **Validasi Token**: Token divalidasi menggunakan `JwtService.verify()`. Jika validasi gagal, `UnauthorizedException` dilempar.
3. **Mendapatkan Data Pengguna**: ID dari token digunakan untuk mengambil informasi pengguna melalui `AppService.auth()`.
4. **Menyisipkan Data ke Request**: Data pengguna disimpan dalam `request.user` agar bisa diakses di controller.

#### 5. **Decorator untuk Data Pengguna**
Untuk mempermudah akses data pengguna dalam `request.user`, dibuat custom decorator:
```typescript
import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const UserDecorator = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    return request.user;
  },
);
```

##### Keuntungan:
- Meminimalkan kode boilerplate.
- Mengizinkan pengembang langsung mengambil data pengguna sebagai parameter metode dalam controller.

#### 6. **Implementasi Guard di Controller**
Untuk mengamankan route, Guard digunakan dengan decorator `@UseGuards`. Contoh:
```typescript
import { Controller, Get, UseGuards } from '@nestjs/common';
import { UserDecorator } from './user.decorator';
import { AuthGuard } from './auth.guard';
import { User } from './entity/user.entity';

@Controller()
export class AppController {
  @Get('/auth')
  @UseGuards(AuthGuard)
  auth(@UserDecorator() user: User) {
    return user;
  }
}
```

#### 7. **Global Module**
Guard diintegrasikan dalam modul global agar dapat digunakan di seluruh proyek tanpa harus mengimpor berulang kali:
```typescript
import { Global, Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { AppService } from './app.service';
import { AuthGuard } from './auth.guard';

@Global()
@Module({
  imports: [JwtModule.register({})],
  providers: [AppService, AuthGuard],
  exports: [AppService, AuthGuard],
})
export class AuthModule {}
```

#### 8. **Swagger dan Authorization Header**
Swagger UI diintegrasikan untuk mengatur header Authorization dengan token yang valid:
```typescript
const config = new DocumentBuilder()
  .setTitle('Lab Backend')
  .setDescription('Lab Authentication')
  .setVersion('1.0')
  .addBearerAuth()
  .build();
```
Pengaturan ini memungkinkan pengguna menguji API dengan menambahkan token langsung dari Swagger UI.

---

### Kesimpulan
Dengan middleware Guard, autentikasi dapat dilakukan secara otomatis pada setiap permintaan yang membutuhkan validasi. Guard memberikan fleksibilitas dalam membangun pipeline autentikasi yang aman dan terstruktur. Custom decorator juga mempermudah pengelolaan data pengguna dalam request tanpa perlu kode tambahan di setiap route.
