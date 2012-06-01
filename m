Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SaN71-0002rm-D3
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 10:21:35 +0200
Received: by dalh21 with SMTP id h21so2529739dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2012 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=47XkMg12AI5lKf2iEqRrhH4oymHdo0Xgik/XU5Rvs7M=;
	b=q8MEcu/4wWoRt0IcnRtCRSco7QVdDxEXTIKZOJij4U6nKapuD3ZAPqFU7GnIcazpYG
	cLofwFwvIWbbPdE2W6vO4Sfa+C5e7StzDvA+TU46QrVht4F6/ncIuoeWK0us6Ra6pPIb
	HsTrwLSR47fxlQ3bLupsEdbprK12Uvbf6weUYEzQIHjy0AJh43B2nWxEzaN6NI9od3t6
	35oMw/zokQDYU0BgLHro2Gj2jQ6y8SF3JjlTpWIVJqvS5QEId8DRKBhzrGEdGJ0WF5tk
	eFy97IYl92zi2WuopucjRSmrJjL0EWrCUagfGg7oHWBMWqveLe8Z0qjnOo5ngFql+XoD
	i+Mg==
MIME-Version: 1.0
Received: by 10.68.230.105 with SMTP id sx9mr2755000pbc.114.1338538273375;
	Fri, 01 Jun 2012 01:11:13 -0700 (PDT)
Received: by 10.143.63.11 with HTTP; Fri, 1 Jun 2012 01:11:13 -0700 (PDT)
In-Reply-To: <jq9qlk$qd8$1@dough.gmane.org>
References: <1338507062-24643-1-git-send-email-andrea.adami@gmail.com>
	<jq9qlk$qd8$1@dough.gmane.org>
Date: Fri, 1 Jun 2012 10:11:13 +0200
Message-ID: <CAAQYJAuo1WBzJUeVDuuG8Ju=f686E9yGQT_gcZTjSLjHiMUDUg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH] klibc: release klibc 2.0
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
X-List-Received-Date: Fri, 01 Jun 2012 08:21:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 1, 2012 at 9:23 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 01-06-12 01:31, Andrea Adami schreef:
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>
> error: patch failed: meta-initramfs/recipes-devtools/klibc/klibc.inc:10
> error: meta-initramfs/recipes-devtools/klibc/klibc.inc: patch does not apply
> Patch failed at 0001 klibc: release klibc 2.0
>

Hm.. something wrong... and I ever tried to rename properly with 'git -A'...
I'll fix that in a few hours.

Sorry for the noise

Andrea

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPyG3zAAoJEHZqAkdh1vT6rwQP/RQB+hmY/RANmjJtEeJoez/4
> 6c36JPjGhRfdXIdtTTBlq9dZPGgt7fmpKRPaAOWPjn9/6WWUMELaTflRq1JJS3O4
> h7itaJgPdDSw1ejOGujlECNFdFTrL3RU0xzDTTOkgMzDtTxXtOkEWzyQBY9yHSKF
> HKzc5KRLZUEQvoMyufFUtxsm9st+zdn92hv+KkJ6iXtJWGwvb8MmVOVIrFGA6YRq
> OCi2xOS89SDOHS1ktITvuCbx2z0ddiF0SdCa+UGFPO9zaVJUieYMsZwovWtVI7PY
> jAOh6UbTq/zXU7rZplB98neGyAhORYElTQ56irUFC9GCJWQtEIzfV0sTnXEj+pt/
> JQozPwP5no52Bs17rCL1Pdm8t5/CT5/bq3AfYGkZJTdJPbddfUBcodHgzTIwQJQm
> zXZrZLY83A6rUio00gyR+s9sbvsN28PRXIjiCSiBMO/O0H4Y8+Mf/8/3n1BdmyOf
> 7Aj2OIxNt6xO3aSFDO7fFKGot9gJyYZNZFlLZ6w4GTOf4ShjRANqVmYdZIZj2pJU
> oLzwzaVMvngiWkx/6K3pqya2byGH1zGMQ9oyYOO31YG7DZbvwpXshTKMtzQ5o5P9
> KRaV6Xf41JC9XmoTO8Tps+75FZFd4HgKnuC0XWO2yqzEPnAMSvpg/+aS5cmbGrxB
> aJKU9mVafr0oudrBB8qj
> =9IvJ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


