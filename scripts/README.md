# 📕 Scripts Godot

Os Scripts à seguir podem sofrer alterações com o tempo, por exemplo, adicionar alguma variavél que não estava nos planos iniciais pra alguma função nova!

## 👨‍💻 Player
| Módulos                    | Status                      |
|----------------------------|----------------------------|
| `01 - Variáveis`           | ✅ Finalizado              |
| `02 - Movimentação básica` | 🔁 Em andamento            |
| `03 - Máquina de Animações (básica)`  | 🔁 Em andamento |
| `04 - Definir câmera`      | 🔁 Em andamento            |
| `05 - Receber & Causar dano` | 🔁 Em andamento          |

### Variáveis
Para começar a programar o nosso player/jogador, devemos pensar primeiro em: Quais ações ele poderá executar? Que variáveis ele precisa possuir pra executar estas ações?
Com isso em mente, partiremos pra defini-las. Vamos começar com o `class_name`, ele nos permite criar um novo tipo de classe que vai portar todas as informações que definirmos no script logo abaixo dele, isso facilita a manipulação destes dados fora desse objeto e minimiza os erros. Usando o `@export` ou `@export_category()` podemos exportar as variáveis pro inspector de propriedades do objeto, isso nos permite fazer alterações no código sem necessitar acessar diretamente o script, com isso em mente, criamos **vida**, **velocidade**, **altura do pulo**, **número máximo de pulos** e outros dados. Com o `@export_category("Objetos")`, nós definimos os objetos filho daquele objeto que porta o script, isso permite que façamos alterações mais rapidamente com eles e evita a manipulação de um objeto similar a ele.
