Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Pss60-0005VG-6A
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 08:28:12 +0100
Received: (qmail invoked by alias); 25 Feb 2011 07:20:10 -0000
Received: from p5B0A0F52.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.15.82]
	by mail.gmx.net (mp026) with SMTP; 25 Feb 2011 08:20:10 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19WcpNFkVVWUlrF33eYUvnBH8HM+JXnqD2MZfp78F
	mjFCujzHd7l4XB
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Feb 2011 08:14:22 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <4D66E88B.6040506@mentor.com>
In-Reply-To: <4D66E88B.6040506@mentor.com>
MIME-Version: 1.0
Message-Id: <201102250814.22232.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Release-2011.03: Let the testing continue again!
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
X-List-Received-Date: Fri, 25 Feb 2011 07:28:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 25 February 2011 00:23:55 Tom Rini wrote:
> Hey all,
> 
> I've updated the testing-release-2011.03 branch exist now and we're
> ready for more testing.  As a reminder, please update the table on
> http://wiki.openembedded.org/index.php?title=Release-2011.03 with your
> results and the githash you're on.
> 
> This go-around should be much less bumpy as we've both fixed a number of
> RPATH issues and made the error non-fatal.  I've also pushed a small
> number of fixes for issues I hit in my builder but once again need to
> add one more thing locally to confirm or rule out an occasional bug (the
> config.sub failure I reported earlier in testing out the cross.bbclass
> patch for RPATH stuff).
I saw your results for cross.bbclass and thought 'well the affected are ok - fine 
I have no time left over anyway'. 
Can you name a (quick building please - I have a very weak environment here) 
setup distro/machine/image so I hope to have a look on it at the weekend...
> 
> If all goes well, I plan to make a temporary branch Tuesday, add in (and
> then revert from master at Khem's request)
> http://patches.openembedded.org/patch/256/ since it is needed for
> SHR/shr-image to work.  Get one last go-round and then call it a release.
> 
> Thanks again all!


