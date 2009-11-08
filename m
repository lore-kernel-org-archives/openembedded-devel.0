Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N73O9-0007Bf-B5 for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 09:44:48 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N73Mx-0004nw-V1
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 09:43:31 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 09:43:31 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 09:43:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 08 Nov 2009 09:43:08 +0100
Message-ID: <hd60as$mjp$1@ger.gmane.org>
References: <c384c5ea0911071703o4aec5583w140a128328b5bdcc@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <c384c5ea0911071703o4aec5583w140a128328b5bdcc@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Machines/users of squashfs 4.0 with lzma?
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
X-List-Received-Date: Sun, 08 Nov 2009 08:44:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-11-09 02:03, Leon Woestenberg wrote:
> Hello Otavio, all,
>
> I saw you as the committer/author for the current bitbake for squash
> 4.0 stuff with lzma patches, thanks for that.
>
> As lzma support is now (almost!) landed upstream, I would like to see
> what the impact is of moving to the upcoming 4.x release.
>
> I have a patch on standby that moves from 4.0+patches to the current
> SVN where lzma is built-in.
>
> However, first, who is using this??

I'm using it to build the squashfs+aufs-on-ext3 setup for the 
omap3-touchbook machine. Using 3.1 gives me a kernel panic :)

regards,

Koen



