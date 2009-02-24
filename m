Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lc5do-0003qr-Vn
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 23:20:41 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090224221729.COUV12540.fed1rmmtao106.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 17:17:29 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id KyHU1b00T4dMFYL04yHUlD; Tue, 24 Feb 2009 17:17:28 -0500
X-Authority-Analysis: v=1.0 c=1 a=9sSjY8p1AAAA:8 a=AeKYS2zqAAAA:8
	a=tpz1cC5Z9nlbIzVaTuEA:9 a=zQU7BFIr1pHPjUm0H80TTaEsivUA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 24 Feb 2009 15:17:28 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090224221728.GO2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<49A4203E.3060202@balister.org>
	<59251.AFRWVFwAXS0=.1235513405.squirrel@webmail.no-log.org>
MIME-Version: 1.0
In-Reply-To: <59251.AFRWVFwAXS0=.1235513405.squirrel@webmail.no-log.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 22:20:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 24, 2009 at 11:10:05PM +0100, GNUtoo wrote:
[snip]
> *security: that is also very important as threats are growing:
> **nasty threats are growing(at least that's what I heard in the press)
> such as computer infections(malware etc..)
> **intrusion into citizen's computer by the state is legal in some countries:
> http://yro.slashdot.org/article.pl?sid=09/01/04/2042242
> **sometimes distributions repository get compromised
> http://www.vnunet.com/vnunet/news/2224622/red-hat-admits-getting-hacked

This is exactly why I think we should drop what we have now.  If we want
security then we need to do something like verify the signed md5 (or
sha or what have you) that projects that care enough to do it provide.
Otherwise it's a false sense of security we've got.

-- 
Tom Rini


