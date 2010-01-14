Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NVQ80-0005lt-NL
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 14:52:51 +0100
Received: from [192.168.1.105] (e180144242.adsl.alicedsl.de [85.180.144.242])
	by drlauer-research.com (Postfix) with ESMTP id 248DF584185
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 15:41:59 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <himn94$8ui$1@ger.gmane.org>
References: <hill5g$ll0$1@ger.gmane.org>
	<1263426466.457.286.camel@lenovo.internal.reciva.com>
	<1263427123.15954.6.camel@dax.rpnet.com> <hilp2s$ag$1@ger.gmane.org>
	<himn94$8ui$1@ger.gmane.org>
Organization: Vanille-Media
Date: Thu, 14 Jan 2010 14:52:14 +0100
Message-ID: <1263477134.22868.65.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Sane default for SPLASH
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
X-List-Received-Date: Thu, 14 Jan 2010 13:52:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 14.01.2010, 10:14 +0100 schrieb Koen Kooi:
> NAK, the needless SPLASH -> BOOTSPLASH will create too much work for
> people to catch up to, and it messes up the docs on the subject.

Could you expand on that reason? I find the patch quite a useful
refactoring. If we don't allow patches like this going in, we're
doomed into living with misnomers forever -- and we all know that
there are quite a few in OE metadata.

Cheers,

-- 
:M:



