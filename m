Received: from [64.61.99.36] (helo=mx2.safetynetaccess.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Ms5HC-0000NU-BN
	for openembedded-devel@openembedded.org; Mon, 28 Sep 2009 03:43:45 +0200
Received: from [172.19.0.216] (email.sonesta-boston.com [216.57.88.74] (may be
	forged))
	by mx2.safetynetaccess.com (8.13.6/8.13.6) with ESMTP id n8S1gd9Z049955
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Sep 2009 21:43:00 -0400 (EDT) (envelope-from philb@gnu.org)
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@openembedded.org
In-Reply-To: <1254096967.4ac00047b8abb@imp.free.fr>
References: <1254096967.4ac00047b8abb@imp.free.fr>
Date: Mon, 28 Sep 2009 02:42:40 +0100
Message-Id: <1254102160.4923.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Virus-Scanned: by amavisd-new
X-SA-Exim-Connect-IP: 64.61.99.36
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xmonobut
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
X-List-Received-Date: Mon, 28 Sep 2009 01:43:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-28 at 02:16 +0200, Alain2210 wrote:
> Hello,
> 
> xmonobut segfault. I need this patch to get it works again.

That patch looks harmless enough in itself (and maybe a good thing), but
if you're seeing a segfault without it then that would suggest that your
Xlib is broken.  It would be better to fix the bug in Xlib.

p.




