Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6A160168
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 15:41:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2015 08:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,458,1427785200"; d="scan'208";a="728416061"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2015 08:41:41 -0700
Message-ID: <555B59D4.80304@linux.intel.com>
Date: Tue, 19 May 2015 18:42:12 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-ruby] proposal: moving ruby to oe-core
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
X-List-Received-Date: Tue, 19 May 2015 15:41:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello meta-ruby maintainers,

I am trying to update webkit-gtk in oe-core to latest upstream version 
(it's fallen badly out of date), and that requires having ruby during 
build time. So I would like to propose that ruby recipes are moved to 
oe-core, and you keep maintaining them there. How does it sound to you?

Regards,
Alexander

