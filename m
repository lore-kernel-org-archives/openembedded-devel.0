Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF4360017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 15:28:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 05 Aug 2015 08:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,618,1432623600"; d="scan'208";a="536524342"
Received: from igurvich-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.22.90])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2015 08:28:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 05 Aug 2015 16:28 +0100
Message-ID: <5725889.eDmdfnME8h@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1438787621-12632-1-git-send-email-Martin.Jansa@gmail.com>
References: <1438787621-12632-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH] dhcp: fix parsing warning
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
X-List-Received-Date: Wed, 05 Aug 2015 15:28:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 August 2015 17:13:41 Martin Jansa wrote:
> * fixes:
>   WARNING: Variable key FILES_-client (/dhclient /dhclient-script
> /dhcp/dhclient.conf) replaces original key FILES_dhcp-client (
> /system/dhclient.service).

Yuck - is that really what it's printing, i.e. all variable references blank?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

