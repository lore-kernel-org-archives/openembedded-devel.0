Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9783D7E5FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 09:55:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Jydx2YlYz3J;
	Thu, 29 Aug 2019 11:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567072517;
	bh=5+BIzbaOE3dSDf0yT5r7P+ABctllMFoEYxVKKQIricE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ig/cArytyVvjDD7LevuIaj3gB7wpWJuP/cZJhmpsQN1LLgl+ZXKagBM/yulcse4oP
	iOe61dASUZqLyMXzyVpct4WDiV12QGcU8QVzoYFsb8nNW6HOvElzVRNN0GtJsgYES5
	0yJNkhUeMIa81sBjOs9Dwt4uKb186L8jIRkmbXKNLA5Lbn2exIYh2eBawE0SUvH6fA
	LLlHRU1+WJbGM3YGl3wXFtesL4QRDoPyG5/l6kOpGTq7nL0w3d+bvZYy6VYaZ856dK
	+duJwTOBi+vMJVYkWL56eFPSSOjJo+BHBQCMG0uoDL7winaGmkapDiVU4ZI0WQFp5I
	LbmfZ+EjWQp6Kh8eQC/xnp8gz7zSiWqYaIPzKMTHdUdHuHkOsdFAiNF12cA0BcUrbn
	SIC2zKSfDdSrIIurDVRgluAX5KRHNBfDkwSpNyUqlOOor9b1vCvTCtKIV1z64iawma
	VVkfo5Rz9IMTPVkb11Nwz/DAwHaBy2tnB0Dh9+F4DO0+giGR4uPOCEDIZ8+DiDPIaB
	+Jz9SF5QiDvEG7y0DKriDhx/oPUztL5gw/AAfUZN5DH7so8iSQhE+GbvqmO9g6vb4A
	F5yvLcuie9jamYFWK71jQkbvlrEiRBXEtPQ40TogT/F+MG+LfHzflzwjEUejV3BmCQ
	rWkvoyj+bdqmEQWIpWawVves=
Date: Thu, 29 Aug 2019 12:55:14 +0300
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20190829095514.GA32705@localhost>
References: <20190828171538.16160-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190828171538.16160-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [meta-oe][PATCH] Replace EXCLUDE_FROM_WORLD_libc-musl = "1" with COMPATIBLE_HOST_libc-musl = 'null'
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
X-List-Received-Date: Thu, 29 Aug 2019 09:55:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Sorry for the confusing submission, but these were two different patches 
doing a similar change in different layers that should both be applied.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


