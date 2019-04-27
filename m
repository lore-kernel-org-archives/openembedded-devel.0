Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1430A7D8F3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 18:26:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44rzsT6vgrzB7;
	Sat, 27 Apr 2019 20:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556389614;
	bh=tm9I8Qlws3flcK1+Jg8hvglHTbnNNV4oDWs4GsmWIhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTJChMVPPA2lTWRU1LQi7KH6yyFjxARklzv0EH4WJnDMRt7Sr7Evhfk6buprpml3A
	rdWDtrER7bX/YXqnuufguIQS1TpChPb389ssC3zztz57njpPNl/GhHiy+PNA9l5gil
	rhIWDHBIiTD1y9EmRVgvVly/vZW2QT1i6RyLZJacX349b1D4NfCAvbkwPAeUaN9rxY
	hrm3KS0BCG0BysSIhO9pRTlM0yiaLZ4Uyt58vXrg3f+rxA2x6eX0fYnVvdLlBDXXea
	xCsZ6ZpaQZe04enjWPE4l3+6EIPH6akbKYAUbznBBiKHfKBKskztDeNPEKGONSgT4F
	u7IZvl+9m34RKHA+Oxa7ktP20FZSnRLI6ARB/6iRBEvkvq1do98Mv/ug6VZwDO0/rE
	qs0MOJQvnaTVe04QHAeVG2tAU5SCl3ngADsDp7gmqjVuFCd0v2ggM1qcL16a0G2wx5
	Ka4d03R5EaDhhoxL9I1PqVq+tFBTJbLEAW7aHKxFHQQW9A9exp95xlSsvvjYnJuhWw
	RBY09224SpSKyBqkeZNI2ec0YQcSFQD/0oYV6PaZ/pB2hqAcUdg1gq2d7NfORwYyt0
	tu700glkDXFg5KA2iqKTElicYbGtGQTCbMIe+xqej8PCzTU8JNdMKq7Y5aF7ciV/9g
	avdcitgcl151+RFkyN5hGgyI=
Date: Sat, 27 Apr 2019 21:26:51 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Message-ID: <20190427182651.GD10144@localhost>
References: <20190418153432.16745-1-beniamin.sandu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190418153432.16745-1-beniamin.sandu@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Sat, 27 Apr 2019 18:26:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 18, 2019 at 06:34:32PM +0300, Beniamin Sandu wrote:
>...
> --- /dev/null
> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>...
> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
> +SRCREV="61a28c2ee5e60132f26725583b66c1cf8214bb78"
>...

Has 1.9.2 even been released?

This looks like a random git commit some time after 1.9.1 to me.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


