Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E6EAF73195
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 13:00:00 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so27637384wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yCkuKeC11Q4LiKvohcLD1yXrPgowYx+AfPVUVL1rJtk=;
	b=RpgcZKx/956kh4wOFxBxvGl933SKy6fpS4/hyCE9kB7bRVc8BBBBLieJ01dpU2Ooiy
	TGvJbArGLT2TN/IQCYPipkrqzV8vOBLsdbxmBUcvzJOC19JtSxCLGsz/sYg288yp12bE
	og5KsEOpSVv5uG1Zey7wtyrPXtAynaeT9fOTyUQljMB+9TTNauhf8O+w5stxFJyHiGyD
	JoG1KLLwOeQDaWN1SWaLdNt/wX9N8dFX5uvbL/+jM11I3TI053E5o16jMgRM7jR5lc7X
	NmTvX6x387GcG+P6INrvzhl7orRl1SOESi+vATq4mBia2Ze768QVL0ZYMhT4WgCw2U4y
	kfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yCkuKeC11Q4LiKvohcLD1yXrPgowYx+AfPVUVL1rJtk=;
	b=aMeVXHXuuYybtW/BXPJoT6IvL/Byor/uOch/gdQ2FvSSzXsm2Xi/3OJvTuzPUU09Su
	7BCQFss53nmDlODS1USafVXUY/RqvgNeQCO2KjO1jL9eE5KssHwgJII/QfjG+9mpWGlC
	OChzzYCLBlaBWv/YQYlwIFvU6ALV1Qo1NyNVY3hf2F7oJaQXTEdvoCiEGlGWZgd42TY2
	ufjzK6MedoAtKVvunMEXGONpn8KFBn/xX2a7vaJlzjXI8MOzv3CC2DE9PDJRzBUYWv9C
	gdN1lDaTRPPvHABvWSRvVsWR4x74jok5IEpfUyfY1Dka9q5qjTTjJqwZ+Ul2Vgfe4SHL
	/yHA==
X-Gm-Message-State: AD7BkJIInfbxucIw8rjT9bo5hQI+n8HxZLdWVITJLNIjn0crJrRTElvdbI9wIpmo0G83zg==
X-Received: by 10.28.4.75 with SMTP id 72mr3809702wme.78.1457614800655;
	Thu, 10 Mar 2016 05:00:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ka7sm3483050wjb.8.2016.03.10.04.59.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 04:59:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 14:02:57 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160310130257.GE2573@jama>
References: <56E14145.4040706@mlbassoc.com> <20160310105506.GB2573@jama>
	<56E16633.4010800@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <56E16633.4010800@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-webserver] modphp
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
X-List-Received-Date: Thu, 10 Mar 2016 13:00:01 -0000
X-Groupsio-MsgNum: 60461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline

--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 01:18:59PM +0100, Gary Thomas wrote:
> On 2016-03-10 11:55, Martin Jansa wrote:
> > On Thu, Mar 10, 2016 at 10:41:25AM +0100, Gary Thomas wrote:
> >> Anyone know what happened to the recipe for modphp which was
> >> in meta-oe (maybe before meta-webserver) circa 2013?  I can't
> >> find a recipe for this anywhere.
> >
> > Why not try git log?
>=20
> Of course!  I don't often search logs for things I don't know where
> to find though.
>=20
> An aside - doesn't this change make meta-oe depend on meta-webserver
> (which doesn't seem like a positive relationship)?

What in meta-oe depends on meta-webserver? I don't see anything.

> > commit f81961ff20d669e0f472f45b9922d6f62ee0d330
> > Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Date:   Mon Jan 5 10:24:53 2015 +0000
> >
> >      README: update for modphp merging into php
> >
> >      Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >
> > commit 06af52095b5be1cb21a7dc9a6a6e05d01f6e7a00
> > Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Date:   Thu Jan 1 23:34:29 2015 +0000
> >
> >      modphp: remove
> >
> >      This is now built out of the standard php recipe.
> >
> >      Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhcIEACgkQN1Ujt2V2gBz7hwCgsuuYw6KQD0f0JokmQ1cP7QHT
KwcAnjIcATyqt20gZXKgkGwn/MJm40H7
=UIiD
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--
