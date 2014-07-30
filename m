Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4345C609C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 20:04:03 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id rl12so2221690iec.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=JUMkG1YZv+4VlwcH1fFdFaxvJU/YHerX4IDrv+jikPE=;
	b=bQsmRe6aMj5utWl2rzvwtEB26Rx5KOjgw6GfxzgV6TtdGut/IjcqEVCfYGtRKuRtk+
	xGlpBj5dIp8pr5Gtov8yfj/l7UFjE8R+9bH0l6a5tNLLm/fcmbzQx6XzqpdG+EyIQgMO
	7Ec0o1Pu6isZ1YHzjOIOsyBt+4KNMvpp9AFOMorcg7oBAF3NWhIxQQFQqsDHLVXKzBUc
	lYHca3KdsV+c3XoZ10Ge3xpZZCTKErFNFqw960FYluPyt6PESiA9lTTUF1l/wAps//UJ
	7nqycNMTrSKpzXkdb0jQnei1zUnTDYw9ti+FzhRs8gjzdqYgK3uHrXkOkbbhbQBcT+Fp
	Ml0Q==
X-Received: by 10.50.176.202 with SMTP id ck10mr58391843igc.2.1406750644111;
	Wed, 30 Jul 2014 13:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 30 Jul 2014 13:03:34 -0700 (PDT)
In-Reply-To: <CAL0pqZ0hXybc_m5_wsbtoeekbz0FUrFFK=jXcsa2Jm+3XugEzA@mail.gmail.com>
References: <CAL0pqZ0hXybc_m5_wsbtoeekbz0FUrFFK=jXcsa2Jm+3XugEzA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2014 13:03:34 -0700
Message-ID: <CAMKF1sq5epx=VmB07HxePZ-XrD0J43d7axFcY=C1bYG6r34Dfg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Add recipe to meta-oe
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
X-List-Received-Date: Wed, 30 Jul 2014 20:04:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 30, 2014 at 12:57 PM, Leah <leah@wolfssl.com> wrote:
> Hi,
>
> I have a recipe - cyassl_3.1.0.bb <http://cyassl_3.1.0.bb>, a lightweight
> ssl library that I would like to add to openembedded. Please let me know
> the steps I need to follow to add my recipe.

Follow http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

