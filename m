Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0756FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 11:49:43 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1fX3UQ-0008AI-I1 for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2018 13:47:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 24 Jun 2018 13:49:35 +0200
Message-ID: <pgo0cb$u52$1@blaine.gmane.org>
References: <000601d40a1b$3af95300$b0ebf900$@freenet.de>
	<2ff043cb-2706-4e1e-82f7-54c8347769ca@skidata.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.8.0
Openpgp: preference=signencrypt
Autocrypt: addr=koen@dominion.thruhere.net; keydata=
	xsDiBEIE+IMRBAD9QYy9UMeJ4dIYQFTAYXRpzMQxTh1Tn7EeXVgi1A1LQps6g2F2Opg0gkuS
	pFsAnJWaEYphhIg5CuyDDk1AYH/PUiQp7oma/hlYoLoKe5nuQ3AY8DJnmA81IQmKQQRnE1t8
	lLja6kzx8RiCybKS19PCAitIzzQXst9ioRoyAE/fZwCgvdgJ52+LLgonoD7/xz50DNBr8YsD
	/AivFTC9QXeXxlw8fWWwlJXeuUXB+qDWqo4oE516uOk+SpsAzxr0AZxlNyONEjQ3xGW0CO2x
	s3lvdWuD/r6yGIpJDionAd6SA5GeRATtPJ3F+9JYHKbqESiyDpQCZmN9/8a8zk0mWmg0DjwR
	7yyOdvslAph0egv4Nd/ki/QqJMJkBADDTIpwtuPnSP8Sk374+e5jxLJJvhycD2WumPOtICTb
	P9SnMPlc2uW0QyIZnecegqaOVPEMwSOmldX2cqOAewpsOT1WgSnv/rkFcBkNWimJornmno5D
	NTNDNc9fxu3E4vC/qR9RZf89/13KMWtHQXTqvqPo+5xZ49iAItW+HC8v7M0qS29lbiBLb29p
	IDxrb2VuQGRvbWluaW9uLmthYmVsLnV0d2VudGUubmw+wl4EExECAB4FAkIE+IMCGwMGCwkI
	BwMCAxUCAwMWAgECHgECF4AACgkQMkyGM64RGpFGUgCfbw0AIjgkNEvdSbt3z1y89FsEakQA
	njMQZ6q/tkf2bvmYEG+x9SOeIarIzsBNBEIE+IMQBAD023653MUqxrPwp7RDMi/fHPKcZq+7
	N1fUhaDfVo3i+f5mgEzJPRRhGQRMncgtB2Hs9DP2HOM9RcoGnjnNRzMpUSMA60xf25MkKjeR
	6iZWkHIU3ifUfVfFWC6zcSLQ25cFRhWoT9jE2u2czdkpHPBMMpnNqjfgoZA8Uaw3HY2lEwAD
	BQP/RG8IFRtaRN2DsSrcWHVx/oO1TN7yeYStC0e/MDA89MLznxG6V4fhVdeiPMep3xVZmdTf
	ASPId6sXPMhHn5aGi8rtmABC26LGO7NTUs+5339HGBPtFstedE+M2cvT/BVg88SeWZkIS1kv
	3snth9MdAUIqmpyNqVeeKz4t3ZYVVUDCSQQYEQIACQUCQgT4gwIbDAAKCRAyTIYzrhEakZSZ
	AJ4ou/j26LVAtQAGkX6+vASKMJz/0gCgrAMvT2jpq2Mt0Hr+1ZqbD9N48fE=
In-Reply-To: <2ff043cb-2706-4e1e-82f7-54c8347769ca@skidata.com>
Subject: Re: yocto layer: meta-java
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
X-List-Received-Date: Sun, 24 Jun 2018 11:49:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: nl

Op 22-06-18 om 21:16 schreef Richard Leitner:
> Hi,
> please write problems to the openembedded-devel list so others may help you too.
> 
> On 06/22/2018 01:21 PM, Martin Junghans wrote:
>> Hello,
>>
>> I tried to build my own yocto image with the „meta-java“ layer, but it did not work.
>>
>> Could you help me to fix the error?
> 
> What branches for yocto, meta-oe and meta-java are you using?

When you say 'yocto', you mean OE-core, right?


