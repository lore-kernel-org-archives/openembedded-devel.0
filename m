Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 745BE6ABED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:36:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q2aDtc005547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2013 19:36:13 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 25 Jun 2013 19:36:12 -0700
Message-ID: <51CA539A.2030904@windriver.com>
Date: Wed, 26 Jun 2013 10:36:10 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1372213028.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1372213028.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/1]qt-x11-free: fix LSB Library Check libqt-mt.so.3 fail
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
X-List-Received-Date: Wed, 26 Jun 2013 02:36:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I should add layer's name in title, such as:

[oe] [meta-qt3] [PATCH 0/1]qt-x11-free: fix LSB Library Check 
libqt-mt.so.3 fail

I will resend the patch

//Hongxu


On 06/26/2013 10:32 AM, Hongxu Jia wrote:
> The following changes since commit 4c27cce6688aa39852f3cba5e7b80ec279019605:
>
>    layer.conf: avoid unnecessary early expansion with := (2013-03-19 16:33:11 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-qt3
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-adt
>
> Hongxu Jia (1):
>    qt-x11-free: add missing DEPENDS on libglu for LSB Library Check
>
>   recipes-qt3/qt3/qt-x11-free_3.3.7.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>


