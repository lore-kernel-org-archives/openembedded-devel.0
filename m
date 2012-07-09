Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SoGcy-0003UK-Fc
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2012 18:16:00 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id AE03BD2326; Mon,  9 Jul 2012 18:04:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id DAB0BD2323
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2012 18:04:24 +0200 (CEST)
Message-ID: <4FFB0104.6060702@linaro.org>
Date: Mon, 09 Jul 2012 18:04:20 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120620 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CADZ6=avV5=3g9CkMMDc9cKLUpw_-Bk_q7fb5MceJmtR0gH6YvQ@mail.gmail.com>
	<20120628174041.GB24537@localhost.jama.net>
	<CAMKF1spLCxsBLtUKpFzF18xM3Wa7FNTRiM8BCX-V0EmdbGUPPw@mail.gmail.com>
In-Reply-To: <CAMKF1spLCxsBLtUKpFzF18xM3Wa7FNTRiM8BCX-V0EmdbGUPPw@mail.gmail.com>
Subject: Re: meta-oe breakage since oe-core removed gcc-4.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 16:16:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 29.06.2012 02:24, Khem Raj pisze:
> On Thu, Jun 28, 2012 at 10:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> khem's patches which removed it from oe-core said:
>> gcc-4.6: Retire into toochain-layer
>>
>> so I guess he has some patches adding whole recipes to toolchain-layer
>> (I had a feeling that I've even seen them somewhere, but cannot find
>> them later).
> 
> the patch is here
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=kraj/move-gcc-4.6
> 
> Koen
> 
> Please pull it

+1 from me as it makes use of meta-linaro layer much easier.


