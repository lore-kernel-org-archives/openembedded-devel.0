Return-Path: <pascal.bach@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF7F731C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 05:59:08 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id u5T5x5xn006491
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 07:59:05 +0200
Received: from [139.22.41.162] ([139.22.41.162])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id u5T5x48e023291
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 07:59:05 +0200
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <64fedf2a-0ac7-1c88-fb2e-132ad5cd5690@siemens.com>
Date: Wed, 29 Jun 2016 07:59:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
Subject: [meta-qt5] Update master to Qt 5.7 release
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
X-List-Received-Date: Wed, 29 Jun 2016 05:59:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello


The meta-qt5 master is currently on a pre release of 5.7.
I would like to update it to the final Qt 5.7 release.

I saw that the commit of the latest update involved a lot of changes across many files including updates of patches.

Now before I go and try to change everything manually, I want to ask how this is usually done?
Is there a script or something?

Regards
Pascal


