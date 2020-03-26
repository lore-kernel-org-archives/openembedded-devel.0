Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.27320.1585181081339244774
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 17:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BD90940B37
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 00:04:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABp3bxHf5Gwe
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2020 00:04:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADCDA40AEE
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 00:04:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 73FAE1718F4; Wed, 25 Mar 2020 20:04:40 -0400 (EDT)
Date: Wed, 25 Mar 2020 20:04:40 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] qt3d patch failure
Message-ID: <20200326000440.GG1578@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

0001-Allow-a-tools-only-build.patch this patch no longer applies for qt3d 
after the update and fails do_patch()

-- 
Denys

