Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DDAF73824
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 14:14:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t22EEUAN006410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Mar 2015 06:14:30 -0800 (PST)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Mar 2015 06:14:30 -0800
Message-ID: <54F47045.4080503@windriver.com>
Date: Mon, 2 Mar 2015 09:14:29 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
X-Originating-IP: [128.224.56.84]
Subject: Discuss: ruby-1.9.x EOL -- someone to add ruby-2.2?
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
X-List-Received-Date: Mon, 02 Mar 2015 14:14:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


As stated in the post below, ruby-1.9.3 is no longer supported
and CVEs will not be released.

I'm not a rubyist but I assume we should upgrade to ruby-2.2.0 which
became the stable version as of December 25, 2014. Comments?
Martin, you are listed as maintainer of the meta-multimedia,
do you have any concerns about such an upgrade?

If anyone wants to start work on this for meta-oe, that'd be great.
If no one gets around to it, then a developer from WindRiver will
likely be able to work on it but not a few months.

../Randy

---
As of today, all support for Ruby 1.9.3 has ended. Bug and security 
fixes from more recent Ruby versions will no longer be backported to 1.9.3.

This end of life was announced over a year ago.

We highly recommend that you upgrade to Ruby 2.0.0 or above as soon as 
possible. Please contact us if you’d like to continue maintaining the 
1.9.3 branch or if for some reason you can’t upgrade.

Posted by Olivier Lacan on 23 Feb 2015
---
Also see:
https://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200 Ottawa, Ontario, 
Canada K2K 2W5

