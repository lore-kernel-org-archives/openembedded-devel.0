Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L0gWB-00018F-UK
	for openembedded-devel@openembedded.org; Thu, 13 Nov 2008 19:02:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L0gU9-0000Ah-6x
	for openembedded-devel@openembedded.org; Thu, 13 Nov 2008 18:00:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 13 Nov 2008 18:00:05 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Nov 2008 18:00:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 Nov 2008 18:59:54 +0100
Message-ID: <gfhpuq$ntq$1@ger.gmane.org>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>	<gf76q2$le2$1@ger.gmane.org>
	<49184199.90100@balister.org>
	<200811131743.18880.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081112 Shredder/3.0b1pre
In-Reply-To: <200811131743.18880.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] checksums.ini: correct wrong checksums
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
X-List-Received-Date: Thu, 13 Nov 2008 18:02:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13-11-2008 17:43, Marcin Juszkiewicz wrote:
> Monday 10 of November 2008 15:13:45 Philip Balister napisał(a):
>
>> I'd like to see one commit per checksum change with the details in
>> the commit message. This we we can easily find when I package
>> checksum changed. This way we can easily identifu when the source
>> changed but the version number did not.
>
> I have 1212 new entries for checksums.ini file. Do you want 1212 commits
> or just one?
>
> How I got such amount? Simple - account on machine with FastEthernet
> hooked to the Internet + some hours of shell/bitbake work:

It got upgraded to gigabit a while ago :)

regards,

Koen



