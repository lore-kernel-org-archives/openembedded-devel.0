Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <freyther@gmx.net>) id 1I11Kt-0006kO-1H
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 16:39:07 +0200
Received: (qmail invoked by alias); 20 Jun 2007 14:35:23 -0000
Received: from dsl-62-220-14-162.berlikomm.net (EHLO [192.168.1.23])
	[62.220.14.162]
	by mail.gmx.net (mp055) with SMTP; 20 Jun 2007 16:35:23 +0200
X-Authenticated: #1949623
X-Provags-ID: V01U2FsdGVkX18tjnF+RpEt5v+8at0j9gtLN+tICeJnZA6C9DxaLT
	3iDaLn5NJFas9g
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <48239d390706200725xfceb517o8faf1e8bb88aaa9f@mail.gmail.com>
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
	<A7921DE0-7584-425F-B761-CD455252D3EC@gmx.net>
	<48239d390706200725xfceb517o8faf1e8bb88aaa9f@mail.gmail.com>
Message-Id: <DB846718-643A-4CB7-B66F-8682C44E617D@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Wed, 20 Jun 2007 16:34:39 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: [RFC] locales
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2007 14:39:07 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit


Am 20.06.2007 um 16:25 schrieb Sergey Lapin:


> big distros don't require so much space economy, so they package
> translations inside packages, so the problem is solved. I personally
> like RRECOMMENDS solution, like
> reciepe foo generates foo, foo-locale, foo-doc, foo-dev.
> we have var IMAGE_LOCALES="en_GB en_US"
> then RRECOMMENDS_foo will be = "${PN}-locale-en-gb ${PN}-locale-en-us"

No,
see point one (the one you have removed from this mail).


z.



