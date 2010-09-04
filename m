Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <plagnioj@jcrosoft.com>) id 1OrjNK-0004lA-9K
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 05:25:07 +0200
Received: (qmail 22958 invoked by uid 503); 4 Sep 2010 03:28:26 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 4 Sep 2010 03:28:26 -0000
Received: (qmail 17960 invoked by uid 503); 4 Sep 2010 03:02:22 -0000
Received: from b6.ovh.net (HELO mail432.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 4 Sep 2010 03:02:22 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Sep 2010 05:17:49 +0200
Received: from ns32433.ovh.net (HELO localhost)
	(plagnioj%jcrosoft.com@213.251.161.87)
	by ns0.ovh.net with SMTP; 4 Sep 2010 05:17:48 +0200
Date: Sat, 4 Sep 2010 05:17:12 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100904031712.GK17702@game.jcrosoft.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<AANLkTin7HBBUQk0STC=zAPgbceC+dfLFB=3eaYORr7Ws@mail.gmail.com>
	<20100903164708.GI17702@game.jcrosoft.org>
	<20100903165917.GJ17702@game.jcrosoft.org>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFA35B@dlee06.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310BFA35B@dlee06.ent.ti.com>
X-PGP-Key: http://uboot.jcrosoft.org/plagnioj.asc
X-PGP-key-fingerprint: 6309 2BBA 16C8 3A07 1772 CC24 DEFC FFA3 279C CE7C
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Ovh-Tracer-Id: 13428608190471908169
X-Ovh-Remote: 213.251.161.87 (ns32433.ovh.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: plagnioj@jcrosoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to extend SRC_URI_append?
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
X-List-Received-Date: Sat, 04 Sep 2010 03:25:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 
> Is there really a case for a ${TARGET_ARCH}_${SOC_FAMILY} override.  If these devices have different architectures are they really part of the same family?
yes I've as I've the same soc family on 2 arch with 2 patch series

I'm preparing it and will send soon I hope

Best Regards
J.


