Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDDA72218
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 10:32:21 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id m20so6638803qcx.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 02:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=N0M5IDMqWnjhKaUJucbsMhJpeI1axFQXtJkkay3SXF4=;
	b=dQr1ED+dOT5Df0K4rlnsX2ygrDbiaMkjQylL6bAsjMswtecCzi88jGxhc9y8ZO6Lpl
	ljDdwnsWiyRsRmTAC3KSpenlWytzRKsrv1+w3CAt2sTFpuc1p7Hdr53p8Nh8t3H3H6tB
	FaKSbx2N6I0+uQLTaqz/7RuuoivAD1t9nY7SqxuDV3c7RrtAZ05kGcCUtUXwZj6aW1Mu
	pr0Z6VRj0lDcbEBK7YD/Wrqg1m/Uej7JNuN5MpDEaQSzsbOpNDJYY6Yz6nuEv/1waNL0
	OmkBP0TuwVg0b0bTH8RutqcLQiyPO+BXOclfpfMf4lehr8aNxs07reFGtxvynii6QmMH
	ls0g==
X-Gm-Message-State: ALoCoQlquFqI9oUhnzTCkrSR6i05Y32zfhKZURjdGnem4//bHfbtgfJHq3cUJCsuCUaGjYFv2Bbl
X-Received: by 10.140.38.136 with SMTP id t8mr27605562qgt.15.1416825142498;
	Mon, 24 Nov 2014 02:32:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 24 Nov 2014 02:32:02 -0800 (PST)
In-Reply-To: <1416811526-54855-2-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-2-git-send-email-biannm@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Nov 2014 10:32:02 +0000
Message-ID: <CAJTo0LatxQrs9K+jX2BxeJRrOjn087qtqV6+chgMxP5msu92Yw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/6] [meta-oe] evieext: Port evieext from openembedded
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
X-List-Received-Date: Mon, 24 Nov 2014 10:32:24 -0000
Content-Type: text/plain; charset=UTF-8

On 24 November 2014 at 06:45, Bian Naimeng <biannm@cn.fujitsu.com> wrote:

>  meta-oe/recipes-graphics/xorg-proto/evieext_1.1.1.bb | 14 ++++++++++++++
>

NAK.

commit aee0f321ef939e7d7ad9585a66e8cb22cad7514f
Author: Ross Burton <ross.burton@intel.com>
Date:   Fri Oct 12 09:32:16 2012 +0000

    xorg-proto: remove evieext

    It was removed from xserver in 2008.

Ross

