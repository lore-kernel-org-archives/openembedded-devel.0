Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LdpE5-0004XT-G2
	for openembedded-devel@openembedded.org; Sun, 01 Mar 2009 18:13:17 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LdpAM-0005Gr-LV
	for openembedded-devel@openembedded.org; Sun, 01 Mar 2009 17:09:26 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 01 Mar 2009 17:09:26 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 01 Mar 2009 17:09:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 01 Mar 2009 18:09:14 +0100
Message-ID: <goeffr$gm2$1@ger.gmane.org>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>	<20090227162633.GD5420@smtp.west.cox.net>	<ac9c93b10902280254j3ac8533bod972dfd150b46621@mail.gmail.com>	<20090228155335.GJ5420@smtp.west.cox.net>	<ac9c93b10902281007h3e063b81u63bbad13419c5d6c@mail.gmail.com>
	<20090228182919.GK5420@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <20090228182919.GK5420@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Sun, 01 Mar 2009 17:13:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-02-09 19:29, Tom Rini wrote:

> Tangentally, packaged staging _can_ help here, but it's not I believe,
> relocatible (unless you assume-provided some -native packages and
> possibly we've fixed what we're doing wrong with gcc configure args).
> IOW, if you build in, /OE/tmp you can't re-use the packaged staging
> packages in /home/me/OE/tmp

You can, packaged staging has 2 dirs: one for relocatable packages and 
one for non-relocatable packages. That's how I understand it.

regards,

Koen



