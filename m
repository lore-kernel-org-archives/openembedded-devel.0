Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5278273F4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 10:37:15 +0000 (UTC)
Received: by wgin8 with SMTP id n8so4217972wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 03:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=49gMkcjY/FJe0Tw62DN9150+BQs3nJmf/AC1aoUV2J8=;
	b=xqFTld45tUZ2dN2rbFVJCheWKeY+n44gX28TXGMsKNtR/heinuKg5o5nTSrSgGwGnp
	sjxNM4oZHrV5mz5mLPS5h26T2UtPmNOt2UdLCDmup/D7xw3ml/O2+1mm1r0HLK/0pgtK
	Lj7c//8rE+ejLZjhQdraApVeuNw5od2HB+jMf1nRUGujZmLQA1odgg07DmuUSHXfkhH8
	FKb2Or0vQJNVYFCMiCro1DMVN+SENr+/U//hGEh3RUMdd2/ia1bzTvCd8UljCUpdowTG
	xUrafq7vHzouPrC1Yeimmku7yOfvtV0S/5KqE9cI1mDa1e+ID6+LOvsndhHY0Jax7rzM
	7B9w==
X-Received: by 10.181.13.44 with SMTP id ev12mr3926101wid.17.1431427036644;
	Tue, 12 May 2015 03:37:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	be6sm27074435wjb.14.2015.05.12.03.37.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 03:37:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 May 2015 12:37:19 +0200
To: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <20150512103719.GA2714@jama>
References: <1431414672-1832-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1431414672-1832-1-git-send-email-yi.zhao@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] Resend 3 patches for multilib
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
X-List-Received-Date: Tue, 12 May 2015 10:37:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 03:11:09PM +0800, Yi Zhao wrote:
>    Resend these 3 patches which marked as spam in previous email.

It still didn't make it to patchwork :/

>=20
> Yi Zhao (3):
>   p7zip: fix PN -> BPN for multilib
>   mpich: fix ${PN}-${PV} -> ${BP} for multilib
>   sylpheed: remove do_install_append
>=20
>  meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb     |    2 +-
>  meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb    |    2 +-
>  meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb |   10 +---------
>  3 files changed, 3 insertions(+), 11 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

