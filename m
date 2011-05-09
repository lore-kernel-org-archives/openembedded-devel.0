Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJFQX-000850-6E
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 03:38:25 +0200
Received: by bwz5 with SMTP id 5so4099924bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 18:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=N7V1+ncVMOZQoD7Y1kHQ/+H7TCvCLQ07Qi6MC8jxvns=;
	b=ikvslwOySyNxCHVFeNyfUqRqhWkTTA2rFtvJNiKY6IesgoqSaD8jwuMJ96vmgYjKia
	5kfDeQBj9abJiPKjmc9WY1UI6SlH6d0Fwco0NGCeBR/obi+dyoIwGR1QCLQtg5Kok+24
	9huJNxMNrp6w7iBjv73r6Jka73Lb5ffyNn7So=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=E1M3mKK8QaR9aT7bkHLBpWh0x1i4qWMgpXLOPch1+++lLXphVlpS2aOYp49TceZF+2
	LmEcMmPV9NgLiSFiDwFIgW9DHgHT1kToUs6gWV3tn3uppIqmAdugCnR/vEw8L/ijTDky
	F4PISb8xt2vUMqJJFljJ+5LjbuMha1vN08DCU=
MIME-Version: 1.0
Received: by 10.204.40.70 with SMTP id j6mr2949312bke.81.1304904939327; Sun,
	08 May 2011 18:35:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 8 May 2011 18:35:39 -0700 (PDT)
In-Reply-To: <1304885628-32679-1-git-send-email-morphis@gravedo.de>
References: <4DC6DA66.8090609@gravedo.de>
	<1304885628-32679-1-git-send-email-morphis@gravedo.de>
Date: Sun, 8 May 2011 22:35:39 -0300
X-Google-Sender-Auth: uavzW2pEN0PxU_qPuKEm7PC3F40
Message-ID: <BANLkTikAJnn3jeEmYW_Lc4UZRNrHYvcChw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4-native: introduce the native version of qt4 and remove old qt4-tools-native
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
X-List-Received-Date: Mon, 09 May 2011 01:38:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 17:13, Simon Busch <morphis@gravedo.de> wrote:
> Signed-off-by: Simon Busch <morphis@gravedo.de>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


