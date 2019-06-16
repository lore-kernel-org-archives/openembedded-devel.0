Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF647D00A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 08:24:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45RS6q4SfDz3k;
	Sun, 16 Jun 2019 10:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560673443;
	bh=vPYPJ//wL1dRR5WPjFycCED/4yG3iKowcOPydpyMsWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPv+/ko3Rgx996yLmF9TuDjHiOLt/jzC4igD9EROlRg91ubwNXAQ5N5gfrRJftPZG
	dmXJjc3rW8CUuf22dXD8tvUy/PoCX51SvDzUSD1igW2WVi1eCk9zAY26+cdnaZ/+tu
	6vZUxRzi15YIH9Q9cl8/Fr1WIdVCUQYU5UUoVs2lGWtMa9VFc3f8Y6B0/H+ln/44em
	c9Mw5RXdaVYZa3AI2Pn1R2Fy3anoDGCRJRUYrBFOjREpeZdRhBoHRazYac1hTFo/x/
	ZbU9RTN1DDOclQzWBJaXC1jxqFx/fpMi9wdnSPxyiPNed/VJxNTyccjP0qMrUvSZqS
	1zIuzVOhmJQgGGeDXaGCVIWsMKeDunu0toxZz/BzKwz0TbiPS4zmMLIXWM3O29tdGR
	GYVm8rqDHbM/FpTQGjiIt1LVruNuopYN/D7HvhMG22eEfXH5GOWdtsKfgl9ejuyFdU
	MikM4tL1rfIgGuO/U+7qQ1u2B+ydKYqyZjvWEEPNUUa0YV/xk8WOYOE260GFvm8PsA
	11Dtw8jhHJeuhYhVxtcI1QB6B2KRfGcRjqaVJo6Vb2UM/B4q42rngfLcHr9qOzZ8go
	4P0+YtuuEZ0hGq/CUrrTb5LWX1GK5fXrNLe1NyLDJ7M3C0YkfYATylBiknCMpJ537w
	pCofh/t3N4hbugj/gD94/BGo=
Date: Sun, 16 Jun 2019 11:24:01 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190616082401.GB2479@localhost>
References: <cover.1560620937.git.akuster808@gmail.com>
	<0fddf21a5d66f4c2103c7e9a6b1f40382ada9d68.1560620937.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0fddf21a5d66f4c2103c7e9a6b1f40382ada9d68.1560620937.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Warror][ 03/23] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Sun, 16 Jun 2019 08:24:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This was already reverted in master, and the dependency on 
virtual/kernel removed instead.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


