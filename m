Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N2Wgc-0000kg-R6 for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 22:01:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N2Wfb-0005nv-Nx
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 22:00:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 22:00:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 22:00:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Oct 2009 21:55:12 +0100
Message-ID: <hc52bg$1q9$2@ger.gmane.org>
References: <200910262125.58992.david.lanzendoerfer@o2s.ch>
	<200910262143.12193.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200910262143.12193.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] MokoTouch
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
X-List-Received-Date: Mon, 26 Oct 2009 21:01:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26-10-09 21:43, Marcin Juszkiewicz wrote:
> Dnia poniedziałek, 26 października 2009 o 21:25:48 David Lanzendörfer
> napisał(a):
>> I'd like to have mokotouch-recipes added to OE.
>
> 1. use "install -d" instead of "mkdir"
> 2. use "install" instead of "cp"
> 3. learn about DEPENDS and RDEPENDS and fix use of them
> 4. use "oe_runmake" instead of "make"
> 5. do not set PACKAGES
> 6. build to ${prefix} not /usr/local/
> 7. get rid of ugly symlinking of libraries
> 8. move common stuff to mokotouch.inc
> 9. consider changing a way of building mokotouch-* to do all from one recipe

10. learn about qmake bbclasses

regards,

Koen



