Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 14F817E168
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 06:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457R3Q4WfCz44;
	Tue, 21 May 2019 08:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558420834;
	bh=pG5LbF2aXBGIue3aOT4YTa+54SWJ7Q7BsXraNwf5kvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqpksoJ1cveidAiEHMtaNWBoMP+SQb5jI+BXJ9iGzit9DSvzMmFMnuvzNR7FM/j0Q
	zK4NqnDYlN2hWv1H3QhsHGuFctKqhYTrldz1NPi3G51HBpwEYdLPtNyE0F0uSzzcZF
	7Dgs7TMUxzcyXmoZ+2zOLR4b8riTX6sHpogneqjc42CttwcKYg22w4X4FIdY9hittd
	XF2Rr/Qxhu/+9Km/EwGC6zIi79BWo5gAtHx0DacfJeBkxQh8K6zNWp7UHAB70zAv7N
	81MhvYUUQlnO+6G0cUGTyHg5oUuv7oLLQ1kO9B7xE3jkgeShxNQxJ74Kk5zv464wAO
	MFU3hTZ7v8sWSVkc9yP6uZTkCFczBayRC9gLoOYtJjagJklz034K7QZzMXUyDlAk/0
	8M8ybZMxDH+SMP9mWescliIASXZBFD5foz2YbJV07rqCC+btjXxpNUozV+lCrvuH0E
	x3/04aqnW3a+rMubOe9s+upFXi/WfnYyEi35PIpQtLCOuHFm8IfhT5L+gwKBIodyhZ
	Oh2bboidA7BwzJmqkG6gVPIdf3472Zx+zF9D7ikklqqNWQ5wd3CfOmsAJBy1l6znAl
	e2SY/eHs4t4KDeBi6PEgEAnf4ljN+mIBk82Ao9w6PzT7E0njy29N7qsmkk9OmXC4lJ
	oJpjaiMhPvQRbff+hDPt8zWI=
Date: Tue, 21 May 2019 09:40:32 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521064032.GD9971@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<fd48edcd7415f4a1ca043e256585f2705b66545f.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <fd48edcd7415f4a1ca043e256585f2705b66545f.1558410874.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 02/34] python-pyasn1: upgrade 0.4.4 -> 0.4.5
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
X-List-Received-Date: Tue, 21 May 2019 06:40:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 08:56:02PM -0700, Armin Kuster wrote:
> From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> 
> -Upgrade from python-pyasn1_0.4.4.bb to python-pyasn1_0.4.5.bb.
> 
> -Upgrade from python3-pyasn1_0.4.4.bb to python3-pyasn1_0.4.5.bb
> 
> -License-Update: Copyright year updated to 2019.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>..

No reason is provided why this should be upgraded in a stable branch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


