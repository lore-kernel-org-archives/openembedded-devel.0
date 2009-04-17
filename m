Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LugKC-0008VM-Hi
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 07:09:20 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LugGL-000FKp-Eh
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 09:05:17 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Apr 2009 09:05:14 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<20090416221140.GQ17629@smtp.west.cox.net>
In-Reply-To: <20090416221140.GQ17629@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200904170905.15115.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_50,
	RCVD_IN_BL_SPAMCOP_NET, RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] AMD64 and multilib support
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
X-List-Received-Date: Fri, 17 Apr 2009 05:09:28 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 17 April 2009 02:11:40 Tom Rini wrote:
> On Wed, Apr 15, 2009 at 04:33:48PM +0400, Roman I Khimov wrote:
> > Hello all.
> >
> > This patch series (will follow in replies) tries to bring in AMD64/x86_64
> > support into OE. This required some intrusive toolchain fixes that I want
> > to post here for review and feedback as I think (or rather know ;)) I
> > might have broken something along the way.
>
> Have you done a build of meta-toolchain as well?

Not yet. gcc-cross was the main target.

[adding to TODO]


