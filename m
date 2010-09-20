Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1Oxbzk-0008Gh-DF
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 10:45:52 +0200
Received: (qmail invoked by alias); 20 Sep 2010 08:44:09 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp020) with SMTP; 20 Sep 2010 10:44:09 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1954EZJTFN5WC+kcnoc4rRao2CGNI8m+oXwnqzlYG
	ehe35RV6tVLS4j
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Sep 2010 10:42:48 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201009191753.42404.schnitzeltony@gmx.de>
	<201009191818.10882.schnitzeltony@gmx.de>
	<i772rs$2tp$1@dough.gmane.org>
In-Reply-To: <i772rs$2tp$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201009201042.49657.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] clutter: remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 20 Sep 2010 08:45:54 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 20 September 2010 09:35:24 am Koen Kooi wrote:
> On 19-09-10 18:18, Andreas Mueller wrote:
> > On Sunday 19 September 2010 06:11:39 pm Koen Kooi wrote:
> >> That needs slightly, more, namely falling back to mesa for unknown
> >> machines. I can have a look at that tomorrow if you wish.
> > Yes please because I thought the fallback is already available with
> >
> > DEPENDS = ".. virtual/libgl"
> 
> The last time I tried it it didn't work, time to try it again :)

Meanwhile I am trying to setup something which does not create patches with line breaks ( makes me sick & yes I saw 
http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies but my provider wants autentication & I have 
not yet managed to get this working for git-send-email - maybe my git is too old... ) 

Let me know mesa fallback result..

Andreas


