Received: from helsinki.digox.de ([87.106.28.129] helo=digox.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1OQ3Ht-0006fj-M9
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jun 2010 21:01:07 +0200
Received: from gonzales.localnet by digox.de with esmtp (emil_Fk.fnHvuqfpv9);
	Sat, 19 Jun 2010 20:52:12 +0200
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jun 2010 20:52:20 +0200
User-Agent: KMail/1.13.3 (Linux/2.6.33.5-124.fc13.x86_64; KDE/4.4.4; x86_64; ;
	)
References: <A24693684029E5489D1D202277BE89445316FB43@dlee02.ent.ti.com>
	<20100605055722.GR16035@jama>
	<lypr058utg.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lypr058utg.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Message-Id: <201006192052.21716.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 87.106.28.129
X-SA-Exim-Mail-From: mok@mnet-online.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, martin.jansa@gmail.com
Subject: Re: We need newer ncurses Was: Host Environment affect on target builds
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
X-List-Received-Date: Sat, 19 Jun 2010 19:01:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Samstag, 5. Juni 2010, 15:36:59 schrieb Enrico Scholz:
> Martin Jansa <martin.jansa@gmail.com> writes:
> > BTW: 5.4 is >6years old, 5.7 ~2years old (latest)
> > 
> > Is someone already working on newer ncurses recipes?
> 
> https://www.cvg.de/people/ensc/ncurses_5.7.bb
> 
> Problem with ncurses is, that it needs a patched autoconf 2.13 to do
> the full autoconf step.  Recipe above uses shipped ./configure. Newer
> ncurses need some termcap/tinfo related changes in multiple packages
> too and I did not had time to clean them all up for submission.

I had that -ltinfo build problem with alsa-utils on Fedora 13. With your 
ncurses recipe it build fine. Thanks :)

> 
> 
> Enrico
> 

-- 
Klaus 'mrmoku' Kurzmann


