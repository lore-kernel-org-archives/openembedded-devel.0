Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqATm-00063f-H4
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 19:48:14 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KqAOn-0002gC-Fj
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 17:43:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 17:43:05 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 17:43:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Oct 2008 19:42:57 +0200
Message-ID: <gd5a32$e5v$1@ger.gmane.org>
References: <gd58r2$940$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <gd58r2$940$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: OABI compat in EABI kernels
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
X-List-Received-Date: Wed, 15 Oct 2008 17:48:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-2008 19:21, Koen Kooi wrote:
> Hi,
>
> Kernels based on linux.inc (as all kernels should be in an ideal world)
> as well as kernels based on linux-rp.inc now have a switch to turn off
> OABI compat:
>
> ARM_KEEP_OABI = "0"
>
> The default is "1", so there's no change unless your distro sets it to
> "1" (as angstrom does).
>
> Enjoy the new legacy free kernels :)

Slightly related: atheros released their HAL as opensource, so madwifi 
doesn't need the blob and associated whackelf horrors anymore :)

regards,

Koen



