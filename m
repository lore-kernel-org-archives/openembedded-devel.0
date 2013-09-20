Return-Path: <jc@vtkloud.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2732C6028B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 11:58:33 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so386156wes.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 04:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to;
	bh=kg49p9t/rxhs49Dx0Fkr5ZCwrBZ5+4/HiKKScczOR1Q=;
	b=AEnuexjoUELiAdg84Wu+0hF5hf3Jsl/ctkEZrPdCVrDMVZqOPsg1DfB7VG4HOk/uZ9
	9sWOgARYznDctrVlXC+cwZOgrp+9v0NcFFsB5rUsPUYtmFYMWHfj2UZBatSrdZkoIRlL
	6SHbmvFyZJ88ZBsgNQfdfnrv4tB0ccIO3+rfAI2og1FhnLYiM2zzJ66eOssz3UGgMFqw
	SIkXPxW8EnuvorJLPeJuudfpIMKoEG2WTTHrBSa/SxLAL0Rx31NybhFbzjkDSIlk06TR
	nPPQdxwSXScSh/i94/xUPmK9yVdMS2GYgeidHeV/ldNvURZXUqTPlaOYUiYp5M6RNxt4
	e64w==
X-Gm-Message-State: ALoCoQlpPwV5KFcQ797cBhjMkClklOcXVlggRjcVsBfHTTmUM+m0v1L44VgipY9hGYqTv6nWwHg/
X-Received: by 10.194.5.35 with SMTP id p3mr1213425wjp.47.1379678314079;
	Fri, 20 Sep 2013 04:58:34 -0700 (PDT)
Received: from [172.24.63.121] ([94.103.137.126])
	by mx.google.com with ESMTPSA id e1sm3935720wij.6.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Sep 2013 04:58:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: =?iso-8859-1?Q?Jean-Charles_JC_Verdi=E9?= <jc@vtkloud.com>
In-Reply-To: <20130919125451.GG18414@jama>
Date: Fri, 20 Sep 2013 13:58:32 +0200
Message-Id: <94A739DE-DF19-4615-9C74-3045D098F5F2@vtkloud.com>
References: <20130919120514.GL7313@jama> <1379594661647.2d381edb@Nodemailer>
	<20130919125451.GG18414@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1510)
Subject: Re: [meta-multimedia][PATCH] libao: add version 1.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Sep 2013 11:58:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On 19Sep 2013, at 2:54 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Sep 19, 2013 at 05:44:22AM -0700, JC wrote:
>> Hi Martin
>>=20
>> There's a genuine email address isn't it enough :)? It's harder than =
Facebook here ;)
>>=20
>> Anyway, I'll update it but I'd like to see more reviews before to =
avoid doing a new patch just for that
>=20
> True, we cannot find you on facebook and linkedin without your full =
name
> :).
>=20
> Unfortunately I've noticed it only after pushing it to master, so you
> don't need to resend, unless we agree to revert and reapply with full
> name.

AFAIC I don't really care, so if that's not a problem for you, let's =
keep it this way :)

Regards,
Jay


