# Clase 25 - AWS IAM.
Fecha: 2023/08/25

## Objetivo
En esta clase vamos a hablar sobre el servicio IAM, este es el encargado de gestionar los usuarios, grupos y permisos de nuestra cuenta de AWS.

## Caso:

Una empresa de desarrollo recienmente activo una cuenta de AWS y desea dar acceso a su equipo para poder realizar acciones en la cuenta, sin embargo, no desea que todos los usuarios tengan acceso a todos los recursos.

Para esta primera etapa se va a replicar la siguientes roles correspondiente al area de ingenieria.

- Software Engineer: los miembros de este grupo podran visualizar informacion de las instancias EC2, pero no podran realizar ninguna accion sobre ellas.
- DevOps Engineer: El equipo de DevOps podra realizar acciones sobre las instancias EC2, pero no podran crear nuevas instancias y no podra apagarlas.
- Cloud Engineer: El equipo de Cloud podra realizar todas las acciones pero no podra terminar instancias.
- Manager Engineer: El Manager podra realizar todas las acciones incluso terminar instancias.
- Automation Script: este role solo puede detener e iniciar instancias EC2.

## Practica:

Elaborar el codigo terraform para poder crear los recursos necesarios para Cloud Engineer.

## Recursos terraform:

* [aws_iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)
* [aws_iam_user_login_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile)
* [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)
* [aws_iam_group_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment)
* [aws_iam_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)
* [aws_iam_group_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership)