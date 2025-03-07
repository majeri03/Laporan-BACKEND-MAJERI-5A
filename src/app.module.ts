import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma.service';
import { JwtModule } from '@nestjs/jwt';
import { AuthModule } from './auth.module';
import { ProfileModule } from './profile/profile.module';
import { EventsGateway } from './chat/chat.gateway';
import { ChatModule } from './chat/chat.module';

@Module({
  imports: [JwtModule.register({secret: 'Majeri',global: true}),AuthModule, ProfileModule, ChatModule],
  controllers: [AppController],
  providers: [AppService, PrismaService, EventsGateway],
})
export class AppModule {}