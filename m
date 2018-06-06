Return-Path: <gcho-openembedded-devel@m.gmane.org>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jun 2018 10:10:57 UTC
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id A319D74C63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 10:10:57 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1fQV8S-0001Rx-DT for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2018 11:53:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 6 Jun 2018 11:55:49 +0200
Message-ID: <pf8av2$tp5$1@blaine.gmane.org>
References: <CAKpvFF1BbLmk4yhas7BRcN1e3tX1AcyGbOs0EpNcxE+kBtdX-w@mail.gmail.com>
	<20180606081240.6178-1-pn@denx.de>
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
In-Reply-To: <20180606081240.6178-1-pn@denx.de>
Subject: Re: [PATCH] Adding support for xscreensaver-5.39
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
X-List-Received-Date: Wed, 06 Jun 2018 10:10:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: nl

Op 06-06-18 om 10:12 schreef Parthiban Nallathambi:
> - This patch enables the support for xscreensaver 5.39 version
> - xscreensaver.service created for the system with systemd
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>

> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Xscreensaver service
> +PartOf=xserver-nodm.service
> +After=xserver-nodm.service
> +
> +[Service]
> +ExecStart=/usr/bin/xscreensaver

That's a hardcoded path...

> +Environment="DISPLAY=:0"

> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> new file mode 100644
> index 000000000..6b17f9b09
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb

> +do_install_append() {
> +    install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
> +}

...which you'll need to fixup here


