Received: from firebug.buglabs.net ([66.80.197.243] helo=looper.buglabs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@buglabs.net>) id 1NPLkt-0007ZR-Tn
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 20:59:55 +0100
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by looper.buglabs.net (Postfix) with ESMTP id 62E2C34047
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 14:58:00 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by aphid.buglabs.net (Postfix) with ESMTP id 05C3A28E002
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 14:58:22 -0500 (EST)
X-Virus-Scanned: amavisd-new at aphid.buglabs.net
Received: from aphid.buglabs.net ([127.0.0.1])
	by localhost (aphid.buglabs.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yi--KA6Xa5nb
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 14:58:21 -0500 (EST)
Received: from [192.168.0.120] (t61.buglabs.net [192.168.0.120])
	by aphid.buglabs.net (Postfix) with ESMTP id 63DA128E001
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 14:58:21 -0500 (EST)
From: Ken Gilmer <ken@buglabs.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.7.1261738801.28559.openembedded-devel@lists.openembedded.org>
References: <mailman.7.1261738801.28559.openembedded-devel@lists.openembedded.org>
Organization: Bug Labs, Inc.
Date: Mon, 28 Dec 2009 15:58:06 -0500
Message-Id: <1262033886.7911.43.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.5 
X-SA-Exim-Connect-IP: 66.80.197.243
X-SA-Exim-Mail-From: ken@buglabs.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Eclipse tools (OTE) wiki page complete.
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
X-List-Received-Date: Mon, 28 Dec 2009 19:59:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Hi Frans,

  Thanks for taking a look at OTE.  Yeah, I've had the same problems
with installation in the past.  The Eclipse update system can act
strangely, and I do not know why.  My suggestion is to make sure all the
latest patches are in place and try to install again.  You can do this
by selecting Help -> Check For Updates...  Also, there are some GTK UI
problems with Ubuntu 9.10 that may require you to use only the keyboard
to select buttons on dialogs.

  If after that it still does not work please let me know.  

cheers
ken



> Date: Fri, 25 Dec 2009 11:30:23 +0100
> From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Subject: Re: [oe] Eclipse tools (OTE) wiki page complete.
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
> 	<ac9c93b10912250230v6acd28f4g40632a1960352ec6@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
> 
> 2009/12/25 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> > 2009/12/24 Ken Gilmer <ken@buglabs.net>:
> >>
> >> Hi!
> >>
> >> ?I've finally finished the first pass at documenting OpenEmbedded Tools for Eclipse (OTE) on the OE wiki. ?Please have a look if you're interested:
> >>
> >> http://wiki.openembedded.net/index.php/OpenEmbedded_Tools_for_Eclipse_%28OTE%29
> >>
> >> ?Any suggestions on categories and other ways of linking this content in with the rest of the wiki?
> >>
> >
> > Ken,
> >
> > Great work, did a quick peek at the page and it looks very nice!
> > I'll try it out later and if there are issues I'll definitely get back to you.
> >
> > Frans
> >
> 
> Dah. Stuck. Freshly installed eclipse 3.5, added the update site, when
> I go to install software nothing appears, but sometimes after fiddling
> around a little bit I see bitbake. I can select it, however the
> buttons to install it do not become active. Only cancel is there.
> I would suggest adding a few lines on how to actually install the
> stuff in a fresh eclipse version.
> 
> FM




