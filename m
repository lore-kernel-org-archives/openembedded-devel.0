Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D7F48615FB
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:16:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48NdTf2Gslz3Q;
	Thu, 20 Feb 2020 16:16:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582211782;
	bh=IO1LIOrAoNf9kJ5KOxaHEWRPWVXwXXarcoMCaWuqzOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MMWAe5/SxZ89glaxyoz/2HUV6YBXYKzPQb3WZIrJPxcSQoB+mvGyfjUid+8fBvaf9
	TX2WkVZnCTGctQ7r2XctiOAVyJ1cUdW+WAmRCniFZ2ogJob3iif4vAjWbddLVPXu1m
	MbLIWF9slUOM1nCx7SwHhmTwxtUfjGChvi0l4JII4gHT2QZ2ArR4/sKVzD8Wa3gn0i
	QVFKY+xov8HmPvlyUaMmg7EiQSUN++Xn6NXpPXqV11Fy/TwiwlAgBperVvPhMPC1nm
	UWFDMJWrtKS7zEvLIkPQE1KRxoRWXd2/m3+N1zjPt4OQiVrqhvnO7BiLL2kAbOFCFQ
	d7V5YHhJFNhcU0I9dLGlS8ypDPgN+EZszXMRaG9hjf+rl3449oNIEdErvKFDoJBYVA
	ZN77t/OIFIPLEIfavt7ccSU/6LcAGPxnzXMsX79TDHs1ZD8orSmimuc6jtWyb3d29O
	WYHyNkClz5b994O1UMokIv6EhTl6oxqU3g2XARIpQ7RmEs566SoO68zA3gjul0ggkp
	MO/ZwU7RMV8LgVOTKapD+2NAkWSFDjVnq76EdGyiSHD+qDnwIQofW51z0SogLiMQXJ
	h14mr5FlEcBI8R1jolaT3GLFEUFS4MzeWr9j2QVPkTBFQ6BtVoBCKJYTg27UDPWngs
	N47rtk5bTNavj9dvUxLKKEmA=
Date: Thu, 20 Feb 2020 17:16:20 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20200220151620.GA30034@localhost>
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
MIME-Version: 1.0
In-Reply-To: <20200220144848.msiyguq2bsmqokxc@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: S variable for svn fetcher Was: State of OE world - 2020-02-18
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
X-List-Received-Date: Thu, 20 Feb 2020 15:16:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 20, 2020 at 03:48:48PM +0100, Martin Jansa wrote:
>...
> Any idea why these aren't shown in our build?
>...

What is your mirror configuration?

Default configuration downloads the tarball from [1].

> Cheers,

cu
Adrian

[1] http://downloads.yoctoproject.org/mirror/sources/

