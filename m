Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QCBXU-0005xA-Rz
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 16:04:24 +0200
Received: (qmail invoked by alias); 19 Apr 2011 14:02:03 -0000
Received: from p5B0A290D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.13]
	by mail.gmx.net (mp037) with SMTP; 19 Apr 2011 16:02:03 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+6KDsPtu+6uM/FOsinF6xbmFzXoq1oqwJfkbBip1
	2iwjmVz8N1wp4u
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2011 15:57:56 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1303169791-19354-1-git-send-email-schnitzeltony@gmx.de>
	<iojkf6$aka$2@dough.gmane.org> <4DAD844D.7050800@balister.org>
In-Reply-To: <4DAD844D.7050800@balister.org>
MIME-Version: 1.0
Message-Id: <201104191557.57017.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH v3] u-boot_overo: current version does not boot / read expansion board ID.
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
X-List-Received-Date: Tue, 19 Apr 2011 14:04:25 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 19 April 2011 14:47:09 Philip Balister wrote:
> On 04/19/2011 05:25 AM, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > On 19-04-11 01:36, Andreas Mueller wrote:
> >> Patches&  settings were taken from [1] / branch overo.
> >> For more informations see [2].
> >> 
> >> Tests performed:
> >> * boot kernel 2.6.37 from SDCard
> >> * boot kernel 2.6.30 from NAND
> >> * variable manipulations setenv printenv savenv
> >> * NAND erase
> > 
> > NAK, you're going back to an older version without saying why.
> 
> Upstream u-boot should have the expansion patch in already.
> 
> Philip
Thanks - I haven't checked that. I will try later version.

Andreas


