Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LaBML-0008UG-Iw
	for openembedded-devel@openembedded.org; Thu, 19 Feb 2009 17:02:45 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LaBK8-00076Z-17
	for openembedded-devel@openembedded.org; Thu, 19 Feb 2009 16:00:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 19 Feb 2009 16:00:28 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 19 Feb 2009 16:00:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 19 Feb 2009 17:00:18 +0100
Message-ID: <gnjvmj$a1k$1@ger.gmane.org>
References: <20090219135607.3D71A18935A@amethyst.openembedded.net>	<200902191515.02208.mickey@vanille-media.de>	<gnjtr8$2a0$1@ger.gmane.org>
	<499D7D13.9060808@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <499D7D13.9060808@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Carsten Haitzler (Raster) : libgles-omap3: add comments on how to get the gles binary files to help
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
X-List-Received-Date: Thu, 19 Feb 2009 16:02:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-02-09 16:38, Philip Balister wrote:
> Koen Kooi wrote:
>> On 19-02-09 15:15, Michael 'Mickey' Lauer wrote:
>>> Please back this one out as it seems out of bounds!
>
> Something looks funny. cgit shows two commits with same message, but
> different content. The instructions appear to be in both commits.
>
> Mind you, this is just from a quick look.

Ah, it seems git commit --amend doesn't work if you do it twice, once 
adding the bogus changes and once removing them.
I kept looking at the first commit and couldn't figure out what was so 
objectionable about the instructions for downloading the SGX SDK.

regards,

Koen



