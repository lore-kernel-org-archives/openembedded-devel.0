Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6C37F2B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 08:32:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46FF544c5Bz4q;
	Fri, 23 Aug 2019 10:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566549144;
	bh=61/xCluangSbBukGLpO+6SbJAzXz8UgIrmtHsDEiKXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+eY9qJSx+w5jKbSnRUfV7m2X07G0ubO39lzuRtrlaj3JK2tTrBqQVxV7Bn4jWI/M
	Hg8qzm+cunPXhBpKNTBM091spItRYuDPRgIT543iNGIKHSPmmWvq72BD+ZIy2B9/k/
	FQl2Vuess7zYNK8r1tQz/Oh00n1Jl7KexWNdTi5fKEiTnxYgscl7K8iO5IQ/BevBo3
	EmmDrLv++UfWTgylefZsdytqrJncE5R4aGdiQGlC9jGCxK16M+RmBWPINnZDKDPiIE
	KmYwRvUrmBCEG68/FeUptUz8tAzPdSiNuRACXqUEMesEmEUCCk2P9ebmj4Jfz9LBvz
	5+hJHm1svz9MTe6xB7x2xDKK3nTDS1sBWcFyhmKvoC2Bn1T30ZBDGWXCa3/+HZfyls
	GmueuaqKol7y30Am9/jEYwIGjGWnHwup1RTKloSxzP/mxZZ+oEZQ1kLpT5R2xJdnrj
	2uwisYF32UvKaxaRyps4iy5ay5Ln3ozDdN68xUooVYvTTOQilDQpdQkZgsnFuWkwSg
	OiPunjTT3oRvA7VYMu8PA4TxwbgRlaGrGjV4ZmnF+47w8GdNuhRCfhD/SrvV7PfH9e
	5RAWdgrZs/tufZhGEsrOVe4SoZZaXBQK2tNmKIxIYHBeaPfFPTbFox/mmHQRbGBH5m
	JZK67FRhiKW2chE3LHqcmgXU=
Date: Fri, 23 Aug 2019 11:32:21 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20190823083221.GA9224@localhost>
References: <20190821123824.17831-1-bunk@stusta.de>
	<53f16418-c309-9809-969a-faf81fb0c0a9@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53f16418-c309-9809-969a-faf81fb0c0a9@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkmanager: Upgrade 1.18.0 -> 1.18.2
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
X-List-Received-Date: Fri, 23 Aug 2019 08:32:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 23, 2019 at 04:12:25PM +0800, Kang Kai wrote:
> On 2019/8/21 下午8:38, Adrian Bunk wrote:
> > Remove a generated file with always changing hash from LIC_FILES_CHKSUM.
> 
> Why not just upgrade to version 1.20.0 which is the latest major release?

I was just doing the low-effort upgrade on the same stable branch,
if you want to upgrade to 1.20 then go ahead.

> Regards,
> Kai

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


