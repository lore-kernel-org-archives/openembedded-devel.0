Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1ObEFN-0002w8-3m
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 16:56:49 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1ObEFE-0000yS-Js
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 15:56:32 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1ObEFE-0005FA-B5
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 15:56:32 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279602754-8620-1-git-send-email-raj.khem@gmail.com>
References: <1279602754-8620-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 20 Jul 2010 15:56:31 +0100
Message-ID: <1279637791.2345.2196.camel@mill.internal.reciva.com>
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
Subject: Re: [PATCH] sane-toolchain.inc: Check for architectures which dont support EABI
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
X-List-Received-Date: Tue, 20 Jul 2010 14:56:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-07-19 at 22:12 -0700, Khem Raj wrote:
> * This patch reverses the check for EABI support. This would mean
>   that future processors will not have to be added everytime they
>   come out.

Thanks, that looks good.

p.




