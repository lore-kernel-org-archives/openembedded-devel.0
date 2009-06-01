Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MB9lr-0008L3-7m
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 17:49:55 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MB9dM-0008Kw-Dq
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 15:41:09 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 15:41:08 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 15:41:08 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Jun 2009 17:40:54 +0200
Message-ID: <h00sq7$9mv$1@ger.gmane.org>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: EP93xx - update of GCC support for this sick CPU/FPU
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
X-List-Received-Date: Mon, 01 Jun 2009 15:49:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-06-09 16:49, Marcin Juszkiewicz wrote:
> Hi
>
> This patchset is taken from http://martinwguy.co.uk/martin/crunch/
>
> It is enabled by default for ep93xx devices as EDB9301 boots into rootfs
> built with this toolchain without problems. Running "openssl speed"
> works but end table with results contains broken calculations.
>
> Binary locales do not work as QEMU do not handle ep93xx cpu.
>
> Patches are a bit ugly maybe (in conf/machine/include/*) but I want to
> show it finally to people before it rust.

maverick *is* ugly :) The patches look OK, so feel free to add my 
Acked-by to all of them.

regards,

Koen



