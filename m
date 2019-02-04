Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB5B7C039
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 22:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43thpR0WGlz4d;
	Mon,  4 Feb 2019 23:14:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1549318495;
	bh=9Hrr1llIHxfq3iYPlED/VT1nnt0rtzKQ0fyuvw5Kxh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kkN8sSBq/JDNkLHI7Y7I4U6z6xzX9p1fOsTLHVJofNCHhsDGg0bs+uRiTA8KV0wz8
	PdLZgFato4576themA4W5jjsKii0S3yfZCgpPm2oYunlqnrsqlnp64oHf8MqtmoFoL
	3zvLdZUFYQwWELbHBy0YZ/RkzeduNeoD6njjjHL9bK0gl8HGCxJAu+/bvSEcBagpNA
	6k94N01R2qwr5/92YhRc9aEC8+QgSqfPsgJmm6JRzZAVXf3XJ/FrgasT7K+RMpGF0B
	7Yj/BvBfnwEkWFRnRwzO/TDONUKj2ak+EiuxXVI0Q9/RbAk/Vkp63/Tm+CkhnmSipH
	6c8cLrzoa73HR5xAmTq139uQybsRpV84sX5vfHSBMfXU12ly+sG9amRLLmD1GjcOSG
	2GvR8y1yG2vmvq1Ef9b1DXVtNXR86asOwSRNoGLMl1HT9st/Z9yjR4ueZcSq4rnvbq
	15Gm4HfYd4OaubYz6UP0VUKZfqPg+dmDlHFEB7jruVGHyElu9oc0mkCIfpWund5IPA
	ymxl2YZjYG0pURVNYDD/6DTOaBqMNfQrPIxy9D4aAwm2hTs9YLXB1Af+Yb2jCQiqvN
	ADPfZM4Ijh7nwFeEOCZOZCLoHhPdbvifcBZfhxfHzBCZeAXZMjL4pvFEizmwQYM1ZR
	X9QFHRrSKpyiWbxRciwkQyOg=
Date: Tue, 5 Feb 2019 00:14:53 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Philip Balister <philip@balister.org>
Message-ID: <20190204221453.GE17997@localhost>
References: <20190204145940.17783-1-bunk@stusta.de>
	<a8c5c5d2-886e-5689-2a43-b4615df3a0bf@balister.org>
MIME-Version: 1.0
In-Reply-To: <a8c5c5d2-886e-5689-2a43-b4615df3a0bf@balister.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][thud][PATCH] Add czmq (C bindings for ZeroMQ)
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
X-List-Received-Date: Mon, 04 Feb 2019 22:14:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Feb 04, 2019 at 06:23:05PM +0100, Philip Balister wrote:
> How are zmq bindings versioned? Just curious why this has a different
> version to:
> 
> http://layers.openembedded.org/layerindex/recipe/28410/

These are different bindings (C versus C++) maintained separately.

> Thanks,
> 
> Philip

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


