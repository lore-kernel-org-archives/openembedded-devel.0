Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E8C2C7D69E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:10:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z0N95pn6z5l
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 15:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557234650;
	bh=uzgXgSdxOD/f3TlQ7KzpIXTO/UDgd68UeOicOtQo8ZY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=IDyUge177wKzfsK8l+gTIzRFb2WNMDaNkc0o8alFDxVmsAGa2mLoRFbywx3JBfDwZ
	5EapmHHYGQksmT6xP9aav82qYZQQx+/Z+nuPEWdpTGDmQH07jE5JeCu8DVTnXNehAu
	YP5oSdChj4QiYLyDjOqFG1bNFndbUIxtoa4H1wVVwYavZ3WOFd7JZVtaJmYXpkGUVR
	+MgRCHsT6p683KKcHnT7QkA3Q/KjoGpTFrQL/hFAkGVkN27izY2ie3VRtogfXJ6Gxj
	MomC9USm1ZZvzk5uwmAnPsURVZmbwBskjED+olcHyn3DQ8F+ED4ihgbmlzjkNHCrOF
	CMgHelOIeFaYmXKU993zejxK8wO86RySlu5ZfTYmJqYm6bttj6okmgFUK9wqk1rWr7
	mmZk4/otVOsb/J9lIa3iop2fEKHFH2RnyKkZXqKEs2hTnPWml00er19bW+RlvpTgow
	pwpCM01e0keyH8iJN9WuGQNcv17AaZ3Wy/kwSBBtkEsN1QMab8nDb9ha0sl2zU+ySr
	p2nHu1FNn8c/6K8Y0/WxyB/GjNYxs7PNxQ54KrXzTU0V0GodF5t1GCjfZYczAnq/De
	/7FRjg1qPzyP7TV7CDmr82e5KbvTAxmNyNYzkwwYcl3lDDMp5etvPDodjXO7rrA1bh
	+roD5fqzrWNogGukeUGIcQTY=
Date: Tue, 7 May 2019 16:10:47 +0300
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20190507131047.GA7705@localhost>
References: <20190507115630.30368-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190507115630.30368-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [meta-oe][PATCH] gnu-efi: Remove support patch for gcc < 4.7
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
X-List-Received-Date: Tue, 07 May 2019 13:10:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Just noticed all these went to the wrong list, resending.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


