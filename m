Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MWp87-0003CE-21
	for openembedded-devel@openembedded.org; Fri, 31 Jul 2009 12:14:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MWotU-0001FA-Q1
	for openembedded-devel@openembedded.org; Fri, 31 Jul 2009 09:59:20 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 31 Jul 2009 09:59:20 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 31 Jul 2009 09:59:20 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 31 Jul 2009 11:59:09 +0200
Message-ID: <h4uf9d$cfg$1@ger.gmane.org>
References: <4A6FD077.1060001@gmail.com>	<h4ou1e$s42$1@ger.gmane.org>	<4A700A74.7040507@xora.org.uk>	<200907291131.04967.marcin@juszkiewicz.com.pl>	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>	<20090730053353.GF25691@smtp.west.cox.net>	<6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>	<4A7160F2.8030000@xora.org.uk>	<4A7255D3.9020703@gmail.com>	<4A729943.4060200@xora.org.uk>
	<4A729FF4.3040600@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090716 Shredder/3.0b4pre
In-Reply-To: <4A729FF4.3040600@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Fri, 31 Jul 2009 10:14:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-07-09 09:40, Graham Gower wrote:
> Graeme Gregory wrote:
>> Looks good to me, do you fancy moving that do_compile_append into
>> kernel.bbclass? You can then have the added kudos of fixing OE core
>> files :-)
>
> Kudos sound tasty.

Acked-by: Koen Kooi <koen@openembedded.org>



