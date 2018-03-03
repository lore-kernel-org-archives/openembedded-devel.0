Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDD278964
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 19:58:48 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id q27so5189392pgn.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 11:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OZnjKhCeZL9UamGyj6wijFwF1XnSoOQlaUSCnydjClE=;
	b=tiQl0dgYW6zn7GlFn89lh4Ow+MVzga3GNloQ67TjT13pRmbvk5D150/xhCvaQcQbJ+
	QxQR8ISdSQ6lb2pwcOE8498MtXi7vrW01U+U+h48X2XP5Ec/58xk7Popuqz/lQIY7w3/
	/2YQZWjfb/MwO3Qp4qkCD9/5NE7MPWzNyf/DYLgA8lLktYGrJ9TbNFF1StoV7R/+8Uok
	upiUb6+kvPaQIUWiGjbqQuwsO2KE+CG5NMJei9zhGrtGfVq3c5FbP5zo1R2TnTlY3rI2
	qhJQ4KblrQYG2qNdoXVSs9ZrDo71oPoaeMdxGOvv3lS0ILbxGuASnMEnoXGSjeEBqDp5
	rK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OZnjKhCeZL9UamGyj6wijFwF1XnSoOQlaUSCnydjClE=;
	b=F3KGZwU5LWa1QLGnv+Xnz18hkQirqwic5Uav94Y53Wh9T4TFxYFGPSV81leQy8WeGj
	x/Vfy09czkaPBXfrrzJCzC3t2S91/Ryy5JDJB+H9iprhI45TkRezD8WTaS6RhE2MW8YT
	EZ7bca37YAgU+4/k5d4L+bZYAVHh6WNnsNErdA7RNfV8KY/+WHjRNYBLR54GXioprP0G
	9tVWsRtUk1jSkKkgyJOg+Vuot+KhxG0yjCR5OKJfaVmyuk9ADS5UK7tMDdu4H0WMqnsC
	6EnrbZID6zIQl7vkubIOMI6TOy41ICueuILEyf0VU9YegvGoHgySFfqhauWMTCcN2KWM
	yl1A==
X-Gm-Message-State: APf1xPAMmz+jK1UBrvPqhGR073W+QNi5WmvJ/PZvpmr/IVZ6OicyKfDR
	IcBHK/7arXX9SccIgvbMvlgiveK7t3iJlHuQj/s=
X-Google-Smtp-Source: AG47ELtt5j2FXeHOqFKlgcSpjNJ/I/wEV8p0CF4bucJ1VpsklpgRbrbt36CeIPWwiu1vQqKr4XAOXijDfuUFCpbjqQ4=
X-Received: by 10.99.64.66 with SMTP id n63mr8171957pga.204.1520107129657;
	Sat, 03 Mar 2018 11:58:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Sat, 3 Mar 2018 11:58:19 -0800 (PST)
In-Reply-To: <CADNbA1pnZFQqyNpxqiGtW8m4YGONHB1kcCZxmeCLr=LkBkg=gA@mail.gmail.com>
References: <1520089170-25302-1-git-send-email-derek@asterius.io>
	<4ef80f7b-18fa-2615-3b08-bfe25ad169da@gmail.com>
	<CADNbA1pnZFQqyNpxqiGtW8m4YGONHB1kcCZxmeCLr=LkBkg=gA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Mar 2018 11:58:19 -0800
Message-ID: <CAMKF1srdL6JxV-ve1qA3OeGFV-yzagzkqxhU4OUrXbAmvvCUQg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv2] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 19:58:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 3, 2018 at 11:24 AM, Derek Straka <derek@asterius.io> wrote:
> Is there a reason the patchtest scripts are not run on the openembedded
> layers?  Is it just a matter of doing the work?
>

I believe so.

> On Sat, Mar 3, 2018 at 11:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 3/3/18 6:59 AM, Derek Straka wrote:
>>>
>>> Update the license checksum for copyright year and verify the terms
>>> remain the same
>>>
>>> diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
>>> --- SQLAlchemy-1.1.15/LICENSE   2017-11-03 16:47:01.000000000 -0400
>>> +++ SQLAlchemy-1.1.17/LICENSE   2018-02-22 16:08:41.000000000 -0500
>>> @@ -1,6 +1,6 @@
>>>   This is the MIT license:
>>> http://www.opensource.org/licenses/mit-license.php
>>>
>>> -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see
>>> AUTHORS file>.
>>> +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see
>>> AUTHORS file>.
>>
>>
>> Thanks for follow up. This looks good.
>>
>>
>>>   SQLAlchemy is a trademark of Michael Bayer.
>>>
>>>   Permission is hereby granted, free of charge, to any person obtaining a
>>> copy of this
>>>
>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>> ---
>>>   meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6
>>> +++---
>>>   .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
>>>   .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
>>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>>   rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
>>> => python-sqlalchemy_1.1.17.bb} (100%)
>>>   rename
>>> meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb =>
>>> python3-sqlalchemy_1.1.17.bb} (100%)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>> index 2683a6a..0c191ae 100644
>>> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational
>>> Mapper that gives \
>>>   application developers the full power and flexibility of SQL"
>>>   HOMEPAGE = "http://www.sqlalchemy.org/"
>>>   LICENSE = "MIT"
>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>>>     PYPI_PACKAGE = "SQLAlchemy"
>>>   inherit pypi
>>>   -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
>>> -SRC_URI[sha256sum] =
>>> "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
>>> +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
>>> +SRC_URI[sha256sum] =
>>> "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
>>>     RDEPENDS_${PN} += " \
>>>       ${PYTHON_PN}-json \
>>> diff --git
>>> a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
>>> b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
>>> similarity index 100%
>>> rename from
>>> meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
>>> rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
>>> diff --git
>>> a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
>>> b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
>>> similarity index 100%
>>> rename from
>>> meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
>>> rename to
>>> meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
>>>
>

