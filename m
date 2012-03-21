Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1SALFl-0003eC-6y
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 14:07:01 +0100
Received: by vbbfr13 with SMTP id fr13so509930vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=vRxV2ajDDrB8nMlgUjcCavzPiZ4KylDHpoU7m5LQmQI=;
	b=Q0AAZPCXq4vbRNMlbbtM7rUAAnf++Hnu9RHm9S+sZTUe06oXoO+1++e6kNt2uxfMFb
	dUqDb45L7inLW596Ol+XNG2aNouk9n3BjPMCx2VCxt5XOXKd/JZpJXOPdp3jml7IAfUO
	ztV1J+uYvvs3nFrrfmUcD0AjsWSs6+HUcQzHisxj0YwwmA9sTJQmaFkpabSoymFfuXIS
	LLyVmQ7mGn2m7t4xGO3DuZ7QWSvnVCW+u+szRZ2LKCmf0wpC9Q6P++xjOQB0EAPJz/mz
	MUxuBEa7G4cGHz+kyxZSansBbtlfFYjg/uTUhrU78y7ybo8NsP9AoGe3XQ76agBGziNs
	e8Tw==
MIME-Version: 1.0
Received: by 10.220.198.135 with SMTP id eo7mr1824492vcb.35.1332334687209;
	Wed, 21 Mar 2012 05:58:07 -0700 (PDT)
Received: by 10.52.69.37 with HTTP; Wed, 21 Mar 2012 05:58:07 -0700 (PDT)
In-Reply-To: <1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
References: <4F69AF4A.8050809@dresearch-fe.de>
	<1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
Date: Wed, 21 Mar 2012 13:58:07 +0100
Message-ID: <CACW_hTajN1uYw1XkE9=zbFnG7rx4sjR0i_sd0B8TVaH4TudF+A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Wed, 21 Mar 2012 13:07:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/3/21 Steffen Sledz <sledz@dresearch-fe.de>:
> libmatthew-java-0.7.1.tar.gz is no longer available at the original
> location.
>
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
> =A0recipes/libmatthew/libmatthew_0.7.1.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/libmatthew/libmatthew_0.7.1.bb b/recipes/libmatthew/=
libmatthew_0.7.1.bb
> index 266a0d4..6916e56 100644
> --- a/recipes/libmatthew/libmatthew_0.7.1.bb
> +++ b/recipes/libmatthew/libmatthew_0.7.1.bb
> @@ -2,7 +2,7 @@ require libmatthew.inc
>
> =A0PR =3D "r0"
>
> -SRC_URI =3D "http://www.matthew.ath.cx/projects/java/libmatthew-java-${P=
V}.tar.gz \
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/libmatthew-java/lib=
matthew-java-0.7.1.tar.gz/6a4db221129f230c64a0f937d00bb703/libmatthew-java-=
${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://Makefile-0.7.patch"
>
>
> --
> 1.7.7
>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


