Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QwEbY-0002G5-Um
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 16:38:56 +0200
Received: by bkbzu17 with SMTP id zu17so1012183bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 07:34:10 -0700 (PDT)
Received: by 10.204.141.25 with SMTP id k25mr2273872bku.44.1314196450401;
	Wed, 24 Aug 2011 07:34:10 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id n9sm304834bkd.40.2011.08.24.07.34.07
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 07:34:07 -0700 (PDT)
Message-ID: <4E550BDE.6010401@dresearch-fe.de>
Date: Wed, 24 Aug 2011 16:34:06 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E54DA89.2080105@dresearch-fe.de>
	<4E54EF12.2010100@dresearch-fe.de>
	<4E54F03E.3040806@juszkiewicz.com.pl>
In-Reply-To: <4E54F03E.3040806@juszkiewicz.com.pl>
X-Enigmail-Version: 1.3.1
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
X-List-Received-Date: Wed, 24 Aug 2011 14:38:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.08.2011 14:36, Marcin Juszkiewicz wrote:
> W dniu 24.08.2011 14:31, Steffen Sledz pisze:
>> BTW:
>> What is the exact meaning/purpose/use of task-proper-tools?
> 
> Replace busybox components by full versions. Was made years ago and then
> updated by several people. While working for BugLabs company I used it
> to create rootfs without busybox.
> 
>> The list contains a lot of tools with existing alternatives (e.g. syslog-ng vs. rsyslog or pump vs. dhcpcd).
> 
> Then propose change which will allow to install one of them only at time?

Sorry, but my knowledge is not sufficient to do this. I've no idea how to reference u-a related tools here.

Who can help?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


