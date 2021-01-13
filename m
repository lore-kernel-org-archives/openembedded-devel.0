Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web08.6647.1610536643282937863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 03:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=Y8oIVCWm;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [IPv6:2a06:4004:10df:1:da27:a6d2:5305:fd0a] (_gateway [172.21.0.1])
	by first.geanix.com (Postfix) with ESMTPSA id 2F9034E3431;
	Wed, 13 Jan 2021 11:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1610536639; bh=vgR3MsPEJFM+ddZ8KmekKMNwQ7/6yKQEnwLa/IZYI80=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=Y8oIVCWm5MNwwsZy1wBL2CiV9goZCeh1cTwFK+njXq0DR+FVI9GJmE8Zz8heU5Ooz
	 YDWoD1gbOs+0vzsTADXLCpuWfyCFeHAeyTnrIZPqgDXlYSqoh5EfOhyZJ8++AgRgdq
	 NfvV1kHVmkqweQreeZP0906g6M1AtY/obLJZiWU0TOO1VCwyd6JqxaisFn+Zk1pbWG
	 G+L2CHHO7+4D5U1GPLTvIKWpLf5Zl/q7GYLIg/0uDawpy+C2bNAB8K94DM8fvNm9b6
	 TUPEMyDGQ5+Rl/XXwQuDpzz41H7MJqrYz18BkSpbo9RrUrUTlJC5xkks6BFAVUXSCc
	 Hig5OPyeORsCg==
Subject: Re: [oe][meta-oe][PATCH] nodejs: 12.19.1 -> 12.20.1
To: akuster808 <akuster808@gmail.com>
References: <1657E928CD7141E1.31350@lists.openembedded.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: "Sean Nyekjaer" <sean@geanix.com>
Message-ID: <94ad4923-4ca3-c143-4f22-ce0e95860726@geanix.com>
Date: Wed, 13 Jan 2021 12:17:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1657E928CD7141E1.31350@lists.openembedded.org>
X-Spam-Status: No, score=-1.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	PDS_TONAME_EQ_TOLOCAL_SHORT,URIBL_BLOCKED autolearn=disabled
	version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on ff3d05386fc5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/01/2021 10.28, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Hi Armin,

Is this a candidate for gategarth?
It's a stable bump in their LTS branch.

/Sean
