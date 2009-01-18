Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LOVHj-0002ME-9f
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 11:53:43 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LOVAy-0004Se-Rl
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 10:46:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 18 Jan 2009 10:46:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 18 Jan 2009 10:46:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 18 Jan 2009 11:46:33 +0100
Message-ID: <gkv1a9$709$1@ger.gmane.org>
References: <cover.1232244759.git.andrea.adami@gmail.com>	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>	<ea6b4f404328c7722af631e1fcf6050a184eef42.1232244759.git.andrea.adami@gmail.com>	<48e10fbb365d98dff4b8086d562b339fe62e29a6.1232244759.git.andrea.adami@gmail.com>	<c1ce4054664d07c9f2a79ac7bcdf26637470aeec.1232244759.git.andrea.adami@gmail.com>	<be10caf1d9175ef81833424a9c6b334fd4857272.1232244759.git.andrea.adami@gmail.com>	<gkuqgo$ncn$2@ger.gmane.org>
	<d1b08f940901180240q714ae33agb361b515a44103b5@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090109 Shredder/3.0b2pre
In-Reply-To: <d1b08f940901180240q714ae33agb361b515a44103b5@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 12/14] zaurus-2.6.inc: modules fixes
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
X-List-Received-Date: Sun, 18 Jan 2009 10:53:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-01-09 11:40, Andrea Adami wrote:
>> NACK, not every kernel has those built-in for those machines.
>
> ...but the kernel who as it compiled breaks badly trying to load the
> modules...and won't boot.

If your kernel has those modules compiled in, the modules won't be 
present and hence can't be loaded. Your case is a non-problem.

regards,

Koen



