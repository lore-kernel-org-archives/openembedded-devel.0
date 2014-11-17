Return-Path: <wd@denx.de>
X-Greylist: delayed 470 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Nov 2014 12:30:20 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 346D26A9FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 12:30:20 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jh8Yd5pr9z3hjQt;
	Mon, 17 Nov 2014 13:22:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3jh8Yd5B8zzvdWd;
	Mon, 17 Nov 2014 13:22:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.184])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id iVHPcqv3A8xu; Mon, 17 Nov 2014 13:22:27 +0100 (CET)
X-Auth-Info: PJOMQeY+8Xj7qN7gV3j1ox91bVBLg8p/rmRv+jRMifs=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Mon, 17 Nov 2014 13:22:25 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 11E0E1A2419;
	Mon, 17 Nov 2014 13:22:25 +0100 (CET)
Received: from gemini.denx.de (localhost [IPv6:::1])
	by gemini.denx.de (Postfix) with ESMTP id D41DB3814FF;
	Mon, 17 Nov 2014 13:22:24 +0100 (MET)
To: openembedded-devel@lists.openembedded.org,
	Li xin <lixin.fnst@cn.fujitsu.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <1416222008-9218-4-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1416222008-9218-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1416222008-9218-4-git-send-email-lixin.fnst@cn.fujitsu.com>
Comments: In-reply-to Li xin <lixin.fnst@cn.fujitsu.com>
	message dated "Mon, 17 Nov 2014 19:00:06 +0800."
Date: Mon, 17 Nov 2014 13:22:24 +0100
Message-Id: <20141117122224.D41DB3814FF@gemini.denx.de>
Subject: Re: [PATCH 3/5] sblim-sfcb : add new recipe
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
X-List-Received-Date: Mon, 17 Nov 2014 12:30:28 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Li xin,

In message <1416222008-9218-4-git-send-email-lixin.fnst@cn.fujitsu.com> you wrote:
> Sfcb(Small Footprint CIM Broker)is a CIM server conforming to the
> CIM Operations over HTTP protocol.
> It is robust, with low resource consumption and therefore specifically
> suited for embedded and resource constrained environments.
> sfcb supports providers written against the Common Manageability
> Programming Interface (CMPI).
> 
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../recipes-extended/sblim-sfcb/files/sfcb.service |  11 +++
>  ...000sblim-sfcb-disable_auto_service_start1.patch |  19 +++++
>  .../sblim-sfcb-1.3.4/cimv217Final-MOFs.zip.org     | Bin 0 -> 1259176 bytes

Are you sure you want to include this huge binary blob?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Just because your doctor has a name for your condition  doesn't  mean
he knows what it is.

