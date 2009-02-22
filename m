Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LbJuQ-0003O4-7i
	for openembedded-devel@openembedded.org; Sun, 22 Feb 2009 20:22:38 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LbJrg-0007J8-Iq
	for openembedded-devel@openembedded.org; Sun, 22 Feb 2009 19:19:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 22 Feb 2009 19:19:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Feb 2009 19:19:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 22 Feb 2009 20:19:36 +0100
Message-ID: <gns8g9$4tg$1@ger.gmane.org>
References: <d741b6090902221034t224cd1e5ja6b3e863fd54bbda@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <d741b6090902221034t224cd1e5ja6b3e863fd54bbda@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Angstrom, ep93xx, broken rootfs
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
X-List-Received-Date: Sun, 22 Feb 2009 19:22:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-02-09 19:34, Alex Williams wrote:
> Hello!
> I decided to update my OpenEmbedded from git today. Result: broken
> rootfs, many applications lost such as busybox and many other files,
> symlinks. Tried to build minimal-image... One week before update I had
> perfect rootfs and everything work fine... Resetting many commits
> since last week did not helped me.
> Details here: http://pastebin.com/m7ddd3941

That should be solved now, thanks for spotting!

/me grumbles at += vs _append " "




