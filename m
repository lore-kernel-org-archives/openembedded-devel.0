Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lufr0-0005GZ-2B
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 06:39:08 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lufn7-0005jQ-J2
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 08:35:05 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Apr 2009 08:35:01 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<20090416221015.GP17629@smtp.west.cox.net>
In-Reply-To: <20090416221015.GP17629@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200904170835.02172.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET, RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/11] gcc 4.2.4: add gcc-multilib64dir.patch
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
X-List-Received-Date: Fri, 17 Apr 2009 04:39:08 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 17 April 2009 02:10:15 Tom Rini wrote:
> On Wed, Apr 15, 2009 at 04:35:53PM +0400, Roman I Khimov wrote:
> > ---
> >  recipes/gcc/files/gcc-multilib64dir.patch |   43
> > +++++++++++++++++++++++++++++ recipes/gcc/gcc-4.2.4.inc                 |
> >    1 +
> >  2 files changed, 44 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/gcc/files/gcc-multilib64dir.patch
>
> Does this apply as-is to 4.1 and 4.3 too?  If not, lets name it
> gcc-4.2.x-multilib64dir.patch.

Not tried yet. Again, this is primarily for review/feedback on overall 
approach. If everything is OK, then I can try add more gcc/glibc versions as 
already done with binutils.


