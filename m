Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qog3H-0005C7-9o
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 20:20:19 +0200
Received: (qmail invoked by alias); 03 Aug 2011 18:15:56 -0000
Received: from p4FDF1F1E.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.31.30]
	by mail.gmx.net (mp006) with SMTP; 03 Aug 2011 20:15:56 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+mHGI668imuPe1LJZgs7eMwEhco1KhUrZZPmLW7h
	riss9fV8XLa5ZV
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Aug 2011 20:18:51 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
	<j18cmj$j39$2@dough.gmane.org>
In-Reply-To: <j18cmj$j39$2@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201108032018.51667.schnitzeltony@gmx.de>
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
X-List-Received-Date: Wed, 03 Aug 2011 18:20:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday, August 02, 2011 10:32:19 AM Koen Kooi wrote:
> Do you have a public repo where this can be pulled from?

Before pushing to

git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git branch meta-xfce

I did

* rebase the patches on latest meta-openembedded commits
* Add README ( Khem suggested )
* xfce-session: Modify commit message ( iceauth now mainline )
* thunar: Minor modifcation in commit message
* build-tested xfce-base-image again

Andreas


