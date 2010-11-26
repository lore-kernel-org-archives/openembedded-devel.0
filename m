Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1PLw2p-0001Ze-KD
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 12:00:48 +0100
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PLw1c-0006v7-6e
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 10:59:32 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1PLw1b-0007aQ-HS
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 10:59:31 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
References: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
Date: Fri, 26 Nov 2010 10:59:31 +0000
Message-ID: <1290769171.20979.51.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
X-SA-Exim-Connect-IP: 62.7.80.110
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bluez-dtl1-workaround not provided?
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
X-List-Received-Date: Fri, 26 Nov 2010 11:00:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-11-25 at 18:24 +0100, Andrea Adami wrote:
> So, first doubt is: why make this mandatory for everyone having pcmcia?

It shouldn't be.  The dependency in kernel-module-dtl1-cs should be
sufficient to pull it in for (only) those people who are installing the
driver that needs those bits.

p.




