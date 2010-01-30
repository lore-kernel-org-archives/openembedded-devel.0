Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NbGdN-0006KR-MT
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 17:57:24 +0100
Received: from [192.168.0.5] (e180161075.adsl.alicedsl.de [85.180.161.75])
	by drlauer-research.com (Postfix) with ESMTP id D98A3584116
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 18:47:39 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hk1n4n$vao$2@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk1iso$j38$1@ger.gmane.org> <1264865833.18482.56.camel@mattotaupa>
	<hk1n4n$vao$2@ger.gmane.org>
Organization: Vanille-Media
Date: Sat, 30 Jan 2010 17:54:59 +0100
Message-ID: <1264870499.31614.17.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Sat, 30 Jan 2010 16:57:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 30.01.2010, 17:35 +0100 schrieb Koen Kooi:
> >> I vote for leaving it as it is, it gives some credit to where it
> >> originated from. The image name already has been forcefully renamed to
> >> strip out 'angstrom' so lets keep at least this bit of heritage.
> > 
> > I think the VCS (Git) is a good tool to find out where something like
> > this originated from.
> 
> It isn't when people copy stuff to overlays, or just blindly copy it
> into other files.
> 
> The angstrom core developers already have a betting pool on how long it
> takes for kaelios and minimal to copy newly committed changes from
> angstrom to their distro configs without credit.

At least for the minimal distro you can say that, but it's not true. I
won't bother now to get you the commit messages and the actual content
in the files (sane-foo.inc), but it's pretty obvious that I gave mucho
kudos to Angstrom when I synced minimal with it.

-- 
:M:



