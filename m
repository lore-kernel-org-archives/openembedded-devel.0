Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MbFsL-0005u4-6v for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 17:36:29 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MbFcQ-0001eo-OR for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 15:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 15:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 15:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 12 Aug 2009 17:14:57 +0200
Message-ID: <h5um9j$ioq$3@ger.gmane.org>
References: <91283b620908120702l24e9f2fbre7a778266d1d993d@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <91283b620908120702l24e9f2fbre7a778266d1d993d@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: linux-omap3_git.bb - SRC_URI_append list error????
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
X-List-Received-Date: Wed, 12 Aug 2009 15:36:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-09 16:02, Stuart Gray wrote:
> Hi,
>
> The Bitbake file named above includes reference to a file which I think
> should not be included within this .bb file.
>
> Can someone with experience of compiling the kernel and an in-depth
> knowledge of what should be included have a look at this and let me know if
> it is correct. I think the correct Bitbake file that it should be include
> within in is the linux-omap3_2.6.30.bb where it is also included.
>
> The line in question is:
>
>             file://rc8-to-final.diff;patch=1 \

There are no such files in OE, please file this with $vendor where you 
got those from.

regards,

Koen




