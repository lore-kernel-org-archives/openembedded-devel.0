Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIn2m-0006Aj-Rz
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 21:20:00 +0200
Received: by bwz5 with SMTP id 5so3617095bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5xlbByCaKu3xdLdtELh/FLlASIx57+g8DPZkr01IN3Y=;
	b=R7Ut95j5C+xhmDsfn3jmWhaVoh4OL6A6ua/TRbQQrg5CXSGnoqNChXmNtEg0y/6/tw
	LVMpVl1fFqoYVnAJqvEqp1cgH0HvEcJS4ce4OP5u/2Y/N08KktmwpWpwNvL2OsGzIHA3
	M8oc0WkfvZifuHNap79aSe1JPAz/emp3iIXFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=U5G95mWFRnsQ9a7UbEYQhs/vJNiVvUKHffBkrPULkKKjOgtzRt5z8LZiMd8t/6lYZS
	d8vwTHclbiP90rFe1TMzOe0jm9tUUMp/BrfmZUGaIIe7QT24XtcazXUU8FLld4TbCwQT
	Svbxsg5n7Eq4AlWXyMADEZvEzZao8rqeZ0aM4=
MIME-Version: 1.0
Received: by 10.204.36.7 with SMTP id r7mr2933116bkd.2.1304795838675; Sat, 07
	May 2011 12:17:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.70.138 with HTTP; Sat, 7 May 2011 12:17:18 -0700 (PDT)
In-Reply-To: <1304773638-24877-1-git-send-email-morphis@gravedo.de>
References: <1304773638-24877-1-git-send-email-morphis@gravedo.de>
Date: Sat, 7 May 2011 16:17:18 -0300
X-Google-Sender-Auth: qKVKB6tQY8T-i1c8Ly_ND2xNPTI
Message-ID: <BANLkTik1ArwPz=B-OGrsfNWza2ad4d4g6Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4-libs-native: add initial recipe
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
X-List-Received-Date: Sat, 07 May 2011 19:20:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, May 7, 2011 at 10:07, Simon Busch <morphis@gravedo.de> wrote:
> The native version of the qt4 libraries is needed by some other native re=
cipes to build.
> It's mostly a copy of the qt4-tools-native recipes with some changed conf=
iguration optons
> and is only available for version 4.7.2 now.

I second this idea since I will be a user of it but seems better to me
to have a full qt4-native since this would reduce build duplication
time, no?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


