Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5OgP-0006oe-Ja
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:41:35 +0200
Received: by fxm19 with SMTP id 19so2461196fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=IQAYpfXqHBbupN/uXxWVyg1tuHNqhu1d166sInW2Eh8=;
	b=vprx03oOeC0/1iTNBgiSNe7Twpd4LWDaLoJBMiVGE4VaPf+m3/gsdJZrwUvVNpNo4k
	Jd99ZOEueQpMTwORiPbkXk5eB5XhBtOAFwxFcnUHyyiIUl7IWK+0sSdxDR36YUGjyzq1
	oKRrZrWCw/8TpuY1WCXyUDvuAKyE15hYLalQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=k3PA3gu55fJ7gFrLt1I7yupHR7hMdf38FnUY1wfsf8d468No5NzERCZhAmkrhWNxJX
	eGrZyPA6XMMM+fA/CYmWzJoPYRrYBdC48SfH2a+fcvzjXXg/JsDx6Zi5i8SAfslyTpzu
	lgPcw36OLp7KUK+3/gBnqDwrl1XVn2Hy33tSo=
Received: by 10.223.127.210 with SMTP id h18mr471730fas.46.1301603973130; Thu,
	31 Mar 2011 13:39:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 13:39:03 -0700 (PDT)
In-Reply-To: <8d76bc22e6b97944d4af16b2d9a6e318200d857b.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
	<8d76bc22e6b97944d4af16b2d9a6e318200d857b.1301560589.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 13:39:03 -0700
Message-ID: <AANLkTimZoMAuYXF4BruMZyZVU8T_M-AcaJ8S2BWZVmtW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 7/8] task-x11-illume: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 20:41:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 3:17 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0meta-efl/recipes-efl/tasks/task-x11-illume.bb | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/rec=
ipes-efl/tasks/task-x11-illume.bb
> index 8b14adb..e197cc7 100644
> --- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
> +++ b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
> @@ -1,6 +1,7 @@
> =C2=A0DESCRIPTION =3D "The Illume Windowing Environment -- install this t=
ask to get the Enlightenment Window Manager + the Illume environment."
> =C2=A0SECTION =3D "x11/wm"
> =C2=A0LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${TOPDIR}/meta-openembedded/meta-efl/COPYIN=
G.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420"

why not copy the license file to workdir first

> =C2=A0PV =3D "1.0"
> =C2=A0PR =3D "r1"
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


