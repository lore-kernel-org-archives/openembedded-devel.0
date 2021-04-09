Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.11843.1617984967184436984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 09:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jONXmp0E;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id u21so9504208ejo.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Apr 2021 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5h1Ec7K6rPf7rJQ8qp8b4tCR1DvJ4/p9/1ldZjDwrN0=;
        b=jONXmp0E3agQkfY8/8WVVoYhHRCITTJBpuUMXLYp2VuEgkueyuFGuKycL8ylPfGsLb
         qdRuswRoSAQOYhhYe0nbg3Q1TF0mFwO6k2mGO/X607gTqryfLvRspP9b607UOyzRRszb
         KPfaAJ+7P7Tt+pzsxC28bExyScQKeVhcwNVnug+WsahAIuV2wBrOBZBh9EG/QwCb65OE
         5kGh2VnGhuX7juIcmpC2IqkUc4jnFjV9tJ93MSAulINobTZpO9JyChtRmhgrbR4QYvOH
         TOMbFqHthR17i+1z5AqknQzvy7aLQGNkS308Bjs1Cze4XHgAX9AikN9D4Ts0rwQ1fVd/
         w+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5h1Ec7K6rPf7rJQ8qp8b4tCR1DvJ4/p9/1ldZjDwrN0=;
        b=CIqiO9ucd/ND2G/4t9a08OrqIGTL87QuMhDoBoJAzZliQZGtijEltno3LPBeFDLi20
         tQeHpkDev9SR7bng4WyzmlLIZJFBGrDeBf8B927syh/vWTq/P0a398+PHIZ+eAgzjonM
         IxMcJ225AZApS0l3zD/wnPWZmZXjhqeE6F+bQ/CnsgkKP6rrsjk0w52ytbDbQJX2TyrJ
         RKK0KONqIETufB50D+iPdsULXRbVj9VLjLh01aiQ9jAE7Fl4smd5G5mCax++L4D1u6vo
         UO8IrGzlQpgusYMEdWK2EMGaoyj9vn5H0KEr4sFpAXe3eHNRYyWVS+7vJHS6P+AVOlXY
         EAtA==
X-Gm-Message-State: AOAM530MR6Vtkx/Lp+zyNphigLExSuFi0uWRz5mB/+jp2wvUBOm9kcyF
	B3Qlht+H2n/LfyaF4YO4CPY=
X-Google-Smtp-Source: ABdhPJxMCCJ/txtTF1ZP7+mDWJfCkadRumZZlnxUUvnZqEboBeZubxlrK7g8bQAMWX+8LmWW6OvK0Q==
X-Received: by 2002:a17:906:bd2:: with SMTP id y18mr16920789ejg.482.1617984965864;
        Fri, 09 Apr 2021 09:16:05 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hd8sm1434725ejc.92.2021.04.09.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:16:05 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Apr 2021 18:16:05 +0200
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [hardknott 00/36] Patch review part 2
Message-ID: <20210409161605.x4h5oi6ijh764ssd@jama>
References: <cover.1617934043.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
X-Groupsio-MsgNum: 90768
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="55rldu2gi5e6ntkq"
Content-Disposition: inline

--55rldu2gi5e6ntkq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 07:20:13PM -0700, akuster wrote:
> Additional sync with master.=20
>=20
> Excludes: Revert "iwd: Upgade to 1.13"
>=20
> Please have feedback by Saturday.

Acked-by: Martin Jansa <martin.jansa@gmail.com>

--55rldu2gi5e6ntkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYHB9xAAKCRA3VSO3ZXaA
HDVmAKCgDxYaVid4cx0Cr0EqI6g6pbceKACggZxt2x/u/INyK3f6STjd0aWmZ/A=
=CvXM
-----END PGP SIGNATURE-----

--55rldu2gi5e6ntkq--
