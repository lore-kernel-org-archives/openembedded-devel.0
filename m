Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QoiZ3-0001Yr-1n
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 23:01:17 +0200
Received: (qmail invoked by alias); 03 Aug 2011 20:56:51 -0000
Received: from p4FDF1F1E.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.31.30]
	by mail.gmx.net (mp023) with SMTP; 03 Aug 2011 22:56:51 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/OVuwbTtfOvsyDyYML4XTptfv072JAdWS+Ls+nrD
	4zKUn2whY8P5gF
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Aug 2011 22:59:46 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
	<201108032018.51667.schnitzeltony@gmx.de>
	<j1c561$jr5$1@dough.gmane.org>
In-Reply-To: <j1c561$jr5$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201108032259.47053.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe 00/19] Add xfce48 desktop system to meta-oe
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
X-List-Received-Date: Wed, 03 Aug 2011 21:01:17 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, August 03, 2011 08:48:33 PM Koen Kooi wrote:
> Op 03-08-11 20:18, Andreas Mueller schreef:
> > On Tuesday, August 02, 2011 10:32:19 AM Koen Kooi wrote:
> >> Do you have a public repo where this can be pulled from?
> > 
> > Before pushing to
> > 
> > git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git branch
> > meta-xfce
> > 
> > I did
> > 
> > * rebase the patches on latest meta-openembedded commits * Add README (
> > Khem suggested )
> 
> small nit: the README doesn't say that it depends on meta-oe for e.g.
> iceauth
> 
OK - but what is the correct git workflow to fix

* Simply append a new commit?

OR

* git rebase -i xfce-meta~20 -> Move the commit at the end
* make modification
* git add <modification>
* git commit --amend
* git rebase -i xfce-meta~20 -> Move the commit back at the beginning

OR

???

Thanks

Andreas


