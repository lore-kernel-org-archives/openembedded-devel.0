Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1NeoDR-0008LG-H5
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 12:25:16 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1NenvJ-0007ry-II
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 11:06:29 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1NenvI-0006lB-4k
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 11:06:28 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
Date: Tue, 09 Feb 2010 11:06:24 +0000
Message-ID: <1265713584.3777.620.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 06/12] quilt: use builtin date routines
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
X-List-Received-Date: Tue, 09 Feb 2010 11:25:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-02-08 at 22:14 +0100, Bernhard Reutner-Fischer wrote:
> quilt tries to use an RFC822 date format which is obsoleted
> by rfc2822 since 8 years now.
> It has a builtin date handler, so use that and not the date
> binary (which may only support rfc2822 by now, as busybox does)

Thanks for the patch.  I checked this in.

p.




