📱 Fila Livre - Documentação

Um aplicativo para gerenciamento de filas em estabelecimentos comerciais, com autenticação persistente e interface intuitiva.

🛠 Tecnologias Utilizadas
Flutter (v3.7.0+)

Dart (v3.0.0+)

SharedPreferences (Persistência de dados)

Material Design 3 (UI moderna)

📂 Estrutura do Projeto
text
lib/  
├── models/  
│   └── estabelecimento.dart  
├── screens/  
│   ├── splash_screen.dart  
│   ├── login_screen.dart  
│   ├── estabelecimento_screen.dart  
│   └── fila_screen.dart  
├── services/  
│   └── auth_service.dart  
└── main.dart  
🔄 Fluxo do Aplicativo
Splash Screen → Verifica autenticação

Login → Credenciais persistentes

Estabelecimentos → Lista de locais disponíveis

Fila → Acompanhamento da posição

🔑 Autenticação
Credenciais Padrão
Email: admin@email.com

Senha: admin

Funcionalidades
Login persistente (não desloga ao fechar o app)

Logout global (disponível em todas as telas via AppBar)

Validação de formulário

🎨 Telas
1. Splash Screen
   Gradiente animado

Ícone e nome do app

Redirecionamento automático

dart
home: const SplashScreen(), // Em main.dart
2. Login Screen
   Formulário com validação

Fundo gradiente

Botão de acesso

3. Estabelecimento Screen
   Lista de estabelecimentos em cards

Botão de logout no AppBar

Exibe saudação personalizada

4. Fila Screen
   Acompanhamento em tempo real da posição

Barra de progresso visual

Botões de atualização e saída

⚙️ Como Executar
Clone o repositório:

bash
git clone https://github.com/Alderi-Jr/Fila-Livre/
Instale as dependências:

bash
flutter pub get
Execute:

bash
flutter run

📌 Dependências (pubspec.yaml)
yaml
dependencies:
flutter:
sdk: flutter
shared_preferences: ^2.2.2
cached_network_image: ^3.2.3

🚀 Melhorias Futuras

Integração com Firebase

Notificações push

Login com biometria

Múltiplos usuários
