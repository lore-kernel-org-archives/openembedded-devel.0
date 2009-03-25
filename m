Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LmXoI-0003w5-G3
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 19:26:42 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LmXmh-0002hT-5g
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 18:25:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Mar 2009 18:25:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Mar 2009 18:25:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Mar 2009 19:22:46 +0100
Message-ID: <gqdspn$7bi$2@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>	<49C92CC7.2080801@gmail.com>	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>	<49C93237.7010205@gmail.com>	<49C9347C.7010309@balister.org>	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>	<49C94647.2040401@gmail.com>	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>	<gqd31s$5vk$1@ger.gmane.org>	<49CA5638.1050000@dls.net>	<gqdlka$cbd$1@ger.gmane.org>
	<49CA71ED.1080408@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090316 Shredder/3.0b3pre
In-Reply-To: <49CA71ED.1080408@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 18:26:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25-03-09 19:03, Jeremy Lainé wrote:
>
>> Another example: building qt/e for ppc405 will OOM[1] if you have a
>> populated TMPDIR, it will work fine from scratch.
>> We should certainly do builds from scratch to track down dependency and
>> process bugs, but let's not forget about non-empty TMPDIR bugs.
>
> Eh? That's scary! What version of Qt are we talking about? I routinely build qt4/embedded
> for powerpc targets (though admittedly not ppc405) without any problems.

qt/e2, qt4 behaves nicely.

regards,

Koen




