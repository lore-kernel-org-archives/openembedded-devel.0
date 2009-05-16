Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5Qlw-00043k-R4
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 22:46:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5Qf6-00064A-VV
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 20:39:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 20:39:16 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 20:39:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 16 May 2009 22:39:05 +0200
Message-ID: <gun899$7t9$1@ger.gmane.org>
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] xserver-kdrive-common: fixed xTs_Calibrate script name.
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
X-List-Received-Date: Sat, 16 May 2009 20:46:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-05-09 22:16, Ihar Hrachyshka wrote:
> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   .../xserver-kdrive-common_0.1.bb                   |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
> index 33c0a40..a6fbc6d 100644
> --- a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
> +++ b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
> @@ -9,9 +9,9 @@ SRC_URI = "\
>     file://Xserver \
>     file://Xsession \
>     \
> -  file://30xTs_Calibrate \
>     file://60xXDefaults \
>     file://90xXWindowManager \
> +  file://98xTs_Calibrate \
>     "
>   S = "${WORKDIR}"
>
> @@ -22,9 +22,9 @@ etcFiles = "\
>     Xsession \
>     "
>   sessionFiles = "\
> -  30xTs_Calibrate \
>     60xXDefaults \
>     90xXWindowManager \
> +  98xTs_Calibrate \
>     "
>
>   do_install() {




