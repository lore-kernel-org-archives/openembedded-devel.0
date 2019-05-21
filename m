Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 876E57E168
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 06:42:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457R550zvsz44;
	Tue, 21 May 2019 08:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558420921;
	bh=RRhScwKPrymq/yw9WCbMeMHtreBldH44D0vdEl0pOps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIBHJIbtpsLgbol/F2jHtducg450hn7eDNWvm4VBnMyvmy/RSN11SNQ0Mq7scqgYH
	qfs7C5loYiw71jJgDegYnkaSlf6grM+KDl73oUguk1/HXAkfHi8D4PIu3OSicuEj2j
	abM3HyBBn17h2CPGfVFsox3/OFLoGlWvXpyeWYpK6pQvl1v/x5NV4/aww1NWtNGSCx
	kvmdSjtv4UcNclKAgCwU/aFdOlEth72w5Rz01U80MRZAWly72ehs1wIAXtANOxyndj
	XqCsFnfuojIWSJPznjIXvtbz0flg/n06NPK4BMlyi77y1/PYf5tUzb1wAT6Mpn9BOD
	pTwv/Uppc3Ecz7NCnouxcNKuzDYKX8rnM2HuTK91tU5V5PojWrnwIqUDFgJn6Q4/6s
	5EkhLdHF3vEkB+83oM/NGBr6qCtcNybsZl07BSHgQKVc/WD8bns/d4PexlEJQ+ujZU
	ezl73YgKwtPbtpy9fvKLddFHj+EQjP9VfrSwgqe1HhyjL9e+neUrXa3BfLF+xK6E3V
	DG0iP1duA7s1eGYF1/IwnlpIuBMwLlR29nAR5/WvG5gZCvgF7jLtAWLQ3lTdKhQE02
	75PQ+2pOXWOjkij9UYiXW32XPYOJuPu8nRSf1d4txwa6mof+FDed0ryYMF3tdxE8X6
	zxB02KReO9O9zeVNo/xRxZwI=
Date: Tue, 21 May 2019 09:41:59 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521064159.GF9971@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<7207a2559f5239b62792bb06638941c67ef2c13a.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7207a2559f5239b62792bb06638941c67ef2c13a.1558410874.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 06/34] phpmyadmin: upgrade 4.8.3 -> 4.8.5
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
X-List-Received-Date: Tue, 21 May 2019 06:42:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 08:56:06PM -0700, Armin Kuster wrote:
> From: Yi Zhao <yi.zhao@windriver.com>
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>...

No reason is provided why this should be upgraded in a stable branch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


