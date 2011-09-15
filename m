Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R4AbC-0003Yb-W5
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 13:59:24 +0200
Received: by wyh5 with SMTP id 5so1018462wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 04:54:11 -0700 (PDT)
Received: by 10.227.199.16 with SMTP id eq16mr1116745wbb.48.1316087651127;
	Thu, 15 Sep 2011 04:54:11 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPS id fp5sm7561824wbb.2.2011.09.15.04.54.09
	(version=SSLv3 cipher=OTHER); Thu, 15 Sep 2011 04:54:10 -0700 (PDT)
Message-ID: <4E71E760.1090105@dresearch-fe.de>
Date: Thu, 15 Sep 2011 13:54:08 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316072892-27367-1-git-send-email-sledz@dresearch-fe.de>
	<1316073352-27826-1-git-send-email-sledz@dresearch-fe.de>
	<1316077506.4523.10.camel@mattotaupa>
In-Reply-To: <1316077506.4523.10.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v4] linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from recent kernel
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
X-List-Received-Date: Thu, 15 Sep 2011 11:59:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.09.2011 11:05, Paul Menzel wrote:
> PS: It is hard for reviewers to see what changed in your patch iterations. For example between v3 and v4. Please add a short note below the commit message and separate that with an additional `---`. `git am` will not pick that comment up then.

Is it possible to add such a comment while running "git format-patch" or "git send-email"?

Or is it necessary to mix this into the commit comment itself?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


