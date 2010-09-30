Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1P1QzV-000161-Nq
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 23:48:46 +0200
Received: (qmail invoked by alias); 30 Sep 2010 21:48:19 -0000
Received: from p50882973.dip.t-dialin.net (EHLO localhost.localdomain)
	[80.136.41.115]
	by mail.gmx.net (mp023) with SMTP; 30 Sep 2010 23:48:19 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19rVNAQHthrSLDlPzqoiLQyH71j9+B10iMbTaYa/w
	wpwBtiO0nl/AVG
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 23:43:32 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <201009191753.42404.schnitzeltony@gmx.de>
	<201009191818.10882.schnitzeltony@gmx.de>
	<i772rs$2tp$1@dough.gmane.org>
In-Reply-To: <i772rs$2tp$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201009302343.32618.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] & [PATCH v2] clutter: remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 30 Sep 2010 21:48:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 20 September 2010 09:35:24 Koen Kooi wrote:
> On 19-09-10 18:18, Andreas Mueller wrote:
> > On Sunday 19 September 2010 06:11:39 pm Koen Kooi wrote:
> >> That needs slightly, more, namely falling back to mesa for unknown
> >> machines. I can have a look at that tomorrow if you wish.
> > Yes please because I thought the fallback is already available with
> >
> > DEPENDS = ".. virtual/libgl"
> 
> The last time I tried it it didn't work, time to try it again :)
Any results?


