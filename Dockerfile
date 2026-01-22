# Stage 1: Build
FROM gradle:8.4-jdk21 AS builder
WORKDIR /home/gradle/project

# Estratégia de Cache: Copia apenas os arquivos de configuração primeiro
# Isso evita baixar todas as dependências se você mudar apenas o código-fonte
COPY build.gradle.kts settings.gradle.kts ./
RUN gradle build -x test --no-daemon > /dev/null 2>&1 || true

# Agora copia o código e compila de fato
COPY . .
RUN ./gradlew clean bootJar -x test --no-daemon

# Stage 2: Runtime
# Usamos JRE em vez de JDK para reduzir o tamanho da imagem e a superfície de ataque
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Segurança: Criar um usuário não-root para rodar a aplicação
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

COPY --from=builder /home/gradle/project/build/libs/*.jar app.jar

EXPOSE 8080

# Otimização de Memória: Ajustes para ambientes de container
ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-jar", "app.jar"]