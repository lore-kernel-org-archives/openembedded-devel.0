Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 256727DEC0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 20:47:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zpSs4rdXz3k;
	Wed,  8 May 2019 22:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557348461;
	bh=19qKGGxUMh5mX1BmX2O1ZfDrDQuBgEZQ6R9+FW4izJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXrpz8C/Ckw8lfJxahfif2Vw2IGMEJ1Z+yOkJhLK83ySr8HsnMtDPCcOYx+A1Lp+P
	4cUqUbFH6EcogTQbSl/b2QmGQ2wUrbcgRWSteelGgLdlBr6klnefHBgCoKDv3yLbPw
	hxpvYaZL7YG2wBE1NLlhzP/XtStYglovcEXwLcjreA1uZLItR89dQf0kYWtrHsnDAp
	P/+UsAaOSnfS4vY8obKT7YSrsu0Jm/Jq39JOIBYlwBWenIoQFRnPHAe/O6XPu+Zxwg
	7RFGvd4yHrOEcqE1msMl/ZX25GtY+BuCqmOpnXXe3favhwXXvWsA2KP5AhyI9imTD9
	OIkZKK6K7DfOB05mL6bwa2KA65fzmWqPtq5y5lUPsa73Z2KLXYBdiHFJ6WU4AdjEt5
	sSem449RJasQJlzTMgpiXwuP3pgRZ3Ox0JpLEcIHdcVZrbrVWDO2HhTRPMslviGcD8
	sgb+1tEwVkikzq+lfOgOVR+Xr22HOmkQkinUi2r/9pbus/pinnMGY3lJLl0CH87oFf
	/f7Ad8U8PuVAb66lXiLoliPj3lBAqv8dCRoGXcAsBRbGRkjogllwHEKcioVEBf3Nxd
	2hrOTlRPf6yaYXw9Ho1IxvLG01+md+NyaFEXmtZIpdDRniotjSxeJM0ozuNtg8Tw+J
	zJFb0dK2PPRxRvYvjnsO94mw=
Date: Wed, 8 May 2019 23:47:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190508204739.GD18736@localhost>
References: <20190508195852.28803-5-bunk@stusta.de>
	<CALbNGRQr_0b0kTt6JeWz8K=tdr34NumX5PEHCUZHJMnGnrLXnQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQr_0b0kTt6JeWz8K=tdr34NumX5PEHCUZHJMnGnrLXnQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] Remove liboil
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
X-List-Received-Date: Wed, 08 May 2019 20:47:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 08, 2019 at 10:35:43PM +0200, Andreas Müller wrote:
> On Wed, May 8, 2019 at 10:00 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > It was replaced by orc 10 years ago and no users are left
> > in meta-openembedded.
> >
> Hope I did not miss something but I think it needs to be removed from
> packagegroup-meta-multimedia either

Not sure how I managed to miss this when I grep'ed for users.
Thanks for noticing, I'll send a v2.

> Andreas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


