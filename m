Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ3MF-0005sP-92
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:36:07 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ3BX-0002sU-Ew
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 10:25:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:25:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:25:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:12:06 +0200
Message-ID: <h1q696$a5v$3@ger.gmane.org>
References: <200906230939.34062.marcin@juszkiewicz.com.pl>
	<1245747353-27218-3-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747353-27218-3-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 049/125] Documentation for PACKAGE_ARCH is actually for PACKAGE_ARCHS
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
X-List-Received-Date: Tue, 23 Jun 2009 10:36:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:55, Marcin Juszkiewicz wrote:
> From: Mario Domenech Goulart<mario@ossystems.com.br>
>
> Signed-off-by: Mario Domenech Goulart<mario@ossystems.com.br>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   docs/usermanual/reference/class_rootfs_ipkg.xml |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/docs/usermanual/reference/class_rootfs_ipkg.xml b/docs/usermanual/reference/class_rootfs_ipkg.xml
> index 98e6e25..fde8a38 100644
> --- a/docs/usermanual/reference/class_rootfs_ipkg.xml
> +++ b/docs/usermanual/reference/class_rootfs_ipkg.xml
> @@ -114,7 +114,7 @@
>       </varlistentry>
>
>       <varlistentry>
> -<term>PACKAGE_ARCH</term>
> +<term>PACKAGE_ARCHS</term>
>
>         <listitem>
>           <para>Defines the list of architectures that are support by the target




