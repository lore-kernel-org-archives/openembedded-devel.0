Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6B36CECE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:57:30 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id r200so9074370iod.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O2eE7LHbFMjau6raMeSjrmliRK0tV4ni/X5iIXRIEyo=;
	b=IL2hQCxDhAQ5CU6ZnVLGETvyrH5gy0V2fKgJL3McV+JWouix5D+MT4rD5NNs5DamWl
	uKexN4c+aeWPK+N775GYxRcbxy+NseDCRak7lzE1Vpkm0VOwLLhmZMdKSac/rgtdK+s4
	aH2XD9GPwwRdDr0EB+NLDMG92NLZSOgN7FhumymjySwTDe3Nb0F35GiCaLvhPENyHJ8p
	2kMQ2J4H/odksFo/9sKRFPiYppXsrcBQUyyYU0WSg3T5t9agqBWYcoKp+kwOc5nUc8ok
	31B6QPPzbEziqPiuXONiLX0tJc0zBv/DdWysRTLTJ6msiXfinzWy8U7qnWiGcSBVYUK6
	mbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O2eE7LHbFMjau6raMeSjrmliRK0tV4ni/X5iIXRIEyo=;
	b=mHgX+BYI0uHXIPz+RZg98zEUQWGiqUWmVRTnCwT6f00uXUDQXdNzEfdK4R7GeeHlYG
	KzhrOou3/lAg28lC6vafK1APTl4MNK1pedkTWKGNl7CXyUYOI21N3NmhFSNxXiKsr8T1
	eQFm9MqbeHsnLk5zt1SmgiDI4ZoyXU8jMUF1Mt2gbIRUKe9rSz0i9QlFqayLQYINpAu5
	xAM6M3oAJ8A+xnXkSV1bVuy/pTnY9WoEFdh6ASwf81n3TLLYu+jV63cjhrZEXBTSlKJL
	smMuMn9M3j2CCml+7wT6UJqYp7l/A1DP9I5edAY++Du9rzo4J+W26l/yN4V1ozR5B0oN
	b7uQ==
X-Gm-Message-State: AA+aEWZ2A5FST2sdGFfc1CADQwdcz6Tyn5MhHJf2s+we1hR86R8xQ9Ps
	0YhoCaNIpiIXiBTRpptNIM+GcYw1Ck0sMnQbLpU=
X-Google-Smtp-Source: AFSGD/VoaEo2wfwl/xo2SUvui000O/ipPL31pasJAC+8Ry4LctdnWL1RkA7a6gGeNIKjxtcOPy/FtXZjTfmCHSspqBw=
X-Received: by 2002:a6b:38d7:: with SMTP id
	f206mr11536805ioa.265.1542988651404; 
	Fri, 23 Nov 2018 07:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20181003122005.26885-1-richard.leitner@skidata.com>
In-Reply-To: <20181003122005.26885-1-richard.leitner@skidata.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 23 Nov 2018 16:57:19 +0100
Message-ID: <CAB2nKc_Z-odztSNzmb+5H_-H+ifEWocBAXEN-teMa7WvBCek6Q@mail.gmail.com>
To: richard.leitner@skidata.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@gmail.com>
Subject: Re: [meta-java][PATCH] layer.conf: change LAYERSERIES_COMPAT to thud
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
X-List-Received-Date: Fri, 23 Nov 2018 15:57:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there,

Would it be possible to create thud branch for meta-java?

Best regards,
Vincent

Le mer. 3 oct. 2018 =C3=A0 14:19, Richard Leitner <richard.leitner@skidata.=
com>
a =C3=A9crit :

> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 8e8a300..b03a608 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "meta-java"
>  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java =3D "10"
> -LAYERSERIES_COMPAT_meta-java =3D "sumo"
> +LAYERSERIES_COMPAT_meta-java =3D "thud"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

