Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 153327F33A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 05:27:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 463xhN2PkSz3J;
	Thu,  8 Aug 2019 07:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565242036;
	bh=rhXx7aqqKHhTjWJGbkmBmmbhq/eBUE4vEkYZV+wbXp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrfGMPQ1iTd+F+V995C2eH6DVKYMSsDkEetD+8LoLOmRJWpWDpLv9hDF3DAKZiSe9
	wDiR17akCBrpxM348w7YCfJljOJyRHrkQgwQxQRGnqT31rmP8r/hGOahEbRfRTBH+5
	GSga1bPk3/cRcqzofkBcpq3CX8I4MnCLsjojOcZq+jQgCagenXUN6PazxBZkO9gFZ7
	dTizh/SWuToh1W536XkS+4K1gzHF5uQtCj36ZeFcWr2FORw0oWLiJE8OMpP573jgyy
	j9KKCadd9Cc+ESiXRLFkvYFvcSjusChla/asytLOxn3TbLyn+x21OhQir3VU6J0VQs
	6MVrmhm4z6VSywm7uit8Dbm1KNakoQ1d61q6WhHa5ulCfGp6osGMR0eL37RD6qn5fu
	SUeckZPwmSR/gyh+Oi8f7ZwvrSt6EO8ucWsY7yn3qNKYKQxQYhvqwvR98B5LSb3tRe
	oFElRUWzhDD5ySpprQJBYLZcX+I7TSo2nWHfLYt+v7MlltR+PIe/OrNLPT+Lx62vVo
	NZ4zChIifWv0mguxPpFFu8W6G/xC24OQ3Cmiqu0UI+sefCAKrdU3Vpb/eDZ/aR+bNH
	KC/Re5BmmB2UYhnnLECZge5w/MfqY0QeEx90GZs3jlRL+g/7nQDRfuibKHuafqBtxi
	XKFGS5LDHpsXshiqIBj/bQcg=
Date: Thu, 8 Aug 2019 08:27:14 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190808052714.GA27264@localhost>
References: <1565263453-52779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<134762b5-0997-950d-e47b-3fda6e6c885e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <134762b5-0997-950d-e47b-3fda6e6c885e@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][patch v5] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 05:27:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 07, 2019 at 09:29:24PM -0700, Khem Raj wrote:
>...
> On 8/8/19 4:24 AM, Zheng Ruoqin wrote:
>...
> > diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
>...
> > +SRCREV = "31d6866d5eda02be9a6bfb1fca9e9095b12eecd1"
> > +PV = "1.0"
> 
> Drop PV
>...

This is needed when the file is named _git.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


