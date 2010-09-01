Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OqwOS-0003ZX-LY
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 01:07:01 +0200
Received: from [192.168.1.2] (e180147196.adsl.alicedsl.de [85.180.147.196])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 94A31584122
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Sep 2010 01:11:16 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikGdRbLuVujasDCgu2eiyn0VCVCbjXjRo8Zv1xr@mail.gmail.com>
References: <1283356972-28880-1-git-send-email-noor_ahsan@mentor.com>
	<AANLkTikGdRbLuVujasDCgu2eiyn0VCVCbjXjRo8Zv1xr@mail.gmail.com>
Organization: Vanille-Media
Date: Thu, 02 Sep 2010 01:05:07 +0200
Message-ID: <1283382307.2012.20.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sip-native: Run oe-stylize script on the recipe and modify the recipe accordingly.
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
X-List-Received-Date: Wed, 01 Sep 2010 23:07:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 01.09.2010, 21:41 +0200 schrieb Frans Meulenbroeks:
> Mickey can you say something about this recipe.
> It is from 2008 and has DEFAULT_PREFERENCE = -1

sip is sip4 and has never been tested as extensively as I have tested
sip3.

> pyqt seems to depend on this recipe

Yes. sip is 'a sip of swig', a preprocessor to create Python bindings.

> and there are also two sip3-native recipes. Could not find a user for this.

PyQt3 used to depend on it and I used to maintain PyQt/Embedded for the
Zaurus and iPaq many years after the original author lost interest
(Sharp actually stopped paying him to do that, but that's another
story). Since 2007 I no longer use it though and since there have been
so many changes in Qt and PyQt, I'm afraid I don't know about the state
of it in OE.

Cheers,

-- 
:M:



