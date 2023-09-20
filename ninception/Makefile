# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgarcia <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/19 10:55:53 by rgarcia           #+#    #+#              #
#    Updated: 2023/09/19 10:55:58 by rgarcia          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE	=	docker-compose -f ./srcs/docker-compose.yaml

VOLUMES	=	${shell docker volume ls -q}

MARIADB_PATH	=	/home/rgarcia/data/mariadb
WORDPRESS_PATH	=	/home/rgarcia/data/wordpress

all :
	mkdir -p ${MARIADB_PATH} ${WORDPRESS_PATH}
	${DOCKER_COMPOSE} up -d --build

down :
	${DOCKER_COMPOSE} down

stop :
	${DOCKER_COMPOSE} stop

reload : down all

clean : down
	docker system prune -af --volumes

fclean : clean
	docker volume rm ${VOLUMES}
	sudo rm -rf ${MARIADB_PATH} ${WORDPRESS_PATH}

re : fclean all

.PHONY: all clean fclean re stop down
