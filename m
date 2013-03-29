Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ULeUb-0006dK-2t
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 19:57:37 +0100
Received: by mail-oa0-f41.google.com with SMTP id f4so614939oah.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=TRhabUqjl019o8XlV3UhnawWcNx5KLi2+OPZ7QGTMJw=;
	b=RAiVr2aFeCbSyVlfWEqV6bETckmINJdOLr1XBptk+ChrZKS6FxkCnsjDdSe3JmRxel
	fPdXdEBalhHGK5yDjmRSUhHJdXUTHBtNEXMkhZs50y/BqVFkWq9SDsrcPUSg5y9jsro2
	UA5ph2H8ts6f+cuKtn6eIJ4AFZL9g/i52p9V4IkbggMrO9pTsvO6ql9Fwz9Pv/gfe6TU
	Tk6zJdtGz5lA6Rf/rHfDGf6fi/UYiVjNqfNMs6XnTROPldnkqe+wdkhAU72Jci0r1gK3
	u2tK4drd4COreEhtN4PQzKRCQSo5ZRQXKU6wSx2d+gsOV1+Hgz6KueOJiAz+rrkHNgpQ
	NLOA==
MIME-Version: 1.0
X-Received: by 10.60.19.129 with SMTP id f1mr1132279oee.82.1364582432304; Fri,
	29 Mar 2013 11:40:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Fri, 29 Mar 2013 11:40:32 -0700 (PDT)
Date: Fri, 29 Mar 2013 15:40:32 -0300
X-Google-Sender-Auth: 7KqYmrld-YLs6Ev7ZD6gyBrH1CQ
Message-ID: <CAP9ODKpCH=ENcLXZjJfgU-axzCd_bt5v=Grkh0iGKrbs0CdJTw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: [for-danny] Changes for cherry-pick
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 18:57:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Eric,

Please evaluate following changes for backport to danny (in order):

* f77a622f libgnomecanvas: fix QA warnings from packaging

* ee04484 libgnome: fix QA warnings from packaging

* eb329f15 libgnomeui: fix QA warnings from packaging

* 01dc42a7 libbonobo: fix QA warnings in packaging

* 9a954668 libbonoboui: fix QA warnings from packaging

* c7ff376b9 libgnomeprint: fix build with newer toolchain

* 45395dc1 libgnomeprint: fix packaging issues

* 2b3a6f6ee libgnomecups: fix build with >=glib-2.31

* 797d4aa8 libgnomecups: fix build with cups-1.6 from oe-core

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


