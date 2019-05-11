Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 39D057C68D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 21:09:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 451fpR1W54z4D;
	Sat, 11 May 2019 23:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557608959;
	bh=8q7zAKGcPAaAdLMzHchqPR4AyUBYLvfPxiwvBuM7Rls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMaVSa187Kt6mtDVYPf5VCxL1a3r7wbSy+HS+UAlwZ9jBZf+eQD/X01dEFbh077Ma
	mw6Hb37FObZqhugN9z6jL0VBlf2dLCYybmfijp/S4VrYJANJwN7v9SS5BWXCn+p74R
	AZJeUPv++6hVrvX4NXcNIAiOYigBGAYOSdE3P1wdv1/qiYei6Ojve9kq9sNcUjMGOB
	oJO/zUppxIqTl42t/wpIA7MQCjmPBCiMJ7a8JQJrpg+/vou9TyJEuSMuwY/AS4YdF/
	jTfyCcvwCQc+neefDcm7k7si/Faa6QRyWFiIItgo8123QhMcPF0LFPW9HBCJMtIjv/
	lsbTE70Cey/D2MXmx3kAaft7hlUaORZdKgksxH8TJjdWabiFRCsR8JRJ7xCzURCZ09
	XsjNf6q4NxGnId3LamVVcittoDKafkf5wb5Q7XkieQ8UAtyY1VsxvDVHUsZgLoV7ep
	Uk1HBt8A/Un3rK9ppmAbg1VrHeNFaGnbIQIstTqEvcg2At2HgMMl0eeucu+OzJLh4V
	TM/E5kX31ig+sKdDOuzshh/O/gdjgvCXBS4mweNT35Nk9f8ZGqwbdWg1Sw05Mc08h6
	cRiweRyBmPxjHFNTOfQ4KVCBTl/chXb5zL6itHOck+9c6QpqW/QXsroCXyIBxdf3dI
	dWB1NuPKdpEz61iqy4SPZCH4=
Date: Sun, 12 May 2019 00:09:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190511210917.GA25833@localhost>
References: <20190510115515.19491-10-bunk@stusta.de>
	<dd9ec01e-c6c6-532f-96da-f39d6eb82ffe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <dd9ec01e-c6c6-532f-96da-f39d6eb82ffe@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] geos: Upgrade 3.4.2 -> 3.4.3
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
X-List-Received-Date: Sat, 11 May 2019 21:09:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 10, 2019 at 02:06:54PM -0700, Khem Raj wrote:
> 
> 
> On 5/10/19 4:55 AM, Adrian Bunk wrote:
> > Remove patch applied upstream.
> > 
> 
> I am also seeing license checksum mismatches
>...

Sorry for that (and I am still puzzled what went I botched so that
I didn't notice).

v2 sent for both.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


