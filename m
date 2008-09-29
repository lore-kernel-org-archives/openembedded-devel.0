Received: from [80.68.93.111] (helo=cassiel.sirena.org.uk ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1KkKVp-0002Jz-M2
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Sep 2008 17:18:13 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.63)
	(envelope-from <broonie@sirena.org.uk>) id 1KkKRy-0003F1-JW
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Sep 2008 16:14:14 +0100
Date: Mon, 29 Sep 2008 16:14:14 +0100
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080929151413.GI27647@sirena.org.uk>
References: <200809272237.22810.zecke@selfish.org>
	<48DE9EE0.8090000@balister.org> <48DEA994.2030607@gmx.de>
	<48DEAE43.5090407@balister.org>
	<87od299ptz.fsf@neumann.lab.ossystems.com.br>
	<20080929124518.GE27647@sirena.org.uk> <48E0E408.80805@klever.net>
MIME-Version: 1.0
In-Reply-To: <48E0E408.80805@klever.net>
X-Cookie: C for yourself.
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk);
	SAEximRunCond expanded to false
Subject: Re: git conversion and what is missing?
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
X-List-Received-Date: Mon, 29 Sep 2008 15:18:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 29, 2008 at 04:19:52PM +0200, Michael Krelin wrote:
> Mark Brown wrote:

> >>Yes; it is used during conversion to properly set commits to the right
> >>author names however I believe we can't hold it forever. We need to
> >>set a deadline and if someone didn't fill it... so sorry. 

> >If they miss the deadline they could still be added to .mailmap later
> >which would fix up most of the interesting cases (eg, git log output).

> That should've been "we", not "they", no? :-)

>     ""                   : (["broonie"], ""),

Hrm, looks like that was me.  No idea why my e-mail address got dropped
from the commit...


