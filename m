Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NoMbj-0005tc-Gx
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Mar 2010 20:57:53 +0100
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 7 Mar 2010 20:54:52 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 7 Mar 2010 20:54:46 +0100
Received: from [192.168.1.116] ([79.54.143.84]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 7 Mar 2010 20:54:46 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hmjucb$9v9$1@dough.gmane.org>
References: <1267553457.4739.324.camel@trini-m4400>
	<hmjucb$9v9$1@dough.gmane.org>
Date: Sun, 07 Mar 2010 20:53:56 +0100
Message-Id: <1267991636.3666.1.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 07 Mar 2010 19:54:47.0162 (UTC)
	FILETIME=[0A2895A0:01CABE30]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Firefox cleanups
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
X-List-Received-Date: Sun, 07 Mar 2010 19:57:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2010-03-02 at 22:02 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 02-03-10 19:10, Tom Rini wrote:
> > firefox: Perform a number of cleanups and consistency issues.
> 
> What are your thoughts on building things like xul and nss seperately so
> things like chromium can use them?
> 
> regards,
> 
> Koen
That would be great!!!
For instance pidgin-encryption(would be cool to have it in oe) depends
on nss.

Denis.




