Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3E97F148
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:33:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45z3Xb488Hz3J;
	Wed, 31 Jul 2019 08:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564554815;
	bh=zP2ka8qznEhqZZYPEbmYbA7f/8bhptxa04VA2RBzPMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEnguZZDI1UyDe1RQIYHO43YE6CtJraM115Z70MlQeTwo5YZ/FuTv0KcT3Ar60mii
	hJLORImyAjDyb+win6L65IneaRHS+RA1eSzH4xXvkcQEUKhwhca9PSUA/alx/+YF4o
	+17BDEZ3oT7ba0uA7SaEMpccx/X2J70mUIvFym9CtIHPwFhcsF18yCLyT92DM6TzvP
	zIafmN6HJ0cO8VX+gXNCmYm1gr9pUR7F2r7qlxxSBr9byOl7E52DH1ZbDA7Jfw/qQO
	7diE/g8eTU4wPQ1D/voXCBg2GvFvtxTE45pcMvyfcUngvaPmwy5iSJ4X1YzyM1ipwY
	gTOk8DospP1F74nhOi6Y8X/5CZXVr/4/f76hlJK9G245CWiR/SLa1w4zgh6Orx9Lv5
	yJnXaYmMe79pEQpEhhJaoKsJRlH0iDpr2ZV3KFuOLb4ptJ4hODHYWUHuKMupSj4HYa
	0s6P9Czs9PW10yBR9J6x5h0+FGhsRM2EpV2rDdaEA5QBCo44uebpvgCfYwIVSPeuA0
	HRUlayiNhgWcfetaUA8uwG1VKP8I0ddFG62wlWwsFk2GWhp2b+AtRJOQxjdeAl7Do/
	IkXrXDVd1X9KIpO7DCHMRQIG9KxEXWdV3tZtYv+f2y42/nzjdC0f5IqjiXVoGpjcZI
	5/CT6fXmASa0KHOByQitfe5o=
Date: Wed, 31 Jul 2019 09:33:32 +0300
From: Adrian Bunk <bunk@stusta.de>
To: kai.kang@windriver.com
Message-ID: <20190731063332.GA1647@localhost>
References: <20190731061107.129941-1-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190731061107.129941-1-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] poppler: 0.75.0 -> 0.79.0
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
X-List-Received-Date: Wed, 31 Jul 2019 06:33:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jul 31, 2019 at 02:11:07AM -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Update poppler from 0.75.0 to 0.79.0:
> 
> * remove patch which has been fixed in upstream

The upgrade was already sent and is now on master-next
(submitted by Randy MacLeod).

> * correct the way to toggle gobject-introspect support respect to
>   variable GI_DATA_ENABLED
>...

Looks good to me, can you submit just this on top of master-next?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


