Received: from mail-ey0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PTsj1-0001cO-Im
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 10:05:12 +0100
Received: by eyf5 with SMTP id 5so618759eyf.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 01:05:10 -0800 (PST)
Received: by 10.213.33.201 with SMTP id i9mr2075249ebd.92.1292663110275;
	Sat, 18 Dec 2010 01:05:10 -0800 (PST)
Received: from mozart.localnet (95-29-187-197.broadband.corbina.ru
	[95.29.187.197])
	by mx.google.com with ESMTPS id b52sm930387eei.7.2010.12.18.01.05.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 18 Dec 2010 01:05:09 -0800 (PST)
Sender: Yury Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Dec 2010 12:04:59 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.4; x86_64; ; )
References: <201012181131.27436.jay4mail@gmail.com>
In-Reply-To: <201012181131.27436.jay4mail@gmail.com>
MIME-Version: 1.0
Message-Id: <201012181204.59955.jay4mail@gmail.com>
Subject: Re: e2fsprogs do_install failed ('uuid' absence)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Dec 2010 09:05:14 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

> Hello!
> 
> Most of my tonight's build was failed because of e2fsprogs.
> Bitbake master, latest OE tree.

Seems Koen have fixed it by 
7e7399ec335116a87b14720427c95f2dfc4b0c00 e2fsprogs: fix do_install breakages

-- 
Yury Bushmelev


