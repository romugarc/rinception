# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jrinna <jrinna@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/03 10:05:32 by jrinna            #+#    #+#              #
#    Updated: 2023/01/04 11:07:42 by jrinna           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

DC := docker-compose -f ./srcs/docker-compose.yaml
volumes = ${shell docker volume ls -q}

all :
	${DC} up -d --build

down:
	${DC} down

stop:
	${DC} stop

clean : down
	docker system prune -af --volumes

fclean : clean
	docker volume rm ${volumes}

re : fclean all

.PHONY : all clean fclean re down stop