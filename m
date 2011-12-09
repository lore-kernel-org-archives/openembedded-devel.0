Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RZ09p-0000h9-KE
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 14:06:33 +0100
Received: by wgbdt12 with SMTP id dt12so3697367wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 04:59:43 -0800 (PST)
Received: by 10.180.101.132 with SMTP id fg4mr10700861wib.26.1323435582204;
	Fri, 09 Dec 2011 04:59:42 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id
	et20sm12480999wbb.15.2011.12.09.04.59.40
	(version=SSLv3 cipher=OTHER); Fri, 09 Dec 2011 04:59:41 -0800 (PST)
Message-ID: <4EE2063C.6030401@dresearch-fe.de>
Date: Fri, 09 Dec 2011 13:59:40 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ED376D1.9010701@dresearch-fe.de>
	<1322481540-26151-1-git-send-email-sledz@dresearch-fe.de>
	<1322481540-26151-2-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1322481540-26151-2-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH v2] live555: replace version 20110314 with 20111120
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
X-List-Received-Date: Fri, 09 Dec 2011 13:06:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.11.2011 12:59, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/live555/live555_20110314.bb |    8 --------
>  recipes/live555/live555_20111120.bb |    7 +++++++
>  2 files changed, 7 insertions(+), 8 deletions(-)
>  delete mode 100644 recipes/live555/live555_20110314.bb
>  create mode 100644 recipes/live555/live555_20111120.bb
> 
> diff --git a/recipes/live555/live555_20110314.bb b/recipes/live555/live555_20110314.bb
> deleted file mode 100644
> index 44664d2..0000000
> --- a/recipes/live555/live555_20110314.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require live555.inc
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "ff65b2c598e970b4b6c8219a1811de00"
> -SRC_URI[sha256sum] = "c6ce050a7f9f69901e6f7f81a6745c82d9419e3904a753b2d5db1139caaf6738"
> -
> -
> diff --git a/recipes/live555/live555_20111120.bb b/recipes/live555/live555_20111120.bb
> new file mode 100644
> index 0000000..f6c4f63
> --- /dev/null
> +++ b/recipes/live555/live555_20111120.bb
> @@ -0,0 +1,7 @@
> +require live555.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI[md5sum] = "8e5ebefdf7d12ca9cfd7175ff3d7eef2"
> +SRC_URI[sha256sum] = "695cf22d43516f082e26ee9eb8373a0ae3b4ed472f1e224b51d881219f694f2e"
> +

pushed

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


