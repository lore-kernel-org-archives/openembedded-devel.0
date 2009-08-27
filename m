Received: from [209.85.219.228] (helo=mail-ew0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MgZE9-00015q-3u
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 09:16:58 +0200
Received: by ewy28 with SMTP id 28so944497ewy.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 23:58:53 -0700 (PDT)
Received: by 10.210.135.9 with SMTP id i9mr9125925ebd.65.1251356332771;
	Wed, 26 Aug 2009 23:58:52 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-242-65.zone7.bethere.co.uk
	[94.193.242.65])
	by mx.google.com with ESMTPS id 7sm328142eyb.30.2009.08.26.23.58.51
	(version=SSLv3 cipher=RC4-MD5); Wed, 26 Aug 2009 23:58:52 -0700 (PDT)
Message-ID: <4A962EA9.8010908@xora.org.uk>
Date: Thu, 27 Aug 2009 07:58:49 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
In-Reply-To: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
Subject: Re: [oe-commits] Stanislav Brabec : glibc: Install ld.so.conf, so ldconfig does not complain .
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
X-List-Received-Date: Thu, 27 Aug 2009 07:17:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 056a67f6070c5ea561acb65049b551e24f3b7eb6
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=056a67f6070c5ea561acb65049b551e24f3b7eb6
>
> Author: Stanislav Brabec <utx@penguin.cz>
> Date:   Wed Aug 26 21:05:59 2009 +0000
>
> glibc: Install ld.so.conf, so ldconfig does not complain.
>
>   
I have the feeling this is the reversal of a previous decision to remove 
ld.so.conf from rootfs.

Also its a core change and I don't see any Acked-By:

Graeme



