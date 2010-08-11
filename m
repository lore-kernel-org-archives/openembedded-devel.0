Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <plagnioj@jcrosoft.com>) id 1Oj1Op-00074t-5T
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 04:50:41 +0200
Received: (qmail 32255 invoked by uid 503); 11 Aug 2010 02:51:16 -0000
Received: from b9.ovh.net (HELO mail191.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 11 Aug 2010 02:51:16 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Aug 2010 04:50:29 +0200
Received: from ns32433.ovh.net (HELO localhost)
	(plagnioj%jcrosoft.com@213.251.161.87)
	by ns0.ovh.net with SMTP; 11 Aug 2010 04:50:27 +0200
Date: Wed, 11 Aug 2010 04:45:33 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100811024533.GA28059@game.jcrosoft.org>
References: <20100810093550.GE10920@game.jcrosoft.org>
	<AANLkTi=KL6T1jja4umSRjzSyk8iuj9dMb9fwKK7YO6au@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=KL6T1jja4umSRjzSyk8iuj9dMb9fwKK7YO6au@mail.gmail.com>
X-PGP-Key: http://uboot.jcrosoft.org/plagnioj.asc
X-PGP-key-fingerprint: 6309 2BBA 16C8 3A07 1772 CC24 DEFC FFA3 279C CE7C
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Ovh-Tracer-Id: 1149262331701799753
X-Ovh-Remote: 213.251.161.87 (ns32433.ovh.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.30.210
X-SA-Exim-Mail-From: plagnioj@jcrosoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-initial-4.3.3-r14.1 failed on SH4 angstrom
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
X-List-Received-Date: Wed, 11 Aug 2010 02:50:46 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 11:27 Tue 10 Aug     , Khem Raj wrote:
> On Tue, Aug 10, 2010 at 2:35 AM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj@jcrosoft.com> wrote:
> > HI,
> >
> >        I'm currently trying to use OE for a titan (SH4) board with Angstrom distrib
> >
> >        I've attached my conf and log
> >
> >        gcc-cross-initial-4.3.3-r14.1 failled to compile due to the fact that
> >        it's include /usr/include
> >
> >        is some have any idea?
> 
> 
> Please use gcc 4.4.4 for SH platform.
How can we update oe to do it automaticly for SH?

I known how to do in my conf or the machine but not in the distro for a
specific arch


Best Regards,
J.


