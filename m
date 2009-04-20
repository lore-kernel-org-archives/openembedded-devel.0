Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lvwzm-0008D9-45
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 19:09:27 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LvwvX-00064y-8C
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:05:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 17:05:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 17:05:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 20 Apr 2009 18:34:33 +0200
Message-ID: <gsi86p$ec5$8@ger.gmane.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-9-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240241104-21935-9-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 1/1] checksums.ini: added checksum for util-linux-ng 2.13.1
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
X-List-Received-Date: Mon, 20 Apr 2009 17:09:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>


On 20-04-09 17:25, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<hrw@openembedded.org>
>
> ---
>   conf/checksums.ini |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 948a4bf..051057d 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -23186,6 +23186,10 @@ sha256=b8e499b338ce9fbd1fb315194b26540ec823c0afc46c9e145ac7a3e38ad57e6b
>   md5=af9d9e03038481fbf79ea3ac33f116f9
>   sha256=b8e499b338ce9fbd1fb315194b26540ec823c0afc46c9e145ac7a3e38ad57e6b
>
> +[http://kernel.org/pub/linux/utils/util-linux-ng/v2.13/util-linux-ng-2.13.1.tar.bz2]
> +md5=424badc1832e4b5291a2ec04e9e244f4
> +sha256=e67d86683adef0855220b6f5a4b7ca2c51a15faa142e2ecd69925ede76854a4d
> +
>   [http://kernel.org/pub/linux/utils/util-linux-ng/v2.14/util-linux-ng-2.14.tar.bz2]
>   md5=23f227da49df36f33fe47e917e332cd8
>   sha256=7736d8d7d3b39654e350416585b3e00af9f55670cce8b3dddd2c2494cbaae81c




