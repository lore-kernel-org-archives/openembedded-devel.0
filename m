Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D30D6011D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 03:14:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAU3EmF0010076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Nov 2015 19:14:49 -0800 (PST)
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Sun, 29 Nov 2015 19:14:48 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1448615050.git.yi.zhao@windriver.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <565BBF25.3030104@windriver.com>
Date: Mon, 30 Nov 2015 11:14:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1448615050.git.yi.zhao@windriver.com>
X-Originating-IP: [128.224.162.175]
Subject: Re: [meta-oe][PATCH 0/1] fltk: upgrade 1.1.10 to 1.3.3
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
X-List-Received-Date: Mon, 30 Nov 2015 03:14:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore this patch because it's built failed for qemuppc. I will 
check it.

Thanks,
Yi

在 2015年11月27日 17:09, Yi Zhao 写道:
> The following changes since commit ea319464b673cbf9a416b582dc4766faeb998430:
>
>    vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, dv1394, svg, svgdec (2015-11-16 21:50:11 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib yzhao/fltk-upgrade
>    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/fltk-upgrade
>
> Yi Zhao (1):
>    fltk: upgrade from version 1.1.10 to 1.3.3
>
>   .../fltk/fltk-1.1.10/disable_test.patch            |   13 -----
>   .../fltk/fltk-1.1.10/libpng15.patch                |   61 --------------------
>   .../recipes-support/fltk/fltk/disable_test.patch   |   11 ++++
>   .../fltk/{fltk-1.1.10 => fltk}/dso-fix.patch       |    0
>   .../fltk/fltk/fix-boolean-issue-with-jpeg9.patch   |   38 ++++++++++++
>   .../fltk-no-freetype-config.patch                  |   14 +++--
>   .../fltk/{fltk_1.1.10.bb => fltk_1.3.3.bb}         |   22 ++++---
>   7 files changed, 71 insertions(+), 88 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/disable_test.patch
>   delete mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
>   create mode 100644 meta-oe/recipes-support/fltk/fltk/disable_test.patch
>   rename meta-oe/recipes-support/fltk/{fltk-1.1.10 => fltk}/dso-fix.patch (100%)
>   create mode 100644 meta-oe/recipes-support/fltk/fltk/fix-boolean-issue-with-jpeg9.patch
>   rename meta-oe/recipes-support/fltk/{fltk-1.1.10 => fltk}/fltk-no-freetype-config.patch (57%)
>   rename meta-oe/recipes-support/fltk/{fltk_1.1.10.bb => fltk_1.3.3.bb} (51%)
>


