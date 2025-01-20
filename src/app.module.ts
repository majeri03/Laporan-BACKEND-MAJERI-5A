import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma.service';
import { JwtModule } from '@nestjs/jwt';
import { AuthModule } from './auth.module';

@Module({
  imports: [JwtModule.register({secret: 'Majeri',global: true}),AuthModule],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}