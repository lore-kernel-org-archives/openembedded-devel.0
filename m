Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9DC7568C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 10:56:34 +0000 (UTC)
Received: by wizk4 with SMTP id k4so107046265wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=gf8x6XK9/eT4jJ4fCvXZo4qc65gij5LYS3ETmLdzCzg=;
	b=jkObbkJgSl3rpKe2+KMWxoYWqXblq34wWMAUtvNXBw+DmV4IaGnRIzuTQ+a66rFj3l
	AQfWwZfYO3fdHO4QDdR+XwOUIdLPS0BlaCLySD1u4Hl93Vl1ewHBdTBih/11nrBdsFTD
	iZ0+ucUpHP2Af430DQDUS29PHgOqee39vzXTBMgaZEf0K5cps1lgn/NGrQYEY7dBFcD1
	VIw2xHQbtN6NNLk0ncQGZIjvzj4nxo4J5zl9aQmr/vdDoc9vfjf2ILIqrYATYxw+NKdZ
	FQ0vYwi1HpgQG8VpaXXyfeR1kNG3dUY78sYq8DkBlESEp6MNLfBu3xgV3LnXj6ZpITEx
	d+8Q==
X-Received: by 10.181.11.193 with SMTP id ek1mr4815849wid.15.1432724195954;
	Wed, 27 May 2015 03:56:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id di7sm3021149wib.23.2015.05.27.03.56.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 May 2015 03:56:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 May 2015 12:56:51 +0200
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20150527105651.GD3683@jama>
References: <1431771255-20841-1-git-send-email-max.oss.09@gmail.com>
	<1432661286.2291.4.camel@Saturn.local.all>
	<20150527103349.GA3683@jama>
	<CAEHkU3X1_D3USa=sgxL9U7-BUpF1bggscsKp1-LmD4T_OHv=0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEHkU3X1_D3USa=sgxL9U7-BUpF1bggscsKp1-LmD4T_OHv=0w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] florence: use ${SOURCEFORGE_MIRROR} in SRC_URI
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
X-List-Received-Date: Wed, 27 May 2015 10:56:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2015 at 12:52:36PM +0200, Max Krummenacher wrote:
> Hi Martin
>=20
> > Sorry, wasn't noticed, because patchwork didn't pick it:
> > http://patchwork.openembedded.org/project/oe/list/?state=3D*&q=3Dfloren=
ce&archive=3Dboth
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7657
> >
>=20
> Thank you for picking it up.
> To you need me to do anything with the patch like resending or so?

No, just wait till it goes through jenkins build, I'll reply if it fails
or something, otherwise it will be merged EOW.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

