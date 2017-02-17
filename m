Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 41C5871DBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 21:55:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id o64so4857851pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 13:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=WvYV5gOAPItGhldO1NTNvSXLCGmvckgAhLV+Jm/yiQk=;
	b=dhYWPY+XRqKXAv/SOkrGP/j8wTN6OHhcbhkKn/hifp+vRTM7Uwaw+r9kr3m/fj/6g5
	kbzipTWQyNHbpKCaUsupUigZRev3w26U+y814IIpaPgdVtGd+0oq3l2VAcpc2lTPeoy4
	aXfAQm6Ia4GhzqRSQEBQTLjQdtys8Lo2oND5FT5Pq3ji8d5m+8f5yPxjW/raeA3WyIO0
	RCVYslLefmy3L65BQ5Bz3sRi1Dnss4jLx9Jf2YLjcENwm4ML6WDrBw1OiBaLu0CknsHx
	t4B0+bvUj4/Hx9+lu4sHL2TuUj6P+rcP+7n3a8UJcUJJz3diqPd9K8NVDxaRHjhwYkof
	pvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WvYV5gOAPItGhldO1NTNvSXLCGmvckgAhLV+Jm/yiQk=;
	b=s1bworMxWpXdSFWW+BWuTDRTveKlcJlc+HIKQYpy7QtPLkAZRTpssZzGbxpyRY7fYY
	de6ynX0JWR2D7DlCotI6I8+IgXhvvKmn1H95HYIyT0QgLgsOg/nKrkVjo/fcUX2QR+Ri
	4Q5YnWcnzsC2fOwFNoaI/YSlazqi2GNSWQN4MoLC+w3NSr/ksyHRGGsH/Hpe7AU0PWZL
	v8THnAtAxCeW8fdEmPycO5hg91/I7LJdzuAVmcFAY3KiT2XBTOZEYGzlwNS1QDCKgrfx
	sDNtIMs13bzHCcyPrt3p4yYZZFHVpynJL9b4kVW+irFjrFM2zXvTkCqa2bXsyMIJL71c
	/khw==
X-Gm-Message-State: AMke39kdzNqi2MeBzheLCepNl1tmMsW7+3yPQ01GVoWJ/qO935hFAtUQOXI8wdleKJ7FNA==
X-Received: by 10.99.36.7 with SMTP id k7mr12807731pgk.201.1487368528141;
	Fri, 17 Feb 2017 13:55:28 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:c153:5943:8847:b6bb?
	([2601:202:4001:9ea0:c153:5943:8847:b6bb])
	by smtp.gmail.com with ESMTPSA id p6sm21385515pfg.6.2017.02.17.13.55.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 13:55:27 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <13707d86-58e8-c653-e099-f67fd5489968@gmail.com>
Date: Fri, 17 Feb 2017 13:55:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Fri, 17 Feb 2017 21:55:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/17/2017 09:07 AM, Burton, Ross wrote:
> The recent storm of breakage in meta-oe caused by recipe specific sysroots
> was quite dramatic:
>
> ross@flashheart ~/Yocto/meta-oe ((044e518...))
> $ git grep PNBLACKLIST| wc -l
> 320

If I recall correctly we gave Martin the thumbs up to use "blacklisting" 
to  get to a point where master builds cleanly and not expect the 
meta-openbedded layer maintainer's to do that work. The hope was if a 
person needed a blacklisted recipe, they would jump in a correct the 
issue. I think that has worked to some success.
> Is it time to talk about splitting meta-oe into smaller real repositories
> so they can be maintained at their own pace by more maintainers?
If I am not mistaken, each sub meta layer has its own maintainer, if 
someone want to be a package maintainer, go for it.  I would prefer that 
"We" the community help the maintainers.

- armin
>
> Ross


