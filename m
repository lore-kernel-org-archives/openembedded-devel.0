Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E96FD7E2BB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jun 2019 10:00:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45MBbZ4p26z2C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jun 2019 12:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560074442;
	bh=Gd5StS6CUyEozTNtJ5MQidwfo20gJfvFEBAgx4cPGyU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=hHSyHsDuEidGmTY7GjBGg+fHjLutyR2UggBFA31G/sMq6BWT57e0RvQ/g8JRy87Rv
	ltGK/ll8dmbe04zaMfMe1FZUUhL/AFj0iI+J/mtzAQ5LnyY8UFT+a+SNwsDwyKcC1O
	SE1+U0vU/5uJNh80atDBlWLVQFpXCju0YpZQdwtfj33u0EZs9ScQyCvdMFpG0wXAqt
	1VB9tDs9psd8xMFbGPjkSJUX7S5piTxQ5hfwlEJlkRWCw7GQAra3Zcvh69Ctj7a1/H
	07pjO/vqsYz5XAkWPpSL6RMdYihA6joR4zv1ifzTDid1EoxUMHNWF+tUq9GtudJ2I0
	dJFuIRO7HoCBbqcDdBe0Hwr4cBY2SadleDMWCCliIDd7kKe200+oZIm0CUoSHLlyKJ
	4KCYcFZ0tYO5smdtSg7W0b/mxGUY+zfRpo2d3cmsSPnVrzifI8EdWUQOioaqJ5mBfe
	FVCWiJsQuShhvJPdsFzNDEbiXPlN0MMVsOEqwNBY7q693offB0oOOAVPFylJUS9Vl+
	AccXuXavSjYEkN3vRDyog2ylbYU84HjXULFRsFzEo+mfS/5BGcT13Cw+T6mDgmHLkf
	f/0rYeIPpyd3rc8zd1YZ5L5NjlfSAIHiyi3f48+To/Xq/7yK6hugOURF6NCyELp3C/
	y+vgzf6LpF/+/2lHH/LBVbXI=
Date: Sun, 9 Jun 2019 13:00:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20190609100039.GA21600@localhost>
References: <20190607201822.28898-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190607201822.28898-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [meta-perl][PATCH] recipes-devtools: Move back from meta-networking to meta-perl
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
X-List-Received-Date: Sun, 09 Jun 2019 10:00:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Seems I botched the title, resending with this corrected.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


