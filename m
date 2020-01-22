Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 134977FD60
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 17:36:38 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-bor-1-1001-35.w90-120.abo.wanadoo.fr
	[90.120.192.35]) by koncepto.io (Postfix) with ESMTPSA id D39EA6040C;
	Wed, 22 Jan 2020 18:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1579714598;
	bh=+xw/hsV8Cc1j7qWeqGyw4Xaz0XhebtMNZ4Cre8OcJBI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=iUU/XmTv9C1tv/ddo+oNXCG79cv6ktbbTV51O3pbYiH/CfOw7UPDGamCrPhRvub8u
	xgHwvNx8bl2SHjp1UvNtPmF6nbt4X4FlDEtrXPtTKpGONw3Fv2UpqPRM4T1ZfP25I1
	jY7ii1tMWpuEvd2H7Kl1BTQnlmSUJDWZ+b+5X5Wshvj/xU/6vr/rDZDcB+kN8EOfsJ
	wOiNcLbSikgH0DrDQ7FQMY8up0OLBdH+KkBIl8QbAkMy8b6SoJnOtYFLGCMqNwc2YV
	pPu1b+AhJlgjYg3SmBWFusCzFxW7j03HrQ0PNSzADz3ZIlRFkxYkJ3J1tuhP09r4IX
	1oS9cCiptJemA==
To: Vincent Prince <vincent.prince.fr@gmail.com>
References: <1579301025-29499-1-git-send-email-pjtexier@koncepto.io>
	<CAB2nKc_JoM6ASEBQAe1gs74W29VAMLExr4rJJut8knKLFkAMUg@mail.gmail.com>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <b0a03674-9188-dc12-9499-45e908420a4b@koncepto.io>
Date: Wed, 22 Jan 2020 18:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAB2nKc_JoM6ASEBQAe1gs74W29VAMLExr4rJJut8knKLFkAMUg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cppzmq: bump to version 4.6.0
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
X-List-Received-Date: Wed, 22 Jan 2020 17:36:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Vincent,

Le 22/01/2020 à 13:17, Vincent Prince a écrit :
> Hi Team,
> 
> v4.6.0 breaks some namespaces from v4.4.1, maybe we can keep both
> versions until people migrates?

In fact, before the bump the version was v4.5.0, not v4.4.1.
But I think master should contains only the latest version.

Thanks

Regards
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io

