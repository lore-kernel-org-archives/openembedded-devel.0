Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 58B8A731F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 18:23:48 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id a17so41459034wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5YKplB7vjbqXnAvEnO63GnPJxKfF3pXorHHSDgwRTxg=;
	b=CRbvo1thxlf2IKehTzsXw3GHoob2m1BNPHuOjTX7IGAAo0zdUxWqz9tjj14agTZTpm
	PDhtPzaSSFr4ovSjVQGROnyJnWEuB/0H6z32TQTMLc/f9NZzhv1IkXsIAtl7xUM2UGto
	DImCtGN1NF/TVHzqLMM0YhntGyKKXINfXG0CHs9sIkCpTknpKh3SEGduDQKXKAYghHPW
	BUq+iRb6wJiSRhv5HDRzk+6Pfj8wcgAktEm9/ax1VTP64vfLI8sIhdQTlsZ9TbfPtIC9
	BJ6pMj2e4HDEHBMWSw3ojtEU9mdP3nHfpbgWiauV+H0d1Kl2lEo3yqoyiciyUSZ9I2BG
	V+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5YKplB7vjbqXnAvEnO63GnPJxKfF3pXorHHSDgwRTxg=;
	b=AFwL2xvG5S0pVcuu8uO4dhR4E9Zza/+RzXTB2oHok2gsX+bIdDD7xkbqI+g7mGsT2T
	nuwl2SkeOqtl/kgMPzuel9rruqucGr+Elr3kf/ozrppU6yQXJ6/OV7R550DrUvD5hgeX
	FyDS7w6yOgqeK0pAYjkYETduxRyIqmnl5P65PAhuXxkRd6nD9k8j58U4lAVMXnXs1huZ
	TCgkis/AwjoCMIY4K8ODHotpz/sVzpAWSAQQCrPmjdSoicTYDz/CYM/Bcn550L9Kn9UH
	gUPpZwHJkQpnXFu3qxcY+ib43aSigA0tORZQI6B89v/54Ln4WJ0uNMRjMNW1JZkaosHV
	PC2A==
X-Gm-Message-State: AOPr4FVe22lmKJmcRkh3kjiMXC3dMOArE2CHN5uOTOPOpyHyQ4t1JfieJf6qp6I03DMOzg==
X-Received: by 10.28.14.73 with SMTP id 70mr4786890wmo.15.1462472629295;
	Thu, 05 May 2016 11:23:49 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 63sm4410460wmz.5.2016.05.05.11.23.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 11:23:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 May 2016 20:25:12 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160505182512.GC23370@jama>
References: <20160505171932.GG27602@denix.org>
	<20160505172844.GH27602@denix.org>
MIME-Version: 1.0
In-Reply-To: <20160505172844.GH27602@denix.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: meta-oe krogoth release
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
X-List-Received-Date: Thu, 05 May 2016 18:23:50 -0000
X-Groupsio-MsgNum: 61344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline

--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2016 at 01:28:44PM -0400, Denys Dmytriyenko wrote:
> On Thu, May 05, 2016 at 01:19:32PM -0400, Denys Dmytriyenko wrote:
> > Armin, et al,
> >=20
> > What's the deal with meta-oe branching into krogoth way too early (Apri=
l 12th=20
> > pretty much) and missing on many updates and fixes that went in to mast=
er last=20
> > couple of weeks (delayed due to Martin's well deserved absence at the t=
ime)=20
> > before the actual release of OE-Core last Thursday? I was hoping there =
would=20
> > be a global merge/rebase from master to krogoth at the time of release,=
 but it=20
> > doesn't seem to be the case. It would be a shame if those were missed f=
rom=20
> > krogoth... Are there any plans to pick them up?
>=20
> BTW, I do see your past pull request "attempts" (May 2, April 28) on the =
list,=20
> but they don't seem to be pushed. I guess I should re-phrase my question =
- do=20
> you plan to push the latest pull request and what is the ETA? Thanks!

They were already pushed to krogoth-next and will be merged to krogoth
soon. Please test it and send ACKs.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcrkAYACgkQN1Ujt2V2gBx2nQCcDtYR/tUBKByiiQcQ8Xtxu4GD
m9sAnRV3b+ih7bK5z2HyQQteBum674UD
=+2vE
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
