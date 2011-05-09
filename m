Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW5v-0003vV-Ne
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:26:16 +0200
Received: by wwb17 with SMTP id 17so5033107wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=0EC4OhJveDAJDeLmzkApaodHJuSUjO87u72EcNcCdzw=;
	b=j4zHMm3hi2DxyPaTWAJCs0Ghq3M+xy8162x+uo9LTKkGk0/rPYID01crMpDLzSlBtp
	WAe0WhuK6KzFApPA62H67B+ASZEjmnynkftXKvWxRIbG2TLmUL586JfgJbah+qSrSDvT
	o1RvHeOFUfQ/mipWudY21jAju8afFj+zAp9r4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=NYchHeb7Ep54TZNTQpnh42j6MOGBN/zjaNyaYyJ2qdcZKXqXJfhkcfs8yRScAlG7qo
	DSbbU4uRk0mUiK5G6+ZJ2Aekf5pFCo/VKigXTV8ywcFpMnkJIRTb38frlLJlJPkcYzeG
	3iAIxcjo1SY7HtfdwrcEuSpHleCC4RHJsLY3g=
MIME-Version: 1.0
Received: by 10.216.82.77 with SMTP id n55mr7377191wee.52.1304969007033; Mon,
	09 May 2011 12:23:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Mon, 9 May 2011 12:23:26 -0700 (PDT)
In-Reply-To: <1304968617-4949-3-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
	<1304968617-4949-3-git-send-email-otavio@ossystems.com.br>
Date: Mon, 9 May 2011 16:23:26 -0300
X-Google-Sender-Auth: 86bg2eVgzoukrr7evKKigAB97I4
Message-ID: <BANLkTimfGfGi7iL010zDw4e=C64kgN=aaQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v4 03/12] setxkbmap: add version 1.2.0
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
X-List-Received-Date: Mon, 09 May 2011 19:26:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 9, 2011 at 16:16, Otavio Salvador <otavio@ossystems.com.br> wro=
te:
...
> +require xorg-app-common.inc
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D22c34ea36136407a77702a8b784f9=
bd0"
...

This one failed on build test and a fixed one will be send later.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


