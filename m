Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TmUDd-0008Ja-Pt for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 19:54:48 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TmTzR-0006tL-2Y for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 19:40:05 +0100
Received: from adsl-ull-84-196.40-151.net24.it ([151.40.196.84])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 19:40:05 +0100
Received: from christoph.sobotka by adsl-ull-84-196.40-151.net24.it with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 19:40:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Christoph Sobotka <christoph.sobotka@utanet.at>
Date: Sat, 22 Dec 2012 18:36:32 +0000 (UTC)
Message-ID: <loom.20121222T192537-634@post.gmane.org>
References: <1336237032.22405.2.camel@localhost.localdomain>
	<4FA58128.7030906@gmail.com>
	<1336248354.26091.4.camel@localhost.localdomain>
	<CAMKF1so7oUWmrYROtvk-1x9o6cfNJhgNUgibnc+YpwAv+tDm6g@mail.gmail.com>
	<1336288450.2971.4.camel@localhost.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 151.40.196.84 (Opera/9.80 (X11;
	Linux i686) Presto/2.12.388 Version/12.12)
Subject: Re: [meta-handheld] Troubles building kernel for h2200
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
X-List-Received-Date: Sat, 22 Dec 2012 18:54:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I tried building for h2200 and had the same error:

arch/arm/boot/compressed/head-h2200.o:(.start+0x0): undefined reference to `no 
symbol'

I ran it on debian squeeze.
binutils 2.20.1-16
gcc 4:4.4.5-1

Is there a solution to the problem?



