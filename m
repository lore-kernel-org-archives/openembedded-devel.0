Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <plagnioj@jcrosoft.com>) id 1OrUJM-0001Js-SJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 13:20:13 +0200
Received: (qmail 12931 invoked by uid 503); 3 Sep 2010 11:22:01 -0000
Received: from b6.ovh.net (HELO mail645.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 3 Sep 2010 11:22:00 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 3 Sep 2010 13:13:29 +0200
Received: from ns32433.ovh.net (HELO localhost)
	(plagnioj%jcrosoft.com@213.251.161.87)
	by ns0.ovh.net with SMTP; 3 Sep 2010 13:13:28 +0200
Date: Fri, 3 Sep 2010 13:12:10 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100903111210.GA17702@game.jcrosoft.org>
MIME-Version: 1.0
X-PGP-Key: http://uboot.jcrosoft.org/plagnioj.asc
X-PGP-key-fingerprint: 6309 2BBA 16C8 3A07 1772 CC24 DEFC FFA3 279C CE7C
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Ovh-Tracer-Id: 15589210110826949449
X-Ovh-Remote: 213.251.161.87 (ns32433.ovh.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 87.98.216.213
X-SA-Exim-Mail-From: plagnioj@jcrosoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: How to extend SRC_URI_append?
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
X-List-Received-Date: Fri, 03 Sep 2010 11:20:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

	I'm currently working on the adding of a sub SH arch the st40

	for this I've define the SOC_FAMILY as SOC_FAMILY="st40"

	but now I want to apply some patch to gcc, binutils and others

	via SRC_URI_append_st40 or SRC_URI_append_sh_st40

	how can i do it?

Best Regards,
J.


