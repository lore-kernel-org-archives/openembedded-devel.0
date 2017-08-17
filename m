Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65B857837B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:46:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7H9kvXl012888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 17 Aug 2017 02:46:57 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 17 Aug 2017 02:46:56 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1502959724-47472-1-git-send-email-dengke.du@windriver.com>
	<CA+chaQc_JOJyRZf_LPk0w8jSMCFG93CoimNPAAv+dnpjWPPm3Q@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <c0648e7f-842b-01ec-7a59-5ed6d383a314@windriver.com>
Date: Thu, 17 Aug 2017 17:46:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQc_JOJyRZf_LPk0w8jSMCFG93CoimNPAAv+dnpjWPPm3Q@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] c-ares: upgrade to 1.13.0
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
X-List-Received-Date: Thu, 17 Aug 2017 09:46:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

OK, thanks.


On 2017年08月17日 17:17, Martin Jansa wrote:
> There is better change for this from Alexey Firago in master-next
>
> On Thu, Aug 17, 2017 at 10:48 AM, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     Signed-off-by: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     ---
>      .../recipes-support/c-ares/{c-ares_1.12.0.bb
>     <http://c-ares_1.12.0.bb> => c-ares_1.13.0.bb
>     <http://c-ares_1.13.0.bb>}    | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>      rename meta-networking/recipes-support/c-ares/{c-ares_1.12.0.bb
>     <http://c-ares_1.12.0.bb> => c-ares_1.13.0.bb
>     <http://c-ares_1.13.0.bb>} (75%)
>
>     diff --git
>     a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
>     <http://c-ares_1.12.0.bb>
>     b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
>     <http://c-ares_1.13.0.bb>
>     similarity index 75%
>     rename from
>     meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
>     <http://c-ares_1.12.0.bb>
>     rename to meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
>     <http://c-ares_1.13.0.bb>
>     index 4e28d6a..0d9a2a4 100644
>     --- a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
>     <http://c-ares_1.12.0.bb>
>     +++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
>     <http://c-ares_1.13.0.bb>
>     @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =
>     "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
>      SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz
>     <http://c-ares.haxx.se/download/$%7BBP%7D.tar.gz> \
>                
>     file://0001-configure.ac-don-t-override-passed-cflags.patch \
>      "
>     -SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
>     -SRC_URI[sha256sum] =
>     "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
>     +SRC_URI[md5sum] = "d2e010b43537794d8bedfb562ae6bba2"
>     +SRC_URI[sha256sum] =
>     "03f708f1b14a26ab26c38abd51137640cb444d3ec72380b21b20f1a8d2861da7"
>
>      inherit autotools pkgconfig
>     --
>     2.8.1
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


