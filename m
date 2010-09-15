Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1Ow02F-0007ZF-SQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 00:01:00 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1Ow01S-0007IF-7P
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 00:00:10 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id B72B66A12A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 00:00:05 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Sep 2010 00:00:03 +0200
User-Agent: KMail/1.9.9
References: <201009152053.55754.pieterg@gmx.com>
	<AANLkTiniT0yN9D3x=ksGJRBRkdmKX1pVM8964BaTTZot@mail.gmail.com>
In-Reply-To: <AANLkTiniT0yN9D3x=ksGJRBRkdmKX1pVM8964BaTTZot@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009160000.03446.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1Ow01S-0007IF-7P
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: using klibc shared objects
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
X-List-Received-Date: Wed, 15 Sep 2010 22:01:00 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 September 2010 23:19:04 Andrea Adami wrote:
> On Wed, Sep 15, 2010 at 8:53 PM, pieterg <pieterg@gmx.com> wrote:
> > What would be the best solution (if I don't want to switch to static
> > linking)? Should we perhaps move the header files to klibc-dev?
>
> In the first version there was an error about this.
> Pls retry and pull klibc_1.5.20-r1 which has been fixed (it seems).

Ah, thanks, overlooked that commit. Indeed, just what I wanted.

Rgds, Pieter


