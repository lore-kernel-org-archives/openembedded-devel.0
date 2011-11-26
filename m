Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1RUPkx-0003ZJ-WA
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 22:25:57 +0100
Received: from myhost (188-192-193-31-dynip.superkabel.de [188.192.193.31])
	by dd20204.kasserver.com (Postfix) with ESMTPSA id 1E2C912A053A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 22:10:53 +0100 (CET)
Date: Sat, 26 Nov 2011 22:12:24 +0100 (CET)
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
X-X-Sender: nice@myhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4ECD65FC.7000104@balister.org>
Message-ID: <alpine.LNX.2.02.1111262202210.1115@myhost>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<4ECD65FC.7000104@balister.org>
User-Agent: Alpine 2.02 (LNX 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sat, 26 Nov 2011 21:25:57 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Wed, 23 Nov 2011, Philip Balister wrote:

> At some point it needs to die/go read only.
>
> But, until oe-core + openembedded can replace it, we need to be able to
> do minor updates to support already deployed systems.

We need to rewrite the getting started wiki page [1] to point to oe-core. 
It still mentions oe-classic which confuses new users. Also the main page 
should make it clear that oe-classic is going to die and new projects 
should use oe-core. In my opinion this will help new users more than to make 
oe-core read only. Some warning message when bitbakeing something 
with oe classic would also be nice.

1 http://www.openembedded.org/wiki/Getting_started

Best regards,
Bernhard


