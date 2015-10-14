Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB4873CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 09:18:24 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so121436433wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=rmYC0aRU6Zszvgt9fUcwjol7Ina3kgaQyph1lYoZQYo=;
	b=MBHca7eC+Yl60/J85BoDggvMBg83jeyKEdKNddvAACF1R0bFC+Gm2YWkNquzOGphsj
	yQhtU/qZ3cHeUlrOi0SveWOwS7uwcu8IewppsH34K3vvlWR7VtvMFo3HPLTM71+P/b2/
	xvBLQ9cUsy/jccveHjYHeR77OfTt1NAhpuPD+0nsLFFXCjlEI1Im1w/PhJKBQrqXpeId
	9MpoCEpVqhaszE8qpKSPW+czPDkKU1HhstGFc3qaGkfsXpxD3NxpewCMEAQ0ldSgCAlj
	MAFsSfm5EMIpCXnSEitOVUdstm19zuI8Oe8i/fdsmMJL/teeD17tOvbCPu6lER3LmCXr
	TDig==
X-Received: by 10.180.8.5 with SMTP id n5mr27596618wia.94.1444814302917;
	Wed, 14 Oct 2015 02:18:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id it4sm8774312wjb.0.2015.10.14.02.18.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 02:18:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 11:18:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151014091838.GA2386@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: jethro branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 14 Oct 2015 09:18:24 -0000
X-Groupsio-MsgNum: 57803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

as every 6 months I'm looking for some volunteer(s) to step-up and
maintain "jethro" release branch.

You can sign-up by replying to this thread and then one of you need to
send README update like this:
https://github.com/openembedded/meta-openembedded/commit/3082e30da58df0711182cf114c71a8c6a093aeae

More details in thread searching for daisy maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/095601.html
http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/095694.html
or dizzy maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098441.html
or fido maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-March/100901.html

Thanks,

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYeHe0ACgkQN1Ujt2V2gBxw+QCfYweDJ8MdEbUIKsYEFhhUEJlW
/68An2RqIA9pq/i2kn/DAe2Z/E2aAr2Y
=AVMS
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
