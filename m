Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id ABDD360616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 18:03:57 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id t5-v6so849618ybg.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=owGGES5ThaHDN2AljIDY4h+nSv/bupfVI//qHMxwKqo=;
	b=gbmiPuzg9aGKWoeZb48spjCZGreJYRkoeZQL2RQbK5Wip43aVwV8YRSdad7PpeGaYt
	tx+GyHGf+X8efut5ZojzpTkOrcfSsXW6Z9SRC/AGWQmTaYQlggB2aY2D/gfFu//rncij
	Jdn461nM7kqzy9G1rGCWrkHU6u5wVS9RmeWwv0J/eBfHAm7dFDIljvaMzREmsMQEy3KZ
	K2xhCM5/wHk6fLa5Km6D96UJBu+yrETDLe/Rq7EOxGFqjlEbpG45DLc3qIRwGdgMQZfZ
	7+dSRVeevzA72vn+wdtaWWoluNj3zt61kdQjyiHTzu50HEI/X2l/VER8pWxNlo52eWix
	HoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=owGGES5ThaHDN2AljIDY4h+nSv/bupfVI//qHMxwKqo=;
	b=OaKbTTW5B/LXm/53oWulTmHVOUjK+1BKwh5SwAvSMW+S0UWQxg24pi1g39Imrzkbgs
	t0q+sg8sL1uxv+qBZTQ0zZcB5xtMfMlRJw2GbW6fZjVdrPyOrU/3zyHBrxhGTRJmcCh2
	oNk6WH1bJJnbsH2iBXtLKQ8orQZXKay8rdguHeb1P0Whf5jduJsY6fctRgyqj0Swmwlx
	raCaptU8QAC0W+KCkwOu0FZLflYYxzBAa9oUvCkWPqxW6SBtXVnnuuZ+Wk6+kEEtMwWz
	4wY1l1y7eu1Ol9jAGnhJEHNeMLQGImiSd915+jifIFroPMf9JasoQ3z6xgAbm0qbL0Gz
	SzDA==
X-Gm-Message-State: AElRT7GwI0eyP6EgrovAS2r2w+1nG/Vnig8tbf5AgECvCF5W89xWDSsr
	QFcETu4D89aXAbyiVZDoTXgS4bkgZGQIVNKPOVH03g==
X-Google-Smtp-Source: AG47ELv1OwqQ0wKnp9uFm7W9puKQ/h6wuo8sQOtgsCD1zGRPxLg5cmqqAKmfpFmkKtAcyjYkHHtNmgf+cAmBpNlL0H4=
X-Received: by 2002:a25:2d48:: with SMTP id
	s8-v6mr10091485ybe.224.1521569038648; 
	Tue, 20 Mar 2018 11:03:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Tue, 20 Mar 2018 11:03:57
	-0700 (PDT)
In-Reply-To: <6d77f84f-1808-b929-7719-7fef10bc11b4@linux.intel.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
	<6d77f84f-1808-b929-7719-7fef10bc11b4@linux.intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 20 Mar 2018 19:03:57 +0100
Message-ID: <CALbNGRStZxv6Mt3phdup6dJ-jNMHsMRNNodBJP9mSjMx62P4rg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/17] remove gnome2 recipes for discontinued projects
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
X-List-Received-Date: Tue, 20 Mar 2018 18:03:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 11:18 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/19/2018 10:28 PM, Andreas M=C3=BCller wrote:
>>
>> I can't stand the low-quality/split/maintainer-spam anymore: Guys one wa=
y
>> to
>> change things is start sending patches.
>
>
> Yes, yes, yes. And yes. Even more could be removed, e.g. libunique and
> everything that wants it. I'll look when I have a bit of time.
>
> Alex
You are invited :)

Off-Topic:
Today I changed to master builds and started fixing the patch-fuzz-thingy.

* Thanks for doing that
* This is a perfect advertisement for devtool - have not yet used
before. Am not sure if I am going to use that for daily recipe
handling but for this task it is VERY helpful. Together with with git
add -p the diff can be kept readable. There are two 'bugs' I found:

1. If I am not mistaken it creates wrong file path when using
'patchdir' - sorry but I forgot where it was
2. An interesting case is mariadb-native/fix-cmake-module-path.patch
(current meta-openembedded master / meta-oe): Although the patch moves
just one line, devtool creates a heavy monster diff - have no idea why

Andreas

