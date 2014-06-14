Return-Path: <gada.kashyap@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 493F26FC48
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 12:41:21 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id w7so196105lbi.35
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=XOcQZLV+NCszUofC4sC8cmjwLAb86iZ/yQoCVQNWtj4=;
	b=Yyzi077xvr/jnG/vMvRdcUkmiNGFunsZhdu1y9EmvWOO4bIGMEhdJhRBANYbeFjxB9
	3nYXIV+2lyTSpzXLIXMYMjvVP1jl8ZOzANpPluj1V65b87zvc7hmM6Yo4w1hLzqmrf/T
	HP+YYQ/Eo2uzMLM3bT/I9HQ78dJSiAtTmImWwDQawrZgFSOzfUqQo9Fp7mOA1rXamGPq
	utohuDCLQxBS29GJi4mWHKyBPIcc8OO2OUV/3ciKC7LbYuJ74CyCf/H/3G2447cwcXxg
	baGrL2R9+aqUpJTy+8QjVfdnPu77ZDjvBZksyUPCQ8ka6ZZOUTSUNtsq3ZyECOywSVSm
	d/nA==
MIME-Version: 1.0
X-Received: by 10.152.42.194 with SMTP id q2mr5984068lal.39.1402749682141;
	Sat, 14 Jun 2014 05:41:22 -0700 (PDT)
Received: by 10.114.29.132 with HTTP; Sat, 14 Jun 2014 05:41:22 -0700 (PDT)
Date: Sat, 14 Jun 2014 18:11:22 +0530
Message-ID: <CANJXcUaVsvT2JUS=o-vHEh9kAT7S75ec7rywWLrAf2ypydPJuA@mail.gmail.com>
From: Kashyap Gada <gada.kashyap@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Rasperry Pi bcm2835-bootfiles-20140221-r3 do_fetch
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
X-List-Received-Date: Sat, 14 Jun 2014 12:41:24 -0000
Content-Type: text/plain; charset=UTF-8

Hello,
The following do_fetch of bcm28353-bootfiles-20140221-r3 is taking
considerable amount of time. I have kept system monitor applcation on on my
ubuntu workstation which shows download at about 114KBps.

I want to know if this do_fetch task is interrupted and bitbake is stopped
as I have to close down my office, will bitbaking the next time i start the
process continue download from where I stopped or will start fetching for
the package from 0 again.


Also can it be downloaded separately, if yes where can I find the link to
it and where do i have to store it once its downloaded.

Kashyap Gada

