Received: from mail-vw0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R1SHf-000544-HE
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 02:15:59 +0200
Received: by vwm42 with SMTP id 42so253228vwm.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=L8V+912pBAHVYJhV57RfucjuMSk2F0Zy4vQdlJDPB1M=;
	b=RHE8LqodWGBcdNS0CFFS43qZZ5iRxKDyLzfzQukY2MU8xemZ1A0XjGz2ViJd99gaN1
	hhHlWYj7Uky1m8mOQuEbHLUI5m1/wOtDpzefJa3iwwbsjyPlHgD5duhmgxVpsopaHTjT
	icNvNmxN7dVupwwU+J3sIjhYlhEHirAmP6+H4=
MIME-Version: 1.0
Received: by 10.52.65.65 with SMTP id v1mr51373vds.19.1315440649117; Wed, 07
	Sep 2011 17:10:49 -0700 (PDT)
Received: by 10.52.160.7 with HTTP; Wed, 7 Sep 2011 17:10:49 -0700 (PDT)
In-Reply-To: <1315443807-16046-1-git-send-email-errordeveloper@gmail.com>
References: <1315443807-16046-1-git-send-email-errordeveloper@gmail.com>
Date: Thu, 8 Sep 2011 01:10:49 +0100
Message-ID: <CAPhDKbFj1uwo_tM0AUqawAJtRjMAYrFa1yROnRzJAdAPFxLnQA@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Thu, 08 Sep 2011 00:15:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

sorry for the duplicate, I'm to tired and should go to sleep!

On 8 September 2011 02:03, Ilya Dmitrichenko <errordeveloper@gmail.com> wro=
te:
> Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
> ---
> =A0recipes/binutils/binutils_2.20.1.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binut=
ils_2.20.1.bb
> index 5154e2d..f40b676 100644
> --- a/recipes/binutils/binutils_2.20.1.bb
> +++ b/recipes/binutils/binutils_2.20.1.bb
> @@ -24,8 +24,8 @@ SRC_URI_append_nios2 =3D" \
> =A0 =A0 =A0 =A0file://binutils-nios2.patch \
> =A0 =A0 =A0 =A0"
>
> -SRC_URI[tarball.sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab523a0=
800a7d53df906498afe6f6f8"
> -SRC_URI[tarball.md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
> +SRC_URI[tarball.sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27=
397dc06281905d9717c8ed64"
> +SRC_URI[tarball.md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
>
> =A0# powerpc patches
> =A0SRC_URI +=3D "\
> --
> 1.7.3.4
>
>


