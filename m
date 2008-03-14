Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ja9av-0005BK-4T
	for openembedded-devel@openembedded.org; Fri, 14 Mar 2008 14:05:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ja9Yh-000560-PR
	for openembedded-devel@openembedded.org; Fri, 14 Mar 2008 13:02:51 +0000
Received: from wlan142247.mobiel.utwente.nl ([130.89.142.247])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 14 Mar 2008 13:02:51 +0000
Received: from koen by wlan142247.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 14 Mar 2008 13:02:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Fri, 14 Mar 2008 14:02:45 +0100
Message-ID: <frdt1l$ro4$1@ger.gmane.org>
References: <200803121450.09688.geoffrey@pager.net>
	<200803131417.52399.geoffrey@pager.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan142247.mobiel.utwente.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803131417.52399.geoffrey@pager.net>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Eureka! AVR32 ld-uClibc.so segfault solved
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2008 13:05:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Geoffrey Wossum schreef:
| On Wednesday 12 March 2008 02:50:09 pm Geoffrey Wossum wrote:
|
|> I just tracked down the culprit for my AVR32 system always segfaulting
|> whenever ld-uClibc.so ran (usually as soon as the kernel attempted to run
|> the init process).
|
| I just submitted all my patches for the AVR32 to OE's bugzilla.  They are
| attachments under bug #4062.

I applied all patches from #4062 and fixed some avr32 gcc-cross and
mplayer issues while I was at it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH2nd1MkyGM64RGpERAoaBAJ0dpXfKVOuWuWQoUP9q/yHQiK3wKwCdGAEl
qxbBG5jckHIjPPzHBEzscsk=
=Azmm
-----END PGP SIGNATURE-----



