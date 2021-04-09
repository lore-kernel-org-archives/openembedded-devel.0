Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.11866.1617984949735874735
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 09:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IENuuBnG;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id w3so9549916ejc.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Apr 2021 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d1k9LL3Bv5bI0+n8+8UfrPgC8PgrWkjsb7pezGu/6vg=;
        b=IENuuBnGxRkI0RmDHoSGEQzZe9YstxgDblU4pOSod23ro8xMiblmNSowCDDDpBP0Zn
         BefhTs8pVUnMiBQ0jgwBq/ZNqc2Cdmd1PfLyEfFRowFqZtq4Ub/eXwKSZj+HfDFE69Em
         Ou5vb5W4cQwUWtpZMPbb0UZGKS1SfFpKOzSYMrnk+2ut8123Z1A4FVqjy+sHIY3t15q5
         CcmkQv8oGEVHqORqtPXM3y6jf7cft6wmXYqoi2EmjtOvNdMgk1m+A1l9LZKazCtYrw5q
         WPNMljwcFXApaqITZHPquo4nXiZ95H833xNLQ0XHEPMZFNlhx36/7NkKPfHuF2vlcnth
         WBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d1k9LL3Bv5bI0+n8+8UfrPgC8PgrWkjsb7pezGu/6vg=;
        b=LoB9DIoqYJfAdvm3VDzgQzDrj2E8A0JnWApI5kmhdMoxU0cw+ZAfBOGhQBC9C5bIZv
         VSkWODM9I9A0ckVmULQpBgwUnjE7jW0anshKmK2haJzPRsK0EK3kKmHMwAwzN0HsuczR
         8rmwwHbe7V/83z7LZOYCi9X8U+wMo5AAD/17BdWEbjoa1Sg4pyQMf9F8LQX9FtH3Y8KX
         q0HayfxTVOleiBeg6k8Wv1/Uc5y1Pvi8O1qdT0/lgTtRDj4u0pmLOcFQS4GDNDoEMR2a
         hiPg6rFYGVmeBdLB1228DGAI53Kc3xFKkj+NPPWu2d7ZgMPDIBgnnUMalO62NBm7yhBq
         SFBQ==
X-Gm-Message-State: AOAM532PUyR7UGXfIudo9Rww774HQnTqEnwjd4CnK/OQhgvP3Wk5dBj6
	JQPJ/nDFxxen/GQV/z29sk8=
X-Google-Smtp-Source: ABdhPJwLYUOPh9SBlOgjEZKZzkpd83JmQwQSvJ2Gx7cux7penxv4oFm73CjmRlAz20KS251lL99kiA==
X-Received: by 2002:a17:906:8496:: with SMTP id m22mr16596536ejx.313.1617984948064;
        Fri, 09 Apr 2021 09:15:48 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g25sm1647824edp.95.2021.04.09.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:15:47 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Apr 2021 18:15:46 +0200
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [hardknott 00/64] Patch review
Message-ID: <20210409161546.x74wavina43w2dko@jama>
References: <cover.1617899100.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
X-Groupsio-MsgNum: 90767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sciyi535sd7mwkpu"
Content-Disposition: inline

--sciyi535sd7mwkpu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 09:35:07AM -0700, akuster wrote:
> Sync with master. Dropped iwd update  as it needs ell 0.39 which is not i=
n master
>=20
> Please have comments back by Saturday.

Acked-by: Martin Jansa <martin.jansa@gmail.com>

--sciyi535sd7mwkpu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYHB9sQAKCRA3VSO3ZXaA
HNCBAJ46B1lVR5jc2f/hePHWWOcKKD5uHQCgiseHGVcHjLz5vqRy+vFTOLXTkZw=
=6c1a
-----END PGP SIGNATURE-----

--sciyi535sd7mwkpu--
