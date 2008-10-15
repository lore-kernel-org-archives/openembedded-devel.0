Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqCb8-0005XB-Om
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 22:03:58 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KqCW9-00009S-8I
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 19:58:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 19:58:49 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 19:58:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Oct 2008 21:58:40 +0200
Message-ID: <gd5i1h$frs$1@ger.gmane.org>
References: <200810151022.38477.zecke@selfish.org>	<200810152016.25038.zecke@selfish.org>
	<gd5cg8$osk$1@ger.gmane.org> <200810152153.52020.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <200810152153.52020.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 20:03:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-2008 21:53, Holger Freyther wrote:
> On Wednesday 15 October 2008 20:24:07 Koen Kooi wrote:
>
>> I'm undecided about putting the linker stuff in angstrom.inc vs.
>> angstroom-<libc>.inc. Go for what you think is best :)
>
> Google couldn't tell me if uclibc supports GNU style hashes, so I only change
> eglibc and glibc... happy rebuilding and I'm sorry when I broke things.
>
> I decided to land now as PRs are changing all the time and keeping up with
> things is pretty hard...

You did change a S-O-B to an A-B, which AIUI is not how it should work. 
Time to update teh commit policy to include SOB and ABs?

regards,

Koen



