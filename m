Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MuB78-0000Mf-Bx
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Oct 2009 22:22:01 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B92CC11001ED
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2009 22:21:13 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E774311000D5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2009 22:21:12 +0200 (CEST)
Received: from rhein.familie-heinold.de (unknown [78.52.231.24])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2009 22:21:12 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 33B833C0FF; Sat,  3 Oct 2009 22:21:12 +0200 (CEST)
Date: Sat, 3 Oct 2009 22:21:12 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091003202111.GA4799@rhein.zuhause.netz>
References: <1254596456.4074.5.camel@ed-hp-laptop>
MIME-Version: 1.0
In-Reply-To: <1254596456.4074.5.camel@ed-hp-laptop>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: DirectFB problem
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
X-List-Received-Date: Sat, 03 Oct 2009 20:22:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 03, 2009 at 12:00:56PM -0700, ed wrote:
> I am building mini2440 using OE from Buserror
> http://bliterness.blogspot.com/
> 
> I am building the mini2440-image and the build completes without any
> errors.
> 
> When I run the command #dbinfo it crashes almost immediately.
> 
> 
> root@mini2440:~# dfbinfo
> 
>    ~~~~~~~~~~~~~~~~~~~~~~~~~~| DirectFB 1.2.7 |
> ~~~~~~~~~~~~~~~~~~~~~~~~~~

please notice we have 1.4.2 in the -dev trunk.

Bye Henning


