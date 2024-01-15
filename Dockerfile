# Ultroid - UserBot
# Copyright (C) 2021-2023 TeamUltroid
# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >
# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM theteamultroid/ultroid:main

# set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN pip3 install -U telegraph

COPY installer.sh .

RUN bash installer.sh

# changing workdir
WORKDIR "/root/TeamUltroid"

ENV HOSTNAME "0.0.0.0"

EXPOSE 80

# start the bot.
CMD ["bash", "startup"]
