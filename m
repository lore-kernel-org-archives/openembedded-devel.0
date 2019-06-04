Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 63A5C7D533
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2019 08:37:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45J50Q0xSpz3L;
	Tue,  4 Jun 2019 10:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559637478;
	bh=0g0FQ+d/A8FDhqKmAxcNLHyPWm4mMKAAq1L2qNQFoRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qt+HAsrm4OQGIRCofDydIltfWkXZFhWZxsXuYCj/NMtkT1bBYHe9TPtq+wFt/28g0
	rgQOQVGvVdzOP8QQZQwPxv9YgAnQy/Zgb71Pm+X9oy2v78306JMyPMo0Qe1hGxs1kh
	qxmx+2hu2IJbgoePvSN3TMsUCtwAG/HY9OpPfsu3dKQdq1IcTPBU47kaUf5PQQS/bo
	hdvN01IVldmeOFGzJ5zL1Y7PgSKB8MqUnmF55TyslvLAmv7I9jG3YPKl6qfp3VgpKS
	TfBLaQ1OPYu5xIPibq/TltM5ePFgjeJh83piqQo4Tqo6kNK8DMAPBeStHdTsq/bgMX
	kagAJ4xoMzJkGVWdaW3h6bhIJFnbs41VV6Kv2Me6EzReEhB+9GI8VNNyt9k28LmOap
	qtQsQbavHmzKePKVhXAscSXuZkDAjnRWNJUeBTonY1quaRiZY+K3DKHY/js9oEx3BB
	XrFWnvJymc4SGUwLljuZXKEUkHBpuWIy3nXWh0st+jQ7Fcb2KU1sSE6PBMdJjESgjY
	11lvfDvqjE5FfGSEwPaHRDYmzIcttgPMNvu/gp5tXpNM99vkP5FmAZjDK0LUVuqnZ4
	CBYpCJwFcx7pMfJ9tF0lRTkFM9/yyAtJ0TnsrrYl9YQ+8YGeODp0H4iVOzFsadjssc
	Sbv88W+/SgTrMIpL5wAwGpCM=
Date: Tue, 4 Jun 2019 11:37:55 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Paolo Valente <paolo.valente@linaro.org>
Message-ID: <20190604083755.GA2249@localhost>
References: <20190530132148.66500-1-paolo.valente@linaro.org>
	<83FEA552-5A4B-4A54-BBF9-2D88B4B6B11F@linaro.org>
MIME-Version: 1.0
In-Reply-To: <83FEA552-5A4B-4A54-BBF9-2D88B4B6B11F@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2] s-suite: push SRCREV to version 3.4
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
X-List-Received-Date: Tue, 04 Jun 2019 08:37:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 04, 2019 at 09:38:48AM +0200, Paolo Valente wrote:
> Hi,

Hi Paolo,

> anyone had time to look into this? Is the patch ok now?

it looks OK to me.

The delay is caused by [1], so don't worry if it takes until next week 
for a merge or reply from Khem.

> Thanks,
> Paolo

cu
Adrian

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/199871.html

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


