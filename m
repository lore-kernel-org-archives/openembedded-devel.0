Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OY5G3-0006Mi-0T
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 00:44:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OY5BI-0006Rl-Nh
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 23:39:28 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTilUqapROvKeecH8McrUjMsQaEaI1LASvXztXi-a@mail.gmail.com>
References: <i1chst$tq5$1@dough.gmane.org>
	<1278867705.15825.94.camel@lenovo.internal.reciva.com>
	<AANLkTilUqapROvKeecH8McrUjMsQaEaI1LASvXztXi-a@mail.gmail.com>
Date: Sun, 11 Jul 2010 23:39:37 +0100
Message-ID: <1278887977.15825.280.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'LIBC' variable clashes with perl variable
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
X-List-Received-Date: Sun, 11 Jul 2010 22:44:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2010-07-11 at 15:17 -0700, Khem Raj wrote:
> uclibc is ok but glibc and eglibc will have same HOST_OS so it will be
> hard to differentiate which system C library to choose.

Are there any DISTROs which actually want to support both eglibc and
glibc in parallel?

p.




