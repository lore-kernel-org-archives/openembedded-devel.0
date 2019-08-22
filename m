Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 172737E58B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 06:11:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46DZ1F5h2tz4q;
	Thu, 22 Aug 2019 08:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566454306;
	bh=tgWERsC9vuWy3Ws9HQR9qfSXn+5EU7SHKHaiI31EpOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pHU/lwomaD5c5UygGvuqF33T7SRhs0hGkxfVCuLV2firr03OYRo+TPvFVWQgFNzHg
	PXyTdqR5nEf+vub3QVHrS2y95DoBnjvWKkIVWzIPFay1qo8wdoGL67k3S68byHek5d
	bvNBGIzUWkhmPdftimxsOVAE5A+xUSZbBROiFW1EsKpKTq6plfaW6QG757lkwJTWTO
	dmtxZE8LyEwcoBNIPuIHdyeJJ4aT+bsW5z6bi1d2HapPCAgXOMIcSwQ44/k+Xrz5bM
	B3guWGdWeNE1K23fEzPcTaW/OfX8tXkjp2FRLuygqHInNEqF0PQr0NufzZht8xS99T
	NaJEYBscT50Reph9RzIcBb+i/XTwQ+2+9bCwHMqJMrnoye/T1igHOFs5+RE7qzvUGz
	xfR5sT0z67WaAuglFYTLB7iBPQtzT7CqYlTFXF5C4P8kyI0qYyfEWQMoig5qlR2czv
	5+dsaDox27w64ipkH2Q0Ksw5fkJmzVbm5fO7kbcJaqBKvlrawgrk8Lg1XUChX+9FL4
	5VM0vxrmZDPPKD3YZr8H8L0JPhPl1LqV+oskR41qePNg1FoQEm6RE4DoOErdWUWe/3
	wrDIOsLnxIMbdyneqnLWP2/u2b4z4363b1itatutN6ti9zF6eX4bzz6Me9v1IXN8Qk
	PHJjqEzVFnaGPiZaTkrYzJyI=
Date: Thu, 22 Aug 2019 09:11:43 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Piotr Tworek <tworaz@tworaz.net>
Message-ID: <20190822061143.GA11915@localhost>
References: <20190821184927.3393-1-tworaz@tworaz.net>
MIME-Version: 1.0
In-Reply-To: <20190821184927.3393-1-tworaz@tworaz.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH v2 3/3] evolution-data-server: Update to version 3.32.4
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
X-List-Received-Date: Thu, 22 Aug 2019 06:11:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 21, 2019 at 08:49:27PM +0200, Piotr Tworek wrote:
> This is the latest stable upstream release. Unfortunately the package
> needs a bit more than a simple version bump to be in a good shape. The
> list of changes includes.
>...
> This patch also performs a lot of other smaller cleanups like:
>...

It is very hard to review when there is one huge patch doing many 
different things.

It would be easier if you could submit such changes as patch series,
e.g. one patch for each of the 4 major items in your list plus one
for the smaller changes.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


