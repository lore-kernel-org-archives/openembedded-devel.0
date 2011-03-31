Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5OpG-0000SJ-ST
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:50:45 +0200
Received: by fxm19 with SMTP id 19so2469324fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=OVNA2qc6NegVzy/1jScZGul+jKbUmgbmhY+YVeMBwJ8=;
	b=ImRLijuaIxfmo2kMy2GM+VakW6zdooN+3vnDHCNZKA5pgXcX68ReEcGFvaLNuM5V+U
	Zj7Mrtvf4XDqpGYRMv4ofL5fEkekmT5+GhOnGJWkTMQrCUWlUKc3ip63UkrZZDKuaW5Z
	swpovWfVia4luh8tYXb0nH/WOjEhuUe+PTJAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=PFnOPBoi5TE+nQnBO7G3hgseibEJV5XRso0pQTPVWEnQpN6IATYKpAbsJJsmSzbOOs
	RmcmvyFzz46VSp84tztM9SnmthoN3v/i94WwhHpeMOx/81HliYiPdGu3Q0PWufDClpLH
	MzePE3UHjlECrdZvalARIwuSanmwl6QkbZ6yw=
Received: by 10.223.95.135 with SMTP id d7mr1301431fan.65.1301604068099; Thu,
	31 Mar 2011 13:41:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 13:40:38 -0700 (PDT)
In-Reply-To: <dff2afec47fd746f45b9f630bf14755f40a8fdc5.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
	<dff2afec47fd746f45b9f630bf14755f40a8fdc5.1301560589.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 13:40:38 -0700
Message-ID: <AANLkTikvnKY+hdT9ck4TpG9vvTR9MHKvLxgjRGHjKY2R@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/8] illume-keyboards-shr: add LICENSE
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
X-List-Received-Date: Thu, 31 Mar 2011 20:51:01 -0000
X-List-Received-Date: Thu, 31 Mar 2011 20:51:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 2:14 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I hope you made sure that all license files in a package source are checksu=
mmed.

whole series is ok where I had question I replied to individual patch

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../recipes-efl/e17/illume-keyboards-shr/LICENSE =C2=A0 | =C2=A0 25=
 ++++++++++++++++++++
> =C2=A0.../recipes-efl/e17/illume-keyboards-shr_git.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A07 +++--
> =C2=A02 files changed, 29 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr/LI=
CENSE
>
> diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE b/meta=
-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
> new file mode 100644
> index 0000000..61bb2f6
> --- /dev/null
> +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
> @@ -0,0 +1,25 @@
> +Copyright notice for Enlightenment:
> +
> +Copyright (C) 2000-2010 Carsten Haitzler and various contributors (see A=
UTHORS)
> +
> +All rights reserved.
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions are m=
et:
> +
> + =C2=A0 1. Redistributions of source code must retain the above copyrigh=
t
> + =C2=A0 =C2=A0 =C2=A0notice, this list of conditions and the following d=
isclaimer.
> + =C2=A0 2. Redistributions in binary form must reproduce the above copyr=
ight
> + =C2=A0 =C2=A0 =C2=A0notice, this list of conditions and the following d=
isclaimer in the
> + =C2=A0 =C2=A0 =C2=A0documentation and/or other materials provided with =
the distribution.
> +
> +THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
> +INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY=
 AND
> +FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> +COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT=
 NOT
> +LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DA=
TA,
> +OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY O=
F
> +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTW=
ARE,
> +EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/meta-=
efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> index fe34513..e3b182d 100644
> --- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
> @@ -1,15 +1,16 @@
> =C2=A0SECTION =3D "x11/data"
>
> =C2=A0SRC_URI =3D "git://git.shr-project.org/repo/illume-keyboards.git;pr=
otocol=3Dhttp;branch=3Dmaster \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-update-KEYBOARD=
S_DIR-for-new-illume2.patch"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-update-KEYBOARD=
S_DIR-for-new-illume2.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://LICENSE"
> =C2=A0S =3D "${WORKDIR}/git"
>
> =C2=A0SRCREV =3D "4064489f359a1addf572089b582f317dff5f50e1"
> =C2=A0PV =3D "0.0+gitr${SRCPV}"
> =C2=A0PE =3D "1"
> =C2=A0PR =3D "r4"
> -LICENSE =3D "unknown"
> -
> +LICENSE =3D "MIT BSD"
> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE;md5=3Df523ab5986cc79b52a=
90d2ac3d5454a2"
>
> =C2=A0PACKAGES =3D "\
> =C2=A0illume-keyboard-alpha \
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


