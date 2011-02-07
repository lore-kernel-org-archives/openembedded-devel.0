Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PmYhK-0004HV-MY
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 22:32:38 +0100
Received: (qmail invoked by alias); 07 Feb 2011 21:31:34 -0000
Received: from p5DE4812E.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.129.46]
	by mail.gmx.net (mp012) with SMTP; 07 Feb 2011 22:31:34 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+vW+ZKjQSvh4CTLtG+MAVWfSvtECN8wdmhA0agP5
	hUI4zYDGSjt8et
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 7 Feb 2011 22:28:04 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1296768970-19738-1-git-send-email-schnitzeltony@gmx.de>
	<20110203214655.GA14662@mail.familie-heinold.de>
In-Reply-To: <20110203214655.GA14662@mail.familie-heinold.de>
MIME-Version: 1.0
Message-Id: <201102072228.04796.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] clutter: fix broken clutter-gtk
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
X-List-Received-Date: Mon, 07 Feb 2011 21:32:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 03 February 2011 22:46:56 Henning Heinold wrote:
> hm maybee its better to concentrate on clutter 1.6 release.

Just played with clutter 1.6.2 (released today) and got:

| checking for GLIB - version >= 2.26.0... no
| *** Could not run GLIB test program, checking why...
| *** The test program failed to compile or link. See the file config.log for the
| *** exact error that occured. This usually means GLIB is incorrectly installed.
| configure: error: glib-2.0 is required

This seems at least a problem with angstrom-2008.1...

Andreas


