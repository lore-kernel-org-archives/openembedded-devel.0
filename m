Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KnBzA-00070W-2I
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:48:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KnBuk-0003oZ-Pu
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 12:43:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 07 Oct 2008 12:43:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Oct 2008 12:43:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Oct 2008 14:43:37 +0200
Message-ID: <gcflhq$rfu$1@ger.gmane.org>
References: <48E6624C.7000409@opensimpad.org>	<gc72hu$i8f$1@ger.gmane.org>	<48E758CB.7040209@opensimpad.org>	<48EB45F0.8080809@opensimpad.org>	<gcfi87$g4t$1@ger.gmane.org>
	<48EB5730.8030700@opensimpad.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <48EB5730.8030700@opensimpad.org>
Sender: news <news@ger.gmane.org>
Subject: Re: X/Qt2 opie integration (patches included)
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
X-List-Received-Date: Tue, 07 Oct 2008 12:48:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-10-2008 14:33, Bernhard Guillon wrote:
> Koen Kooi schrieb:

> What do you think about:
>
> xqtlauncher-blackbox-config.bb
> xqtlauncher-xkbd-desktop.bb
> xqtlauncher.bb having the above as rdepends?
>
> or
> xqtlauncher-blackbox-config.bb
> xqtlauncher-xkbd-desktop.bb
> xqtlauncher.bb no depends except X/Qt2
> and a task-xqtlauncher.
> With this we could provide support for different window managers later.
> Currently only blackbox is supported.
>
> or same as above but
> xqt2-xqtlauncher-foo-bar.bb

Option 2 seems nice.

regards,

Koen



