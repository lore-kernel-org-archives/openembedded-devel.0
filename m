Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 482A66011A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2015 08:07:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAL85Qqk019402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2015 00:07:13 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 21 Nov 2015 00:05:40 -0800
Message-ID: <565025D3.4020401@windriver.com>
Date: Sat, 21 Nov 2015 16:05:39 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
Reply-To: <openembedded-devel@lists.openembedded.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1448077640-5771-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1448077640-5771-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [meta-oe][PATCH] mariadb.inc: fix mysqld hung at first init time based on systemd
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
X-List-Received-Date: Sat, 21 Nov 2015 08:07:16 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2015 11:47 AM, Hongxu Jia wrote:
> +Install db at first runtime before mysqld start, rather than
> +do that at postinst, which keep sync with systemd.
> +
> +Upstream status: pending

s/Upstream status/Upstream-Status/

V2 incoming

//Hongxu

> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>


