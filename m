Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OxgKK-0000o9-S6
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 15:22:37 +0200
Received: (qmail invoked by alias); 20 Sep 2010 13:22:31 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp059) with SMTP; 20 Sep 2010 15:22:31 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/WO1lIIvzWY2buSoF9Bhp/Tj076i9B4tOr5JWfYU
	Gr6cYDLOI95Jxc
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Sep 2010 15:21:09 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201009191753.42404.schnitzeltony@gmx.de>
	<201009201042.49657.schnitzeltony@gmx.de>
	<AANLkTindG1S3Z=WY2CVsqd0hco4qjfo-6XviHAb8N5r3@mail.gmail.com>
In-Reply-To: <AANLkTindG1S3Z=WY2CVsqd0hco4qjfo-6XviHAb8N5r3@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009201521.09520.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: git-send-email setup (former [PATCH] clutter: remove COMPATIBLE_MACHINE)
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
X-List-Received-Date: Mon, 20 Sep 2010 13:22:38 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 20 September 2010 10:55:17 am Frans Meulenbroeks wrote:
> use alpine or set up a gmail account (note that you can still use your
> real email for Submitted-by)
For those with similar trouble:

I updated git (had version 1.5.xx shipped by Fedora 8 - which did not know authenticating servers ) and added some additional packages (perl-Email-MIME-* / perl-AUTHEN-SASL). 

Now I can send patches by git-send-email :-)

Andreas


