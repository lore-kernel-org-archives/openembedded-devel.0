Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LW5S4-0006WQ-FS
	for openembedded-devel@openembedded.org; Sun, 08 Feb 2009 09:55:44 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LW5RO-0005D5-VT
	for openembedded-devel@openembedded.org; Sun, 08 Feb 2009 08:55:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 08 Feb 2009 08:55:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 08 Feb 2009 08:55:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 08 Feb 2009 09:50:43 +0100
Message-ID: <gmm6d3$act$2@ger.gmane.org>
References: <1234048773.6803.17.camel@alap>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <1234048773.6803.17.camel@alap>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] python-elementtree-1.2.7-20070827-preview checksums
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
X-List-Received-Date: Sun, 08 Feb 2009 08:55:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-02-09 00:19, Angus Ainslie wrote:
> --- openembedded/conf/checksums.ini~    2009-02-07 16:39:49.000000000 +0100
> +++ openembedded/conf/checksums.ini     2009-02-08 00:17:32.000000000 +0100
> @@ -1,3 +1,7 @@
> +[http://effbot.org/media/downloads/elementtree-1.2.7-20070827-preview.zip]
> +md5=30e2fe5edd143f347e03a8baf5d60f8a
> +sha256=5071431068c58c1f56dcc8fff37f8a213351f3b45c012d3adb640ec9418053ad
> +

Against what tree are you generating these patches?

koen@dominion:/OE/org.openembedded.dev/packages/powervr-drivers$ grep 
element ../../conf/checksums.ini
[http://svn.o-hand.com/repos/web/trunk/patches/add-end-element-signal.patch]
[http://effbot.org/media/downloads/elementtree-1.2.7-20070827-preview.zip]
koen@dominion:/OE/org.openembedded.dev/packages/powervr-drivers$

and

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=8611d028e196e438097c263f416b8b89cb3ec10b

Furthermore, could you use git format patch on your patches to get some 
more metadata on the patch?

regards,

Koen



