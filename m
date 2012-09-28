Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1THbsy-0000uj-Rc
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 16:49:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2012 07:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,502,1344236400"; d="scan'208";a="228152275"
Received: from unknown (HELO helios.localnet) ([10.252.122.5])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2012 07:36:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Sep 2012 15:36:53 +0100
Message-ID: <9581976.YnhpzoycFe@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <1348841720-27106-1-git-send-email-raj.khem@gmail.com>
References: <1348841720-27106-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] qpf-bitstream-vera-sans-mono_1.10.bb: Fix Typo
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
X-List-Received-Date: Fri, 28 Sep 2012 14:49:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 September 2012 07:15:20 Khem Raj wrote:
> misplaced end quote
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
> b/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb index
> d84e3f7..95b6ebf 100644
> --- a/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
> +++ b/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
> @@ -2,7 +2,7 @@ require qpf.inc
> 
>  DESCRIPTION = "Bitstream Vera Monospaced Font, QPF for Qt/Embedded"
>  LICENSE = "Bitstream Vera"
> -PR = "r4"
> +PR = "r5"
> 
>  PROVIDES += "qpf-bitstream-vera-sans-mono-small"
>  PROVIDES += "qpf-bitstream-vera-sans-mono-larger"
> @@ -27,7 +27,7 @@ ${palmqtdir}/lib/fonts/verasansmono_10* \
>  	${palmqtdir}/lib/fonts/verasansmono_13* \
>  	${palmqtdir}/lib/fonts/verasansmono_14*"
>  FILES_qpf-bitstream-vera-sans-mono-large = "\
> -	${palmqtdir}/lib/fonts/verasansmono_15*" \
> +	${palmqtdir}/lib/fonts/verasansmono_15* \
>  	${palmqtdir}/lib/fonts/verasansmono_16* \
>  	${palmqtdir}/lib/fonts/verasansmono_17* \
>  	${palmqtdir}/lib/fonts/verasansmono_18* \

Merged to meta-opie master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


