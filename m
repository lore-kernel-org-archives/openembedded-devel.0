Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 03FEF7ED8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 12:02:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tv9M3DLzz23;
	Wed, 24 Jul 2019 14:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563969751;
	bh=e0G8l1shla3Uw3Q2B6JVLqNwKykAazNlJRNVNh2NWoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFJIHTbTq37aueZ73y1SZVvcbAzOradXc3zSIVoIpHkLMQIIzR6PvV6BdWHkA6E4G
	6Q0OVLTVqUCRcv0wbuCZ+5SjywTHDhSoCM9GH+YDnHUoIOc+kFGFaGNVmnATSyldMD
	G7PEPOkp+ig+OjUGhqei96ngmdRnPV4aY2Mr5IGaaTdk38gc4BKtlK/zLsUf1PZjjK
	8VWR4Mt5TdXY1WerNVBXFMrengG3WDJa66bsQTpJQzrP5VkyF6ScJLS/lHr3cvjTav
	iZoHSiIBNogHEBfMiTQKFb0HtS4Za3bl6NJaZief3nEQw4Ou1UjGtB04omZMiv1pnS
	g9n15v622ykpqKnWlZ1/blzo8aV8udhJZpPSFKI4rK2uFbVq9XnRFShYREkiraO/fB
	tFaushtXdWToMl2nHxy9MwnwgBdjq28QO0ZR0NNtJn4rJrtT01HIVOTvN+E11fV9y8
	hKlm+w3a13c1PxZHuO3Jz8YYPe4grqusT6AGZ47bCFZz3U7Xozx4Lbigat8x2JWgn8
	LHp0s6b7kltTlCK4HWurtmhai6bW2v/Cc/o3lY0lGt6Ln84YtAWYtlx57ru2sIh6IX
	bCpMhA7CzNBFbnzZ1XZMRHgC+OOzbbOXxiexwjraB9qybFR9XLP4HqEPsg3fIkDACA
	gBriM62A0gf1LVkr2z9cxi78=
Date: Wed, 24 Jul 2019 15:02:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190724120229.GA626@localhost>
References: <20190723151739.9337-1-bunk@stusta.de>
	<CAMKF1srK9e7bZravC4r_1rwL-J_xPHmQipwAbu7796FLHyDjfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srK9e7bZravC4r_1rwL-J_xPHmQipwAbu7796FLHyDjfA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH v2] meta-gnome: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Wed, 24 Jul 2019 12:02:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 23, 2019 at 02:02:52PM -0700, Khem Raj wrote:
> https://errors.yoctoproject.org/Errors/Details/253908/

Sorry for that, I am puzzled how I missed that one.
Fixed in v3.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


