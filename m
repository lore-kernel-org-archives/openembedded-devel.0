Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4LPd-0006BZ-7m
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 22:50:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M4LJ1-0004a2-82
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 20:43:59 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 13 May 2009 20:43:59 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 13 May 2009 20:43:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 May 2009 22:43:44 +0200
Message-ID: <gufbe0$1ap$1@ger.gmane.org>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>	<1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>	<guen3q$p5u$1@ger.gmane.org>	<20090513151848.GI7973@smtp.west.cox.net>	<4A0AE5CC.5010407@balister.org>	<20090513154842.GJ7973@smtp.west.cox.net>
	<20090513193625.GL7973@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <20090513193625.GL7973@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 6/6] angstrom: use GCC 4.3.3 for Geode devices
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
X-List-Received-Date: Wed, 13 May 2009 20:50:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-09 21:36, Tom Rini wrote:
> On Wed, May 13, 2009 at 08:48:42AM -0700, Tom Rini wrote:
> [snip]
>> OK, I've got a 405GP eval board dug up, I'll get a 'make check' going
>> sometime soon and report back.  That should cover the xilinx case too,
>> fwiw.
>
> OK, console-image built, but only with hdparm_6.6 as I'm getting a
> checksum mismatch with 6.9.  Digging up good hardware is taking a bit
> longer, but I'll hopefully have something soon.

Thanks!




