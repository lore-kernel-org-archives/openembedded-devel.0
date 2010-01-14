Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NVRPI-00013R-Re
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 16:14:47 +0100
Received: from [192.168.1.105] (e180144242.adsl.alicedsl.de [85.180.144.242])
	by drlauer-research.com (Postfix) with ESMTP id 7EF18584135
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 17:03:55 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.1001140946280.2804@localhost>
References: <alpine.LFD.2.00.1001140946280.2804@localhost>
Organization: Vanille-Media
Date: Thu, 14 Jan 2010 16:14:10 +0100
Message-ID: <1263482050.22868.66.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE/bitbake and python 3?
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
X-List-Received-Date: Thu, 14 Jan 2010 15:14:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 14.01.2010, 09:47 -0500 schrieb Robert P. J. Day:
> as i'm currently playing with python 3 but also digging my way thru
> bitbake, are there any obvious incompatibilities between bitbake/OE
> and python 3?  i'm assuming there is absolutely no guarantee that
> bitbake/OE will run under python 3.

Correct. I expect it to fail horribly. If you're interested in that, a
good first step would be to pass it through 2to3 - a utility from the
python community.

-- 
:M:



