Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E87267F8D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 08:37:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 474Ft55Ygxz5h;
	Fri,  1 Nov 2019 09:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572597422;
	bh=13qCgTIPWVs4/ThK0rWl4gBn2NCqkobcJota0gSF+o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkDXW5Ncaqnesbqgmny7kG3APc8lxNQ+fWcV4RM/jOXH3JUu2HhpCp29zTm7JtVQ1
	byIq5IAKD15x74BqfcE3F2Cdm6hAw5VR+obM8e9/w5/jO5VmCd4rFvt2edcq+h5dsj
	0SudV0vQEHF9XpK6SOZg8T8qGl++7h52XHSmBTB47puO8qOCsnMX1xl76Rqafvkgzo
	IDTlKXwCmQvAG4tytMROY8jD8FpjiQsV9LRs7aFl1o8jtOrhUY1n/ODvnccCL7pK36
	lF3mdXHEFraezAX6ctYrCd07kAom9TvGMlFV5ICApmh0xqkzIbdbYYzoJhfZwHP+/P
	4z2yvCz+J9eKBFHL77jR6qLcJ0AgC6+R+wwZZ8UL3tVqEpNJR471IjANTOaQMvs/9m
	uri+NzYHBzB7jfC1qa+SwEHt7h5sqxFKoydpp5arCxDAFkfaoUB9G0RCQOQEu/RYlD
	M32MN7i3szR1x6ttAg0dSmwd4S22RN+3WRBZ/pNMOoPq7RbcblOm7/z0jfAqs8Txng
	ksV2NLv8v6MZiBGeoY/3dXTM7m2h6J5niJ0uQ2SO5xeQnYibk8mof/OOsMO37yEbhR
	oqfT9/NJXe91rvEsQk/K31pOzRe5/L2VOPwdWRMC6MbQ+WC9trFuknD+lz10XTpibV
	/qh9OnEoqY87jKet9dhklD0w=
Date: Fri, 1 Nov 2019 10:36:58 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20191101083658.GA15243@localhost>
References: <1572534977-51385-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1572534977-51385-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libtorrent: upgrade 0.13.7 -> 0.13.8
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
X-List-Received-Date: Fri, 01 Nov 2019 08:37:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Oct 31, 2019 at 11:16:17PM +0800, Zheng Ruoqin wrote:
>...
> -SRCREV = "074f6ec51a2e4bc5c6140b4dad13c9bb56f3f0dc"
> +SRCREV = "756f70010779927dc0691e1e722ed433d5d295e1"
>  
> -PV = "0.13.7+git${SRCPV}"
> +PV = "0.13.8+git${SRCPV}"
>...

This is exactly the 0.13.8 release, please change to
  PV = "0.13.8"

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


