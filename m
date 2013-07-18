Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9D76AFF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 08:19:15 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w57so2665800wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=4vedSQF+/jfrvu7us8+Aaf/7uSwZ0T0E9dv2GxCDIwA=;
	b=lBEn4c6djr43kqbYwfocKip2j6Bl3LSMLptE3cAl1fbzopJJjJ2e+PkXNHRD7Q1h0m
	5f6UOWJ4x1V0hpq6eNZhNOWlo81YPBtsPg4I/zxA5vbwEHEpBS3ruIqq0APISOv7OWf7
	d1GHwluxvaH3J1+cNuhzMZzux3cb/Ny5tfJs37IcekdcVw1FMn+sUg5u+0+aDgYsHrQh
	2WZbqJ/UdBaBj5riYzirZkHqxhfi6mAXKmi3EItjcq5p4cRg1qgNmJkFdJfBtpzEMbPU
	S5YTpn2qmoRxFYqpyVX3HZY0lKmZvIY/LPyB8ARvO9jvAezTKA55Q6emTday3kqQE4J1
	DkTg==
X-Received: by 10.194.133.106 with SMTP id pb10mr7533602wjb.62.1374135554633; 
	Thu, 18 Jul 2013 01:19:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.217.138.1 with HTTP; Thu, 18 Jul 2013 01:18:54 -0700 (PDT)
In-Reply-To: <88701C38B5D07249817D428430999C9128CE412D@sestoex05.enea.se>
References: <88701C38B5D07249817D428430999C9128CE412D@sestoex05.enea.se>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Thu, 18 Jul 2013 10:18:54 +0200
Message-ID: <CAGiJk9fuk0-ynQQ=BpNvWfbd3wQW9sT3L-A0=NrKG9nnE8aiCg@mail.gmail.com>
To: =?UTF-8?Q?David_Nystr=C3=B6m?= <David.Nystrom@enea.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] protobuf: add recipe from meta-virtualization and tweak
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
X-List-Received-Date: Thu, 18 Jul 2013 08:19:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2013/7/17 David Nystr=C3=B6m <David.Nystrom@enea.com>:
> On Tuesday 16 July 2013 17:36:08 Samuel Stirtzel wrote:
>> My assumption is, that the result would the same, and it is currently
>> skipping tests for the cross compiled protobuf.
>> Or does it archive anything else?
[...]
>
> Sorry for the indentation issues, I'm on vacation, and did not bring my
> equipment.
>
> Yes, I believe this was an ugly hack to skip/pass tests. A bit of a warni=
ng
> though, these recipes have been tested on x86-64 only afaik.
>

Hi,

my tests case for this patch also works on ARM.
So no objections from my side.


--
Regards
Samuel

