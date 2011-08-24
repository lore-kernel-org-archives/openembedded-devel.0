Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1QwCrq-0007cV-Ed
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 14:47:38 +0200
Received: (qmail 16962 invoked by uid 2404007); 24 Aug 2011 12:36:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 24 Aug 2011 12:36:14 -0000
Message-ID: <4E54F03E.3040806@juszkiewicz.com.pl>
Date: Wed, 24 Aug 2011 14:36:14 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E54DA89.2080105@dresearch-fe.de>
	<4E54EF12.2010100@dresearch-fe.de>
In-Reply-To: <4E54EF12.2010100@dresearch-fe.de>
X-Enigmail-Version: 1.2.1
Subject: Re: upstart vs. task-proper-tools
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
X-List-Received-Date: Wed, 24 Aug 2011 12:47:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 24.08.2011 14:31, Steffen Sledz pisze:
> BTW:
> What is the exact meaning/purpose/use of task-proper-tools?

Replace busybox components by full versions. Was made years ago and then
updated by several people. While working for BugLabs company I used it
to create rootfs without busybox.

> The list contains a lot of tools with existing alternatives (e.g. syslog-ng vs. rsyslog or pump vs. dhcpcd).

Then propose change which will allow to install one of them only at time?


