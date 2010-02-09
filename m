Received: from fmmailgate03.web.de ([217.72.192.234])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1NeoOR-0000GP-MM
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 12:36:38 +0100
Received: from smtp07.web.de (fmsmtp07.dlan.cinetic.de [172.20.5.215])
	by fmmailgate03.web.de (Postfix) with ESMTP id 41FB913D5D743
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2010 12:34:03 +0100 (CET)
Received: from [79.215.2.96] (helo=merkur.sol.de)
	by smtp07.web.de with asmtp (TLSv1:AES256-SHA:256)
	(WEB.DE 4.110 #314) id 1NeoLz-0001fI-00
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 12:34:03 +0100
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1Neo8y-0002X6-Ro
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 12:20:37 +0100
Date: Tue, 9 Feb 2010 12:20:36 +0100
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209112033.GA9723@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4B701EA0.5090304@dresearch.de>
	<20100208163520.GA7674@merkur.sol.de>
	<4B713BA2.7020404@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B713BA2.7020404@dresearch.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: tux-master@web.de
X-Sender: tux-master@web.de
X-Provags-ID: V01U2FsdGVkX19WwwUsg013c9VUwo4P4Eodq8UKCMV0zIsuyjC/
	Z/h9n0QetxeAfBz4vDpsr+b3I5M4lBqeX6IWTGCYqt95FDHy57 qOs0DPD38=
X-SA-Exim-Connect-IP: 217.72.192.234
X-SA-Exim-Mail-From: tux-master@web.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: configure failes for mc-4.6.2-r4
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
X-List-Received-Date: Tue, 09 Feb 2010 11:36:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 09, 2010 at 11:40:34AM +0100, Steffen Sledz wrote:
> Jens Seidel wrote:
> >> ERROR: function do_configure failed
> >> ERROR: log data follows (/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/temp/log.do_configure.3914)
> >> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint
> > I wonder about the "not using Gettext" but the problem is probably
> > "--exclude=autopoint".
> 
> Sounds good. Can you try to create a patch?

I'm capable of it especially releated to autotools+gettext and git. But to
be honest I never used bitbake up to now and I'm just lurking on this
list because I own an OpenMoko mobile which distribution uses OpenEmbedded  :-)

I will try my best but I cannot promise anything ...

Jens


