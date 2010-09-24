Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Oz7ok-0007mT-5d
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 14:55:58 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Oz7oe-0003J6-HD
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 13:55:52 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Oz7oe-00042r-9b
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 13:55:52 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=41Y_wwKR1czvr5XW-7xZSpwg1J2-vQ5sKStRQ@mail.gmail.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310E154E8@dlee06.ent.ti.com>
	<AANLkTi=45dASvU5XiCia4o2bia-Zx38neVw8vK6Qvrx-@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310E1558D@dlee06.ent.ti.com>
	<AANLkTi=41Y_wwKR1czvr5XW-7xZSpwg1J2-vQ5sKStRQ@mail.gmail.com>
Date: Fri, 24 Sep 2010 13:55:52 +0100
Message-ID: <1285332952.1649.199.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about automake licensing in recipe
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
X-List-Received-Date: Fri, 24 Sep 2010 12:55:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-09-24 at 21:38 +0930, Graham Gower wrote:
> Basically, automake have to contact all their contributors to allow
> their GPLv2 code to be distributed under GPLv3. Or they have to pull
> the GPLv3 code out.

If automake has followed the usual GNU conventions then all the
contributors will have assigned copyright of their code to the FSF
anyway.  In that case, the FSF can (being the copyright holder)
unilaterally decide what licence it should be distributed under.

If they haven't done that then, yeah, they would probably need the
permission of the original authors to change the licensing.

p.




