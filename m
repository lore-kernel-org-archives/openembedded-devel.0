Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qbjno-0007tY-Ut
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 03:42:53 +0200
Received: by bwf20 with SMTP id 20so775161bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5pSLpYOZ1MONtS7ruplVnPGunZKM4NAWzXK5rBxlLFE=;
	b=l6gdMUcZ4eGERrqeRf++tG7F/xEixUFp6hB/XHusApPpSSIOH2B0j5y6zXw+mo+hFl
	LSmvHJXLt7iL3KW6EZI7C0iS7CguLSHrjM/EiGbWleMr+/asNxrBD3FcLh5vRE99O04M
	OmPJtcakxFC7uxFWxveKSMPXnzqUOj5I8ucZQ=
MIME-Version: 1.0
Received: by 10.204.39.14 with SMTP id d14mr166379bke.200.1309311546069; Tue,
	28 Jun 2011 18:39:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.73.70 with HTTP; Tue, 28 Jun 2011 18:39:06 -0700 (PDT)
In-Reply-To: <4E0A75FB.5080204@gmail.com>
References: <cover.1309203431.git.otavio@ossystems.com.br>
	<0a7128c3166d0729292e664918b76cf5b7074fe5.1309203431.git.otavio@ossystems.com.br>
	<4E0A75FB.5080204@gmail.com>
Date: Tue, 28 Jun 2011 22:39:06 -0300
X-Google-Sender-Auth: tj6oBATkvoCgzaSaQ1flyyZRAho
Message-ID: <BANLkTiknFLCGKUvGACm_asA9vrt3bmdH1Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [[meta-oe][PATCH 1/4] xf86-video-geode: add 2.11.12 version
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
X-List-Received-Date: Wed, 29 Jun 2011 01:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 21:46, Khem Raj <raj.khem@gmail.com> wrote:
...
>> +COMPATIBLE_HOST =3D "i.86.*-linux"
>
> Is it available for strictly x86 or can x86_64 use it.

x86 only AFAIK.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


