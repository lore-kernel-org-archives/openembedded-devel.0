Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TxcFD-0008Uo-0C
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 12:42:24 +0100
Message-ID: <50FE777C.1070705@communistcode.co.uk>
Date: Tue, 22 Jan 2013 11:26:52 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1358853824-30022-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1358853824-30022-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [PATCH] jansson: update to 2.4 Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
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
X-List-Received-Date: Tue, 22 Jan 2013 11:42:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/01/13 11:23, ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> ---
>   meta-oe/recipes-extended/jansson/{jansson_2.3.1.bb => jansson_2.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-extended/jansson/{jansson_2.3.1.bb => jansson_2.4.bb} (69%)
>
> diff --git a/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb b/meta-oe/recipes-extended/jansson/jansson_2.4.bb
> similarity index 69%
> rename from meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
> rename to meta-oe/recipes-extended/jansson/jansson_2.4.bb
> index 8c7a11e..811c830 100644
> --- a/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
> +++ b/meta-oe/recipes-extended/jansson/jansson_2.4.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6946b728e700de875e60ebb453cc3a20"
>   
>   SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
>   
> -SRC_URI[md5sum] = "28848fbc02d7657d930f97ce74f80d93"
> -SRC_URI[sha256sum] = "5f2ebf63580c73cc115634861b5da1c919499dde37d2e73b16e28b0c8ddc3921"
> +SRC_URI[md5sum] = "c4629b89bf0432f3158c461e88fe0113"
> +SRC_URI[sha256sum] = "1fcbd1ac3d8b610644acf86a5731d760bb228c9acbace20a2ad0f23baec79b41"
>   
>   inherit autotools pkgconfig
>   

Borked the commit. v2 incoming.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



