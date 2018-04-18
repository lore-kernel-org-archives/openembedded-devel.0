Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8EF6011A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 06:51:05 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w3I6p5H5029943
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 08:51:06 +0200
Received: from [167.87.67.246] ([167.87.67.246])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w3I6p5s6008750
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 08:51:05 +0200
To: openembedded-devel@lists.openembedded.org
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <88609bfc-f9db-8487-a3bf-523687b2b307@siemens.com>
Date: Wed, 18 Apr 2018 08:51:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
Subject: [meta-openwrt] systemd units for OpenWRT components
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
X-List-Received-Date: Wed, 18 Apr 2018 06:51:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Dear meta-openwrt maintainers

I'm currently trying to use several OpenWRT components as standalone services.
During this process I added some Systemd units for them.

Is this something that would be accepted in the meta-openwrt layer?
If not I would have to put this into a separate layer which seems to increase the maintenance effort.

Regards
Pascal

