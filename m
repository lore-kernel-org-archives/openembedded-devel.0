Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIwFg-0000WO-Pr
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 07:09:56 +0200
Received: by bwz5 with SMTP id 5so3754968bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Y08AT955aFPb9Z48M8jG+UqsUIoy1PBADN56mq9PN/U=;
	b=qycTqUpyqdFU5z0T3VXHF/yinQ+UWGOUwAKDKOy710bdMXS/whTielR+Eu9C3KOnzK
	6jAv64bTlfqrbCIFtDX0IjOQGXT1bHABAFFW0mR0geFuj6RMegU1qXLkOQa69rG3fe3k
	Xh8hocoX0F1wc4Ekc7nqF0+I+XMFAHPE9TqJQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=kW1ICBvoPSj5Mmkbby9djKt+llhhkENlaVrCmihlUDAckUWXdDLihNoQCU8YWpx02m
	Bx6rK5JTrrxvv4y43NHx3De7VW1Wa4sIP3QPB0TJJ2cF2eTFghPYuciNhI3sYvqyGqmH
	TmngAfMamiWDD3Nm6ivHyhuW9IpzKBPnSOFgc=
MIME-Version: 1.0
Received: by 10.204.178.65 with SMTP id bl1mr4057468bkb.189.1304831231903;
	Sat, 07 May 2011 22:07:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sat, 7 May 2011 22:07:11 -0700 (PDT)
In-Reply-To: <20110508045032.GG17773@jama.jama.net>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
	<1304822586-14872-11-git-send-email-otavio@ossystems.com.br>
	<20110508045032.GG17773@jama.jama.net>
Date: Sun, 8 May 2011 02:07:11 -0300
X-Google-Sender-Auth: kiT7rj5N73S9_DqE-R5cr3BU2Nw
Message-ID: <BANLkTimYL-LburqA5xM3sGoUAa9B65WAhg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 11/11] qt4: fix 4.7.2 checksum
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
X-List-Received-Date: Sun, 08 May 2011 05:09:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 01:50, Martin Jansa <martin.jansa@gmail.com> wrote:
>> -SRC_URI[md5sum] =3D "6f88d96507c84e9fea5bf3a71ebeb6d7"
>> +SRC_URI[md5sum] =3D "66b992f5c21145df08c99d21847f4fdb"
>> =A0SRC_URI[sha256sum] =3D "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d24=
5105137481d092b124a"
>
> ^^ what about sha here?

I have it fixed locally; sent the wrong patch by mistake.

I can resend it...

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


