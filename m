Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N7fwk-0004iK-TW
	for openembedded-devel@openembedded.org; Tue, 10 Nov 2009 02:55:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAA1oiNp022694
	for <openembedded-devel@openembedded.org>; Tue, 10 Nov 2009 01:50:44 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j1ENkEGxdSxb for <openembedded-devel@openembedded.org>;
	Tue, 10 Nov 2009 01:50:44 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAA1oeuE022669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Tue, 10 Nov 2009 01:50:42 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hdaeo3$9l5$1@ger.gmane.org>
References: <1257762970.29038.40.camel@dax.rpnet.com>
	<hdaeo3$9l5$1@ger.gmane.org>
Date: Tue, 10 Nov 2009 01:50:16 +0000
Message-Id: <1257817816.29038.153.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM - Summary of some the outcome
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
X-List-Received-Date: Tue, 10 Nov 2009 01:55:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-11-10 at 10:13 +0900, Rolf Leggewie wrote:
> Richard Purdie wrote:
> > too large. Since there are six candidates this means that we need to
> 
> Who are the six candidates?  I can't find their names in the wiki or
> elsewhere easily.

They are listed in the wiki, albeit with a title that could be better:
http://wiki.openembedded.net/index.php/Oedem/2009_TSC_election

> > We have the 1.8.16 release (1.8.14 was a mess, sorry about that) and we
> > agreed we should bump the minimum version requirement in OE.dev so we
> 
> It would have been nice to make sure that Debian actually has 1.8.16
> before making it a requirement.  I prefer to use packaged software so I
> can worry about other things.

That is unfortunate but I suspect if we waited until everyone's personal
favourite distro adopted it, we'd impose artificial limits on what is a
development branch. No easy solution really :(.

Cheers,

Richard



