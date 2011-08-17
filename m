Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QthpN-0004eB-FO for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 17:14:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qthks-0003tP-2s for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 17:10:06 +0200
Received: from wsip-70-167-244-14.dc.dc.cox.net ([70.167.244.14])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 17:10:06 +0200
Received: from theyorks42 by wsip-70-167-244-14.dc.dc.cox.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 17:10:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Kendall York <theyorks42@yahoo.com>
Date: Wed, 17 Aug 2011 13:40:34 +0000 (UTC)
Message-ID: <loom.20110817T153621-464@post.gmane.org>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF93@KCINPUNHJCMS01.kpit.com>
	<AANLkTikH4eGT4ZqBHeL1aiNjwOyNJaETz5Skex_sYo2a@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 70.167.244.14 (Mozilla/5.0 (X11; Linux i686;
	rv:2.0.1) Gecko/20100101 Firefox/4.0.1)
Subject: Re: ERROR: Please set the 'PERSISTENT_DIR
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
X-List-Received-Date: Wed, 17 Aug 2011 15:14:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Frans Meulenbroeks <fransmeulenbroeks <at> gmail.com> writes:

> 
> 2010/6/8 Soumya R <Soumya.R <at> kpitcummins.com>:
> > Hi All ,
> >
> >   I am getting the error while configuring the bitbake
> > [root <at> fedora12 bitbake-1.8.18]# bitbake nano
> > ERROR: Please set the 'PERSISTENT_DIR' or 'CACHE' variable.
> > I got the sources of the bitbake and gave following commands
> > python setup.py build
> > python setup.py install
> >
> >  Please help me out to resolve this error..
> 
> I suggest following the instructions:
> http://wiki.openembedded.net/index.php/Getting_Started
> guess your local.conf is not ok or not present at all.
> Google has plenty of pages on this (and some actually carry answers  )
> 
> FM
> 
Ok so here is the deal. If you followed the getting started guide and only typed
the Set Enviroment cmds into the terminal than the window you have open is the
only one that bitbake will work in. You have to set your profile up so that the
PATH is set for your shell. Or you have to manually set PATH each time you open
a new terminal window.

Kendall



