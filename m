Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9996D284
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 11:23:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Mar 2014 03:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,577,1389772800"; d="scan'208";a="492780900"
Received: from dmilliga-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.25])
	by orsmga002.jf.intel.com with ESMTP; 03 Mar 2014 03:23:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 03 Mar 2014 11:23:26 +0000
Message-ID: <1748419.6oFelAcfi5@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.5-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <1393844393-22037-1-git-send-email-net147@gmail.com>
References: <1393844393-22037-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCH] cmake: rename .bbappend to match new version from OE-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2014 11:23:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 March 2014 21:59:53 Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../{cmake-native_2.8.12.1.bbappend => cmake-native_2.8.12.2.bbappend}    |
> 0 .../cmake/{cmake_2.8.12.1.bbappend => cmake_2.8.12.2.bbappend}           
> | 0 2 files changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-devtools/cmake/{cmake-native_2.8.12.1.bbappend =>
> cmake-native_2.8.12.2.bbappend} (100%) rename
> recipes-devtools/cmake/{cmake_2.8.12.1.bbappend => cmake_2.8.12.2.bbappend}
> (100%)
> 
> diff --git a/recipes-devtools/cmake/cmake-native_2.8.12.1.bbappend
> b/recipes-devtools/cmake/cmake-native_2.8.12.2.bbappend similarity index
> 100%
> rename from recipes-devtools/cmake/cmake-native_2.8.12.1.bbappend
> rename to recipes-devtools/cmake/cmake-native_2.8.12.2.bbappend
> diff --git a/recipes-devtools/cmake/cmake_2.8.12.1.bbappend
> b/recipes-devtools/cmake/cmake_2.8.12.2.bbappend similarity index 100%
> rename from recipes-devtools/cmake/cmake_2.8.12.1.bbappend
> rename to recipes-devtools/cmake/cmake_2.8.12.2.bbappend

Sigh... could we please fix this in OE-Core instead of meta-qt5 carrying around 
a bbappend for a core recipe?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

