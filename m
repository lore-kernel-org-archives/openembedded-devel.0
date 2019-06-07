Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D8F557CFF6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 07:50:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45KvpC2rn0z3L;
	Fri,  7 Jun 2019 09:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559893828;
	bh=/GKG/YVLKU7kvu04YsJIpq72g9AzdG4M67T6R+DfmlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5pZC8yrYF1Pv5N8RCSPiMYBffOjNgw6asaqHmsjAvTsJZMnnpiRsOTb1IBvWbiy5
	ZFYCzn8YEmqK8LNbRKMaigR2TdEjeFeGU2srYPrUT2T8f84i3hU8JW1D3tOGCUFx6+
	b2EYKvumfBulo6b7PFM2SFFf/ND71yVTdYx1X43QnqwUTI82j0Kpy17Pk0EMDhu+pL
	7u3FQanNOT7nLQfOjs7TnLcY+Vgk3FcYybA9URmH219qv0BuffnE0M+egnTpK2CMMP
	6WjAchUvtCTQiXGqGyPtPU5Dn5NKrAsuNbED5zddH9+T85q0e1iXRgKZAJNa+5VLBx
	Gqfj+zFlgJ8ZvwQa2Zdsl8ipdinciIlgUYUG1nGCZJxgww7fVIK7dqUJzQbENC4EH9
	7xbhl7awCHB/HYmEd8GBQ4wrUjaTnZ0LKUZM1IWVLZAQeDqyinvOWNfFHI7/xFR8DK
	5ecUlhOyM1j7g5lTPeICFGMuw1U9Lb2VwmLmpJE1TuKUtoXWFGrFKta0CQgGzkVzQ5
	r0Eix2yMdNbgTF97kAaGkgPzm3+wjTYcw7dFMK/51lWLthYPKCZlloF1MWvwoJDq9+
	rptBNWfo7eIN69FFsMniyrWS4uP/1ortPUoLTRtJCV4PaGTOTkY1MpqcvU30ETfTWo
	3e1/FLAIVHfVq2Y2m5wHV6jw=
Date: Fri, 7 Jun 2019 10:50:20 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20190607075020.GA3979@localhost>
References: <20190606034737.12893-1-zangrc.fnst@cn.fujitsu.com>
	<CANx9H-CoZm=_-4BDC_SEZ+SmGeADQUTp2DBhBFpXhxFsXVPwvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-CoZm=_-4BDC_SEZ+SmGeADQUTp2DBhBFpXhxFsXVPwvQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH] python-mako: upgrade 1.0.10 -> 1.0.12
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
X-List-Received-Date: Fri, 07 Jun 2019 07:50:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 06, 2019 at 11:51:41PM -0700, Tim Orling wrote:
> While you are at it, can you please add a python3 recipe? Python2 is EOL
> soon and this recipe will be at risk for being dropped completely in a
> future meta-python.

This and others already have a python3 in oe-core.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


