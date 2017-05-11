Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C67371D7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 12:44:39 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id s62so3471854pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jn3EH7BJNndVSpFcsE4Zc1VWFKIn1tsaFtKWCWmDDBw=;
	b=Z0YYPJGhhKxNejVfmZa+owzfXhrT5bkyTNB6vXqIgFcnGn12h0UsXaDKsYeJQbvfuu
	rVFnO2ijRznjdYRKM1xTbQlIrk3T4tvCUYzD7YPtjJkKkLxC8HxNbnrN4uW/mZRnvA1t
	saJpcXafSXPYPt4OpR4DORw2Ku0b98V3p0fqSvN7ZjMD46Pi+ZP0FlHPq1VVOkxxlaPG
	a1yLG6CH7RtJkNX2+sU+ruB5yLEvEqcF5+ntHeR/hdVjYYWa2hD9223erG7cECVX3u83
	j4sH4h0KqPaoq2jOCnmmimBJ4RkxRbW/7RlRUUWOhyxmV6fKDmddgeXW7apJsG4iBJYM
	ltKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jn3EH7BJNndVSpFcsE4Zc1VWFKIn1tsaFtKWCWmDDBw=;
	b=Hwqm2BoTOCgZEIqL3FNXxWU73tPYMMpKiq/dRk4RAvJayn7oAvzVJHX8KmfIkdYkFB
	9Nk6wvuaCoHodMwM2mWV8+E7wM3FdHv8UFHQ7222RKv0p31zWZHFFU8g7J6332Cw8vze
	rL+ij2wjQzijvBP546MCDmohocLVj1GQfDKEXTSiGBLWdJyDol71Aj4TexNr06ocOPbb
	4nvx/O8GgOv5CGukCMaSYru/jSMQkNm0N/JapDTl8z3izcje5Vu6VvLNQUnMqPm1jzJT
	ASJfnU+bYPsIzG/RHyZbRp+7lErdhtFDcYOjWnXjFs3gxiPDA2c0kUAn2FiHnp1REj8N
	nHYA==
X-Gm-Message-State: AODbwcBmDyHAfY9uiP3DY6sNO9e7Ia7ABC5zVUoV5qmZxgF7Dtwgzu+H
	eVVSodzX/4RSrnIKrZWJenZdcpjyYQ==
X-Received: by 10.98.200.142 with SMTP id i14mr158697pfk.154.1494506681405;
	Thu, 11 May 2017 05:44:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.178.237 with HTTP; Thu, 11 May 2017 05:44:20 -0700 (PDT)
In-Reply-To: <CA+chaQfVoCzjRKh4whBtTsyqtiDm7oKxFToTox5R-48qGYXm2Q@mail.gmail.com>
References: <1494505721-28247-1-git-send-email-costamagnagianfranco@yahoo.it>
	<CA+chaQfVoCzjRKh4whBtTsyqtiDm7oKxFToTox5R-48qGYXm2Q@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Thu, 11 May 2017 14:44:20 +0200
Message-ID: <CAATN8PW8fhbOenTS3zwP+PfCy-nRsnu1yEih+5DUNVP1uMSt3g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Thu, 11 May 2017 12:44:40 -0000
Content-Type: text/plain; charset="UTF-8"

Hello, actually this seems to be already covered by
http://lists.openembedded.org/pipermail/openembedded-devel/2017-May/112706.html

I'll send an updated version in a few minutes

thanks
G.

2017-05-11 14:30 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> Github archives are regenerated from time to time with different checksums.
>
> If you need to switch to github, then fetch it with git with SRCREV
> matching to the tag.
>
> On Thu, May 11, 2017 at 2:28 PM, Gianfranco Costamagna <
> costamagna.gianfranco@gmail.com> wrote:
>
>> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>>
>> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>> ---
>>  meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
>> b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
>> index a35dff8..7d53dc6 100644
>> --- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
>> +++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
>> @@ -3,8 +3,8 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
>>  LICENSE = "LGPLv2.1"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>>
>> -SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
>> -SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
>> -SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6
>> f72cfaf14f4ff77a77425e52edc33ffac0e"
>> +SRC_URI = "https://github.com/jpirko/libndp/archive/v${PV}.tar.gz"
>> +SRC_URI[md5sum] = "de58352aaee0e8edb744f1aef852cdce"
>> +SRC_URI[sha256sum] = "565d6c4167f83ec697c762ea002f2
>> 3e8f0b00828d0749b1ce928f068543e5aad"
>>
>>  inherit autotools
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

