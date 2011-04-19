Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QC7kG-0001Yd-BH
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 12:01:20 +0200
Received: (qmail invoked by alias); 19 Apr 2011 09:58:54 -0000
Received: from p5B0A290D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.13]
	by mail.gmx.net (mp017) with SMTP; 19 Apr 2011 11:58:54 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18vQwlt1dgvO7ORhV3dBygECe9JuN9nXmIAZ3wH1O
	eLp7O8d1DtcyL3
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2011 11:54:43 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1303169791-19354-1-git-send-email-schnitzeltony@gmx.de>
	<iojkf6$aka$2@dough.gmane.org>
In-Reply-To: <iojkf6$aka$2@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201104191154.43865.schnitzeltony@gmx.de>
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
X-List-Received-Date: Tue, 19 Apr 2011 10:01:20 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 19 April 2011 11:25:58 Koen Kooi wrote:
> On 19-04-11 01:36, Andreas Mueller wrote:
> > Patches & settings were taken from [1] / branch overo.
> > For more informations see [2].
> > 
> > Tests performed:
> > * boot kernel 2.6.37 from SDCard
> > * boot kernel 2.6.30 from NAND
> > * variable manipulations setenv printenv savenv
> > * NAND erase
> 
> NAK, you're going back to an older version without saying why.
The version currently found in OE does not boot (from SDCard). I mentioned this 
in the patch title.

Andreas


