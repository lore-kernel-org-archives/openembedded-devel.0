Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6363B786BD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 19:06:55 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id u3so5640360pgn.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 11:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AkUIb6yMYfCdMD6uqiaJlaHQ62q5HQm0BXHjoshhRsY=;
	b=eo+gwpdbs7WSgisFL2IUaabikbWRIW9dJozRZUAG5ReWjLqWIHSKdMr8uJ5U+A1Hsz
	1geXyjaLarZwd+inZNEiLmvEPMisYEUQcwX796eJRytyRwjmjhgetIEz/l7jNaVx24F1
	Aw1BEmxnqE3f7U00zfDHF26ww+t2ZbsrQ/OlmSGuGOIS/4bWi7Qy0+VhncZuM5X92sK9
	RcxW/jDzk8aeHymForwYU9GyOpE+QsI99B0IInbcfygn8WMRlrEcGKfQLqO6GyMeX4Wi
	8y1LogrM7ygJJI2Ec+4SqddXB43hIG0e+iMrifa0fgxlEj+qhVEd8PG5ZOk0RPCOonUf
	xfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AkUIb6yMYfCdMD6uqiaJlaHQ62q5HQm0BXHjoshhRsY=;
	b=R69PomUDMcIs46ZmCKYrG6duxavAtxyYLZUWnwmDoId+VikyRaT0YTZZzxiIh2x6Ow
	g+tKwQOl0FfBy5Ym5RzWpP4XUA5D37Pai/62OgoXB8tr6fSqj9OLE795oq9Taq7ggpFv
	SRZGLMM99imxakMmUZqmiAA748O9G5KCEC6/ZQgmXSFZI4OTgC3D6EuP7qV7SqzpFtE6
	yJMjAZBVgOUQodqfsBbzxqPRzr4TlxhGOtKYFoj0V7MpKN04xhl3ggJM/g1rmtYZMH+W
	cbC+OOonnxgeGcX7OfALeAt8nHo+z4lLX44nEK1b5riqOBdlDXnRyOG+hVCKLYAHMCoH
	3qmg==
X-Gm-Message-State: AJaThX4dFczSBtxnLmEXDlEaNQWP+Xa8Ie5NKdXdYAisQmET206tz73+
	y3lmfwjRbtaay/eg9fvsqva3SUzppTwgHnsYv0Q=
X-Google-Smtp-Source: AGs4zMaCuFl2ghwFANydnMjcM3HVRjF66Tft8qO3ITfm7hGWF4BU8c31wteX7zK/bZYIOoG3f/LQRmvZh3qOATvIeNQ=
X-Received: by 10.84.217.2 with SMTP id o2mr11182934pli.338.1511118417191;
	Sun, 19 Nov 2017 11:06:57 -0800 (PST)
MIME-Version: 1.0
References: <1511116899-6122-1-git-send-email-akuster808@gmail.com>
	<1511116899-6122-2-git-send-email-akuster808@gmail.com>
In-Reply-To: <1511116899-6122-2-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Nov 2017 19:06:46 +0000
Message-ID: <CAMKF1sr77pxjxNFw9ZUbCZzRTwnPxvOc73cUF7gj9kDPuF3+Zw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: akuster@mvista.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] debootstrap: change license to MIT
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Nov 2017 19:06:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2017 at 10:42 AM Armin Kuster <akuster808@gmail.com> wrote:

> The closest thing to a license is found in the
> http://metadata.ftp-master.debian.org/changelogs/main/d/debootstrap/deboo=
tstrap_1.0.92_copyright
>
> The verbage looks very close to MIT so seems reasonable make to change th=
e
> license to MIT instead of
> creating a custom entry for debootstrap-custom-license. This follows what
> Redhat, Mandriva and Suse have for this package. (see rpmfind)
>

That=E2=80=99d be ok please include diff in verbiage when compared to MIT l=
icense
general template in the commit log


> will fix: WARNING: debootstrap-1.0.67-r0 do_populate_lic: debootstrap: No
> generic license file exists for: debootstrap-custom-license in any provid=
er
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> index 62b2796..8472aca 100644
> --- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> +++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Install a Debian system into a subdirectory"
>  HOMEPAGE =3D "https://wiki.debian.org/Debootstrap"
>  SECTION =3D "devel"
> -LICENSE =3D "debootstrap-custom-license"
> +LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://debian/copyright;md5=3D1e68ced6e1689d4cd9dac75ff5225608"
>
>  inherit pkgconfig
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

