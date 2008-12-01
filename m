Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L75Ep-0005FV-7Q
	for openembedded-devel@openembedded.org; Mon, 01 Dec 2008 10:39:19 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L75BZ-00063E-Vd
	for openembedded-devel@openembedded.org; Mon, 01 Dec 2008 09:35:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Dec 2008 09:35:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Dec 2008 09:35:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Dec 2008 10:35:12 +0100
Message-ID: <gh0b4g$jeq$1@ger.gmane.org>
References: <ggc0uc$kvv$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081125 Shredder/3.0b1pre
In-Reply-To: <ggc0uc$kvv$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Versioning and upgrade paths
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
X-List-Received-Date: Mon, 01 Dec 2008 09:39:52 -0000
X-List-Received-Date: Mon, 01 Dec 2008 09:39:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

this applies to '2.6.28rc6' as well:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=4ed5900e8d4a41241a6b26f530673f7815beec1e

On 23-11-08 17:38, Koen Kooi wrote:
> Hi,
>
> I noticed people adding recipes with PVs in the form of '2.6.28rc4',
> which is wrong:
>
> '2.6.28rc4' will sort higher than '2.6.28', so upgrading to the release
> from the RC will be impossible.
>
> Now some people will start arguing that kernel upgrades using a package
> manager shouldn't be done, but that's not the point. An upgrade path
> should always be provided, even if the distro/user/developer will choose
> to not use it.
>
> The wiki page about the OE versioning policy has background information
> and samples on how to contruct a proper PV:
>
> http://wiki.openembedded.net/index.php/Versioning_Policy
>
> regards,
>
> Koen




