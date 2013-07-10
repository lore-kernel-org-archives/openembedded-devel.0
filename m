Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id F064B6012D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 11:08:35 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id l10so9437840oag.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gCwIZ1g99kv83XO4luAaG8zWm9ukvENe44ogoXiOXL4=;
	b=zwMPvOi306SR2kexadBd487nM7PzMukBZn/gZ9jaOdwS2nhtNMvsDkABfDSa7sV46T
	XxI7AgBXLCluZraIFY/oooRu76r7lhgb5PIT1ZOaQ1lWtSpLonZdYvYzN5+vwZhmcajM
	peg8N3dUNAWwsqvmsRuqbRHjkt14dVTw23MpV2chzbZKAzxg02rHHcxviXB6jNkpOKc/
	KS/XZRAwkf4/UJREXBUiCbkpmvcs1bjMKqJm97QWjdPReY/a4lp+BPvFwX1KTFPDKs3I
	uGd8TraQwnfbOLYno5N53MNCivKeOPL3Y8uD5y/HBXN4O5wLauLQtRlJckzCJIFnT2q8
	PWmA==
MIME-Version: 1.0
X-Received: by 10.182.66.137 with SMTP id f9mr20768601obt.24.1373454516110;
	Wed, 10 Jul 2013 04:08:36 -0700 (PDT)
Received: by 10.60.37.65 with HTTP; Wed, 10 Jul 2013 04:08:36 -0700 (PDT)
In-Reply-To: <CAGiJk9eLz6cwGgWQLZ0Go4di_k85dGDVuH8NEWxBgkDnVNzzAw@mail.gmail.com>
References: <1373452107-1368-1-git-send-email-B40290@freescale.com>
	<CAGiJk9eLz6cwGgWQLZ0Go4di_k85dGDVuH8NEWxBgkDnVNzzAw@mail.gmail.com>
Date: Wed, 10 Jul 2013 13:08:36 +0200
Message-ID: <CAGiJk9e8nLzTC=ceqROe4bn7=CLN-EEAWMDarJ_cLen68ywjxw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: b40527@freescale.com
Subject: Re: [meta-oe][PATCH v2] licences: Add iozone3, SMAIL_GPL, NewBSD
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
X-List-Received-Date: Wed, 10 Jul 2013 11:08:36 -0000
Content-Type: text/plain; charset=UTF-8

2013/7/10 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2013/7/10 Chunrong Guo <B40290@freescale.com>:
>>          *fix the fllowing warning
>>          |WARNING:debianutils: No generic license file exists for: SMAIL_GPL in any provider
>>          |WARNING:iozone3: No generic license file exists for: iozone3 in any provider
>>          |WARNING:iperf: No generic license file exists for: NewBSD in any provider
>
>

Sent too soon, I blame obscure keyboard shortcuts..

> Hi,
>
> I would recommend to use the generic BSD license from OE-Core for Iperf,
as http://code.google.com/p/iperf/source/browse/LICENSE
and http://cgit.openembedded.org/openembedded-core/tree/meta/files/common-licenses/BSD
look identically, Iperf only adds a note about contribution license agreements.

No strong opinion here, but adding a generic license that contains
Iperf specific terms is counterproductive.


Please note also, that the current version of Iperf has a false
LICENSE set, only the new version is licensed under BSD


--
Regards
Samuel

