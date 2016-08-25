Return-Path: <ml@embed.me.uk>
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 80C767017B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:04:04 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id C7289DC8F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:04:03 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <1472063392-11490-1-git-send-email-raj.khem@gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <e6c87ae1-ca1d-895c-adb3-6c2b75abaaa9@embed.me.uk>
Date: Thu, 25 Aug 2016 10:03:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472063392-11490-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH] imagemagick: Upgrade 7.0.3 release to patch level 9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Aug 2016 09:04:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/16 19:29, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

7.0.3?

>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> index 472e42d..604a848 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> @@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
>   # Important note: tarballs for all patchsets within a version are deleted when
>   # a new pachset is created. To avoid multiple patches for each patchset, try to
>   # update to the last pachset of a version
> -PATCHSET = "7"
> +PATCHSET = "9"
>   SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
>   "
> -SRC_URI[md5sum] = "bd66b19bd6fc3d320bd8d51869c874f9"
> -SRC_URI[sha256sum] = "1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
> +SRC_URI[md5sum] = "2720ab8c480019f79e717b0237570311"
> +SRC_URI[sha256sum] = "22df4f197985f36f77b7b0d44de92ff44415885045f0191b3319540bdc82ff53"
>   
>   S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>   


