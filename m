Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E724B78A06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:45:21 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r26so1272992pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iUPAG2EgqA3UPbfJOn5XAXkcMpcxopz9R7XrzTXRHVk=;
	b=K0o3xZa9tikK6CPrmVpYjshUZ3FUvxxxfldxBFSOgYnkZmMy6JoHLie2WydgfclJFq
	+EON28buSKsS7XpPCkUBwwuXY8A70Pt7W970BkakxhjM9gXhmRhtLMmpwYHHyovB+0JK
	Txo/ab6BtoN0Kr7WhFLZHkEEof2RhFLZRPrSXxGuLPpSGckyQyqLN49AM1wSA3CO2jxd
	RoAsFctQW6xqGqg8LFLijQkh4w9PKZAlTaB+kYFZQ/my/eh0XDeBPL4Pf7lDzO9ecUwf
	hkq32xmaiM64gEbFFXTW9kPRTwxsgf7UusNSGgWzfFQ3sSbfZ5Y3g2k1XohaJ1KOM0XW
	VfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iUPAG2EgqA3UPbfJOn5XAXkcMpcxopz9R7XrzTXRHVk=;
	b=tsfmvF4f9qD134t25Nyate2ORd6ys7atcCc5PLQrP+iT54CcPjH1/bsZbVggN9k7QC
	BdPJwnNUlWYlyajK4tf2dbWkxlCrBYcQVroU12o8LmBGjI7aPxNuCS7N0Vuf+W6hFFGf
	jtJD6uo2o2PISjj6yX9brNQY8EoA1twQ8n+1eDF6mg9SZtbLah82Xhz/eRr+Ka4UI5Mh
	7rQ25JzBHx17PHNU0BZFzrpCc5tNdJPPjPOW7fnQAOztfPi52h0XkYEdcqsQMVn4J+zn
	C/0AFVnewuNqgWS+XIQq9iSC7+1u3E5NUYPECLkgI+lH2f/1Wxg3fkid2RGt+vjSPXTY
	XnpA==
X-Gm-Message-State: APf1xPCqRylVy7CU5U4y8w1hemSadTV37mgoRoyulygYUYeARtb1/9Vg
	0Pf0athXC+mik6HS42JdJqQUGE9TwGCkZ8Y83dQ=
X-Google-Smtp-Source: AG47ELt1RFmfXIxyOYcgpWyETfH4jcUDDqzHczjIO1Dt/vtPcNqoNLWfZf6MAKeP54d0QTFxhDuQmVUTukA04wPilB0=
X-Received: by 10.101.99.66 with SMTP id p2mr16639469pgv.384.1520451922818;
	Wed, 07 Mar 2018 11:45:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Wed, 7 Mar 2018 11:44:52 -0800 (PST)
In-Reply-To: <1284db2a-8cff-7f97-dc7b-dc17370167c6@gmail.com>
References: <1520091651-25420-1-git-send-email-derek@asterius.io>
	<1284db2a-8cff-7f97-dc7b-dc17370167c6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Mar 2018 11:44:52 -0800
Message-ID: <CAMKF1spBBbPbznHUZApcmCfx2JD-7HPV2ccEpvbVcyUfqgTKHg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv3] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Wed, 07 Mar 2018 19:45:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 7, 2018 at 11:42 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 03/03/2018 07:40 AM, Derek Straka wrote:
>> License-Update: Update the license checksum for copyright year and verify the terms remain the same
>>
>> diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
>> --- SQLAlchemy-1.1.15/LICENSE 2017-11-03 16:47:01.000000000 -0400
>> +++ SQLAlchemy-1.1.17/LICENSE 2018-02-22 16:08:41.000000000 -0500
>> @@ -1,6 +1,6 @@
>>  This is the MIT license: http://www.opensource.org/licenses/mit-license.php
>>
>> -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see AUTHORS file>.
>> +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see AUTHORS file>.
>>  SQLAlchemy is a trademark of Michael Bayer.
>>
>>  Permission is hereby granted, free of charge, to any person obtaining a copy of this
> The above is confusing pw.sh as it thinks it a patch to be applied.

yes I have see that too when I added diffs into commit messages patchwork
really did not like it

