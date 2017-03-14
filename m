Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6053977824
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 18:28:18 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u108so24956490wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 11:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cyWAYV98gUgdpUmUcpei9Eq0xKVJeB9y1D+widjrzjs=;
	b=vIVfNrOsABcVmHdyQjSfZsLVRrTDKSdDgYe2mSn06+KV3Xvz6jHIqE1bPy3oaRw9hM
	bGzuivn0eUN2msRRmbLtwAwOr9zCvb7dfokU7ZOUzxgwxxHvVHal3N5O+5hM/jNqTsYR
	zGTtOCW0RsAMcG75gXr6Ag/j1HyW171SbbxrUrrP2bq+5q4peYY/cZFPJB7p9PdTbu+D
	4TQUwolE0n5HDm2ATK6kov+Ut5aFqf8q4I0EoEsKm3tmcCypaUBj2lcIVlc8o0VZejSi
	iJLo5+2a7/697I/VTband59LIktkXIrfQLtSqlryINTXv/TQ1JlYENghpqWu+jeepbpb
	m26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cyWAYV98gUgdpUmUcpei9Eq0xKVJeB9y1D+widjrzjs=;
	b=EJhMXPQDjnbl0GHvssyuy39oySHgoMgWSB0pMmXBMScGgWbWUZ2SIn4ioXu2ACuPZd
	rEfnsCB/hrFweoiBLHWK/rhZ774nCBsDJQ+fDa5Ju9TJxRyB1mdWLOB4g5W8SW9eOeTj
	aAJivmmtHe2DZJM0ELLrMKy/VLoQxwPslTuAUI2atJxXQhA9ClXb+cI4HXCWF77gHqSE
	7kL5wwItoDqyEByoluZPcXodXjFq0cWwAW5mTZVSc5XkK8VNVOoPBVN/b36gDbsN4JvO
	sBxrYqJW6OL5t6CJRdrcYO64OuFVVuruERdaPGj6IdCt3sPabgCvetPPNeTsmqPuj/Yq
	6ouQ==
X-Gm-Message-State: AMke39kupnx36VJ8ZefIORtoxu79WYDvRoN7Fq6phkeSh9mtYjAhd5VwEI6AfLE4LDpv5g9Gi4yuemTe5y9SiA==
X-Received: by 10.223.136.66 with SMTP id e2mr34810981wre.14.1489516099808;
	Tue, 14 Mar 2017 11:28:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 14 Mar 2017 11:28:19 -0700 (PDT)
In-Reply-To: <1489505792.23237.1.camel@pelagicore.com>
References: <20170222102510.13059-2-gordan.markus@pelagicore.com>
	<1489505792.23237.1.camel@pelagicore.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Mar 2017 19:28:19 +0100
Message-ID: <CA+chaQfbZ7Nx6uNKACEkf-jnJfpkzm+ym50SfY=HV_WA2zibPw@mail.gmail.com>
To: =?UTF-8?Q?Gordan_Marku=C5=A1?= <gordan.markus@pelagicore.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebengine: add commercial licence
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
X-List-Received-Date: Tue, 14 Mar 2017 18:28:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It didn't make it into patchwork, please resend.

On Tue, Mar 14, 2017 at 4:36 PM, Gordan Marku=C5=A1 <gordan.markus@pelagico=
re.com
> wrote:

> Bumping the topic. Has anyone had the time to review this patch?
>
> On Wed, 2017-02-22 at 11:25 +0100, Gordan Marku=C5=A1 wrote:
> > Signed-off-by: Gordan Marku=C5=A1 <gordan.markus@pelagicore.com>
> > ---
> >  recipes-qt/qt5/qtwebengine_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-
> > qt/qt5/qtwebengine_git.bb
> > index 8e60d72..a4ee055 100644
> > --- a/recipes-qt/qt5/qtwebengine_git.bb
> > +++ b/recipes-qt/qt5/qtwebengine_git.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY =3D "QtWebEngine combines the power of Chromium and Qt"
> >
> >  # Read http://blog.qt.io/blog/2016/01/13/new-agreement-with-the-kde-
> > free-qt-foundation/
> > -LICENSE =3D "LGPL-3.0 & BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-
> > 1.0"
> > +LICENSE =3D "BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-
> > Qt-Company-Commercial ) & ( LGPL-3.0 | The-Qt-Company-Commercial )"
> >  LIC_FILES_CHKSUM =3D " \
> >      file://src/core/browser_context_qt.cpp;md5=3Db5193b7d68699260f3b40
> > b201365c8d2;beginline=3D1;endline=3D38 \
> >      file://src/3rdparty/chromium/LICENSE;md5=3D0fca02217a5d49a14dfe2d1
> > 1837bb34d \
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

