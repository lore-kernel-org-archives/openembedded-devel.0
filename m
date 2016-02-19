Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id A836A77042
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 04:58:26 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id ho8so44785778pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 20:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:mime-version:subject
	:message-id:date:references:in-reply-to:to;
	bh=1GYHHdQ4pClbF/at/lqQH1PVIfIj+MX/WzBdT1Csk0A=;
	b=MLYjMZ0U82uaGwjisy3FGU6juMIzOe7jhe00Ioq7nmjkMH/rnar16llZ3N3PasUK3T
	p/nSP7Qguraewn9v9QUDIBJ9sKWcIb5B49meCpt1pQqynrsZLnQx3VQi+DUaa9bMgd6d
	Mu07O8CrtRVLSnGOWqJzxm5lMPFvv/2GukQKFLZEdq0bhaHEivFW025UXeegqVOaZBN8
	D7z3b5RmtY4JAFlq/jn/NkuqSk30fR120uh6B//87J/lYGw0HvKKMTPXp+oUXXZAd27G
	1A2OLt2OXFXkCRoAMENvJ+jWWF7FX+1x9Hqd2Ydmn/gEE6JYwdgC1PJ3k5DsK23KulTg
	oqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:content-transfer-encoding
	:mime-version:subject:message-id:date:references:in-reply-to:to;
	bh=1GYHHdQ4pClbF/at/lqQH1PVIfIj+MX/WzBdT1Csk0A=;
	b=H22ktxfIrA+mqwe0nSv0jJPjTDjrrjnXzUbeWEp90l7O9n1+cq3FaqmTohJWK7gc2t
	ETScKohFpD3q9Uv3SHR89rykA7ol/3kbhB477A/BY0KBksdZ33+LBh+pOocTRTcoRPXg
	hfIPXWZw39GzN22k0fpMRuX1R63+S3JP/RBTcEebeTXFqgot9XF1qDphop/wgm6a6LUq
	KFrW8OLxJl5NNJmO+p1ez8tCYpeh/sj8Z2o4qd/uUzV49vBAgDZhWLLj6xM+17d/S+6w
	1j5ZnHjkRdWNlykMn9fAwIYaA6OqToBhJvmFxm1OhHxa/uHzq+uxomTfyq35JEoio2or
	HaZA==
X-Gm-Message-State: AG10YOTfC8H2eI0zU9Ygw9mb0BYl1SioDxyxOgNBPgTYMv7gV62cXQkydzchVnf7fIpofQ==
X-Received: by 10.66.139.166 with SMTP id qz6mr15365392pab.3.1455857907420;
	Thu, 18 Feb 2016 20:58:27 -0800 (PST)
Received: from [10.0.0.194] (c-76-115-105-5.hsd1.or.comcast.net.
	[76.115.105.5]) by smtp.gmail.com with ESMTPSA id
	l14sm14057310pfi.23.2016.02.18.20.58.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 20:58:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <EBC32EE9-0D29-4843-95AF-9F7C3F0D42B5@gmail.com>
Date: Thu, 18 Feb 2016 20:58:24 -0800
References: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
	<6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
In-Reply-To: <6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: iPhone Mail (13D15)
Subject: Re: [meta-python] Python Flask recipes
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
X-List-Received-Date: Fri, 19 Feb 2016 04:58:28 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I agree with Khem on all counts and would welcome the recipes to meta-python=
, if you so choose.

Regards,
Tim

> On Feb 18, 2016, at 7:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>> On Feb 18, 2016, at 10:33 AM, Fabio Berton <fabio.berton@ossystems.com.br=
> wrote:
>>=20
>> Hi all!
>>=20
>> I noticed that a few days ago were added some python-flask recipes.
>>=20
>> I've been maintaining a layer with python-flask recipes, hosted here
>> http://code.ossystems.com.br/gitweb?p=3Dmeta-python-flask.git;a=3Dsummary=

>>=20
>> There are recipes in meta-python-flask that were added to meta-python
>> and I want to simplify maintenance and avoid duplicate recipes.
>>=20
>> So, do I send recipes from meta-python-flask to meta-python or we move al=
l
>> python-flask recipes from meta-python to meta-python-flask, using a layer=

>> only for Flask web framework?
>=20
> Here is a hierarchy one can envision
>=20
> 1. Core python runtime support - Oe-core
> 2. python extended modules and infrastructure - meta-python
>=20
> now if you think this framework is quite commonly used and is kind of core=

> to python world, its fine to have it in meta-python, if you think its
> too specific then move the common packages to meta-python
> and maintain it as a separate layer
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

