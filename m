Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D40A777D04
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:12:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86KCVoL001100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 13:12:32 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 13:12:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-14-git-send-email-mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <e0030319-7d51-c05a-8bc1-2b1fce5b74ca@windriver.com>
Date: Wed, 6 Sep 2017 15:12:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504725809-12825-14-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH 13/31] corosync: Requires net-snmp from meta-networking
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
X-List-Received-Date: Wed, 06 Sep 2017 20:12:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

FYI, the git mv here was incomplete.  I missed the patch.  I will send up a v2
for this commit soon.

On 9/6/17 2:23 PM, Mark Hatle wrote:
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../recipes-extended/corosync/corosync_2.4.2.bb    | 78 ++++++++++++++++++++++
>  .../recipes-extended/corosync/corosync_2.4.2.bb    | 78 ----------------------
>  2 files changed, 78 insertions(+), 78 deletions(-)
>  create mode 100644 meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
>  delete mode 100644 meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
> 

