Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OTDrZ-0007gA-6k
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 14:55:01 +0200
Received: from [123.192.240.117] (unknown [123.192.240.117])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id D52051B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 12:51:52 +0000 (UTC)
Message-ID: <4C289A86.5010508@freyther.de>
Date: Mon, 28 Jun 2010 20:50:14 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.4) Gecko/20100624 Fedora/3.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C289700.1000409@jak.nl>
In-Reply-To: <4C289700.1000409@jak.nl>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FeeBSD as OE build host
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
X-List-Received-Date: Mon, 28 Jun 2010 12:55:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/28/2010 08:35 PM, Arjan wrote:
> Hello,
> 
> I read here
> [http://wiki.openembedded.net/index.php/OEandYourDistro#FreeBSD] FreeBSD
> was/is supported as build host. Is this still true?
> Are there pitfalls or other prerequisites beside the ones mentioned?

I haven't tried for quite a while so there might be some more issues
again.... The most common thing is replacing cp -a with cp -pFR (IIRC).


