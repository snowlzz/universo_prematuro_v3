# Universo Prematuro

Projeto desenvolvolvido para auxilio de mães de crianças pré-termo

# Arquitetura

A arquitetura escolhida chama-se Clean Dart, mais informações abaixo<br>
[Clean Dart](https://github.com/Flutterando/Clean-Dart)

Clean Dart é um padrão de arquitetura de software para projetos em Dart, que segue os princípios do Clean Architecture. 
Ele enfatiza a separação clara de responsabilidades entre as camadas de aplicação, domínio e infraestrutura, permitindo que o código seja altamente testável, reutilizável e escalável.

Na arquitetura Clean Dart, a camada de aplicação atua como intermediária entre a interface do usuário e a lógica de negócios da aplicação. A camada de domínio contém as regras de negócios da aplicação e a camada de infraestrutura é responsável por lidar com a persistência de dados e a comunicação com serviços externos.

Esta arquitetura também incentiva o uso de padrões de programação como Injeção de Dependência, Programação Orientada a Interfaces e Test-Driven Development (TDD) para garantir a qualidade do código e tornar o processo de desenvolvimento mais eficiente.

No caso desta versão do projeto, a idéia de utilizar TDD foi deixada de lado pois já temos toda a UI do aplicativo.


## Camadas da Aplicação
![Arquitetura](https://github.com/Flutterando/Clean-Dart/blob/master/imgs/img3.png)

Para questões de legibilidade, optei por usar o padrão de pastas do MOBX e do Modular, juntamente com a arquitetura de pastas do Clean Dart.
Dentro de cada pasta com o nome do módulo, temos a seguinte divisão: <br><br>
    - **Domain:** A camada de Domain hospedará as Regras de Negócio Corporativa(Entity) e da Aplicação(Usecase). Nossas Entidades devem ser objetos simples podendo conter regras de validação dos seus dados por meio de funções ou ValueObjects. A Entidade não deve usar nenhum objeto das outras camadas.Os Casos de Uso devem executar a lógica necessária para resolver o problema. Se o Caso de Uso precisar de algum acesso externo então esse acesso deve ser feito por meio de contratos de interface que serão implementados em uma camada de mais baixo nível.<br><br>
    - **External:** Aqui começaremos a implementar os acessos externos e que dependem de um hardware, package ou acesso muito específico.Basicamente a camada External deve conter tudo aquilo que terá grandes chances de ser alterado sem que o programador possa intervir diretamente no projeto.<br><br>
    - **Infra:** Esta camada dá suporte a camada Domain implementando suas interfaces. Para isso, adapta os dados externos para que possa cumprir os contratos do domínio.<br><br>
    - **Presenter:** A Camada Presenter fica responsável por declarar as entradas, saídas e interações da aplicação. Usando o Flutter como exemplo, hospedaremos os Widgets, Pages e também Alguma Gerência de Estado<br>


## Gerencia de Estados

Como este é um aplicativo com muitos "states" e com diversas páginas, utilizei um pacote chamado MOBX (para gerenciar o estado da aplicação com geração de código) e também o Modular para injeção e inversão de dependencias.

## MOBX

MOBX é uma biblioteca de gerenciamento de estado para aplicativos em JavaScript e Dart. Ele permite que os desenvolvedores definam estados observáveis em seus aplicativos e atualizem automaticamente a interface do usuário sempre que houver uma mudança no estado.

O MOBX é baseado no padrão de arquitetura Flux, que enfatiza a unidirecionalidade do fluxo de dados na aplicação. Ele também suporta a programação reativa, o que significa que os desenvolvedores podem definir expressões computacionais que se atualizam automaticamente sempre que o estado subjacente é alterado.

O MOBX é especialmente útil em aplicativos grandes e complexos, onde o gerenciamento de estado pode se tornar uma tarefa difícil. Ele fornece uma maneira clara e organizada de gerenciar o estado do aplicativo, tornando o código mais fácil de ler, testar e manter. Além disso, o MOBX é altamente personalizável e pode ser integrado facilmente com outras bibliotecas e estruturas de aplicativos.


### MODULAR

Modular é um framework de gerenciamento de estado e roteamento de aplicativos em Flutter. Ele enfatiza a modularidade e a reutilização de código, permitindo que os desenvolvedores dividam suas aplicações em módulos independentes que podem ser desenvolvidos e testados separadamente.

O Modular fornece uma maneira clara e organizada de gerenciar o estado do aplicativo, permitindo que os desenvolvedores definam estados observáveis em seus módulos e atualizem automaticamente a interface do usuário sempre que houver uma mudança no estado. Além disso, ele oferece um sistema de injeção de dependência poderoso que permite que os desenvolvedores injetem facilmente dependências em seus módulos.

O roteamento no Modular é baseado em rotas nomeadas, permitindo que os desenvolvedores definam rotas para cada módulo separadamente. Isso simplifica o gerenciamento de rotas e torna a navegação entre telas mais fácil e flexível.

O Modular também é altamente personalizável e pode ser integrado facilmente com outras bibliotecas e estruturas de aplicativos. Ele oferece suporte a testes automatizados e possui uma comunidade ativa de desenvolvedores que fornecem suporte e recursos adicionais para os usuários.