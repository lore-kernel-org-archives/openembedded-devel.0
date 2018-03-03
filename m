Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB697824D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 04:34:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y8so4588089pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 20:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qv9QD4WR/m2WQ4z3P8uxbcJ73z2lhShLp/6XrLLuNag=;
	b=WIC2atCWXYUV/eyyfuVLfVI18A+C0TNIr8801NYSFRJxu/ZpQp5odS2567aEz+asuy
	gR+yKx3J3uSQpAVlc2ndteJqt7bqHrzANSuFmPY/Jly+kvYH1hFEvgtodcf0SVp3Gm5q
	TePyHQnW4hwaAmWgW1LD+pSzoSn+mDapMgFTVT6VzUoI6xHDPIVbmlDYC1ZPwIZS9dAc
	bFZlVwiAMojLWZMqAJ7sZW88Ha8HcXJRznZAcTUBaBl+kVGVqAAi6QhEDjuQgAEWg3Hw
	u9nPzLsjpFivieyEAg3JCyrzEelJw1kVeg9hk9ROaDZX+ipbEXj0Alb+gxCq59uzazLG
	Uo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qv9QD4WR/m2WQ4z3P8uxbcJ73z2lhShLp/6XrLLuNag=;
	b=nK+IfQBCf7lT8bMJGs9lRaUO46/thP2BLDm6bnWMc3gEJg2XitIkR4srCAHLOk9WTD
	e3/C90QZ9Vq7JzKwOGCCVQEqikGvLbQkcMdpvbELEA2/CIPOMmV6foe3Rph47unXX1if
	IvMzeFwgE/d2qz00gdKzqhIs6PtgDqj4GGuqkRAHuv2OmD2Utl6yNEYK4ib5x18rDZgE
	ZNR/SH7ef86aHXFwgc4aRJj70RuBMvqDwed4aXXXH7Z4sMeq+m1A0XS5oUhJKluzlQYq
	lTMRt4nD9wTsulCQqn08u3J4tIVWY00XQEcoGqvM+nlRiI669/48zOpYK5Hsf8S1lIhj
	8cFA==
X-Gm-Message-State: APf1xPAHRAqCW5IXXL7oz5UT/B1eZMMfVKld+zLcTACfWcHXxIi5mscL
	volJBGfdcCk0rHcBYULGhpxfu3FxPJ2IK6C+mNs=
X-Google-Smtp-Source: AG47ELuIU667vAds443s+yKbhaGDTMI65MmtxwkVZ3gv0y2DeP/Dp3w6RSIHjX5VnaCrp0285FS3/QRvaBoFYpKyi08=
X-Received: by 10.101.99.66 with SMTP id p2mr4321901pgv.384.1520051671658;
	Fri, 02 Mar 2018 20:34:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Fri, 2 Mar 2018 20:34:01 -0800 (PST)
In-Reply-To: <CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
	<CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Mar 2018 20:34:01 -0800
Message-ID: <CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 04:34:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 2, 2018 at 8:15 PM, Derek Straka <derek@asterius.io> wrote:
> What more would you like in the commit message?  The license terms are the
> same; the copyright moved to 2018.  Do we really need to put the results of
> the diff in the commit message?
>

Not strictly, but you can. In general a line or two about the reason
is always a good thing.
The commit message wasn't clear about it.
This is essentially to let users as well as reviewers know that license changes
were reviewed and a line in commit message is there for later to go back
and see what changed


>
> On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> On 3/2/18 6:06 AM, Derek Straka wrote:
>> Update the license checksum and verify the terms remain the same
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6
>> +++---
>>  .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
>>  .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>  rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb
>> => python-sqlalchemy_1.1.17.bb} (100%)
>>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb
>> => python3-sqlalchemy_1.1.17.bb} (100%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> index 2683a6a..0c191ae 100644
>> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational
>> Mapper that gives \
>>  application developers the full power and flexibility of SQL"
>>  HOMEPAGE = "http://www.sqlalchemy.org/"
>>  LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>>
>
> what changed here ?
>
>

