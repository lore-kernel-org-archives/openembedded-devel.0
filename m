Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LnA9r-0003bw-RL
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 12:23:31 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LnA83-0002J3-60
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 11:21:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 27 Mar 2009 11:21:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 27 Mar 2009 11:21:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 27 Mar 2009 12:21:27 +0100
Message-ID: <gqicrn$lmd$1@ger.gmane.org>
References: <5c5e5c350903270322o7d0ded99k3a050586bfcef19a@mail.gmail.com>	<gqiaef$dms$1@ger.gmane.org>
	<5c5e5c350903270406u79e73e71hb8092bd4e71d088d@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <5c5e5c350903270406u79e73e71hb8092bd4e71d088d@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: xmms-tremor source file is no longer available
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
X-List-Received-Date: Fri, 27 Mar 2009 11:23:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-03-09 12:06, Elena of Valhalla wrote:
> On Fri, Mar 27, 2009 at 11:40 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> On 27-03-09 11:22, Elena of Valhalla wrote:
>>> The package xmms-tremor fails in the do_fetch stage because it can't
>>> find the source tarball, is there a mirror anywhere?
>> Why isn't it fetching it from the angstrom source mirror?
>
> probably because of a proxy misconfiguration on my side, I'll check that, thanks

I've heard of people having problems with OE not trying (or succeeding) 
to use the source mirrors, and I'm curious what the problem is. The 
SRC_URI usually gets fixed to quickly so people aren't debugging 
mirroring problems :(

regards,

Koen




