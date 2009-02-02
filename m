Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LTxz2-000766-43
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 13:33:11 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LTxrK-0003FR-BG
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 12:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 12:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 12:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Feb 2009 13:20:37 +0100
Message-ID: <gm6oel$o0k$3@ger.gmane.org>
References: <> <1233574850-4230-1-git-send-email-John.Willis@Distant-earth.com>
	<1233574850-4230-2-git-send-email-John.Willis@Distant-earth.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <1233574850-4230-2-git-send-email-John.Willis@Distant-earth.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Add pointercal file for the omap3-pandora touchscreen.
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
X-List-Received-Date: Mon, 02 Feb 2009 12:33:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-02-09 12:40, David-John Willis wrote:
> Signed-off-by: David-John Willis<John.Willis@Distant-earth.com>
> ---
>   packages/pointercal/files/omap3-pandora/pointercal |  Bin 0 ->  45 bytes
>   1 files changed, 0 insertions(+), 0 deletions(-)
>   create mode 100755 packages/pointercal/files/omap3-pandora/pointercal

Pointercal files are plain text, so something went wrong :) Also, you 
need to bump PR on the pointercal recipe as well.

regards,

Koen

>
> diff --git a/packages/pointercal/files/omap3-pandora/pointercal b/packages/pointercal/files/omap3-pandora/pointercal
> new file mode 100755
> index 0000000000000000000000000000000000000000..8052257fb2607ce055ac42a48ac8ebe5449cdb09
> GIT binary patch
> literal 45
> tcmWN_u>k-u2m&xq;Q<Flk^e7iGbW3cvBXZD`-CC#Ux96pO3*G9iU-D)2v`6B
>
> literal 0
> HcmV?d00001
>




