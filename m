Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MCc3Z-0004im-Kb
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 18:14:13 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MCbug-0004nZ-Mp
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 16:05:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 05 Jun 2009 16:05:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 05 Jun 2009 16:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 05 Jun 2009 17:59:54 +0200
Message-ID: <h0bfdr$mbg$2@ger.gmane.org>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1244208273-14048-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <1244208273-14048-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: Next set of EP93xx patches
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
X-List-Received-Date: Fri, 05 Jun 2009 16:14:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05-06-09 15:24, Marcin Juszkiewicz wrote:
> Here I am with another set of patches to make EP93xx cpus working better
> in OpenEmbedded.
>
> This time I merged glibc 2.6.1 and binutils 2.18 patches done by Hasjim
> Williams and changed a bit Ångström configs for building with Maverick
> tuning enabled.
>
> After rebuilding whole rootfs I got system which works and even gives
> proper output from 'openssl speed md5' command.

You can add my acked-by to all 4 patches.

regards,

Koen



