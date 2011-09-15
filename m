Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R4DWd-0008Uy-Ri
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 17:06:51 +0200
Received: by wwf27 with SMTP id 27so3032620wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 08:01:40 -0700 (PDT)
Received: by 10.227.135.130 with SMTP id n2mr401606wbt.51.1316098900218;
	Thu, 15 Sep 2011 08:01:40 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id o16sm8206353wba.12.2011.09.15.08.01.38
	(version=SSLv3 cipher=OTHER); Thu, 15 Sep 2011 08:01:38 -0700 (PDT)
Message-ID: <4E721351.1060308@dresearch-fe.de>
Date: Thu, 15 Sep 2011 17:01:37 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316072892-27367-1-git-send-email-sledz@dresearch-fe.de>
	<1316073352-27826-1-git-send-email-sledz@dresearch-fe.de>
	<1316077506.4523.10.camel@mattotaupa>
	<4E71E760.1090105@dresearch-fe.de>
	<1316098584.4523.87.camel@mattotaupa>
In-Reply-To: <1316098584.4523.87.camel@mattotaupa>
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
X-List-Received-Date: Thu, 15 Sep 2011 15:06:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.09.2011 16:56, Paul Menzel wrote:
> Am Donnerstag, den 15.09.2011, 13:54 +0200 schrieb Steffen Sledz:
>> On 15.09.2011 11:05, Paul Menzel wrote:
>>> PS: It is hard for reviewers to see what changed in your patch iterations. For example between v3 and v4. Please add a short note below the commit message and separate that with an additional `---`. `git am` will not pick that comment up then.
>>
>> Is it possible to add such a comment while running "git format-patch" or "git send-email"?
> 
> I do not know of a way and I did not find anything in the manual. I
> guess you have to edit the mbox file created by `git format-patch` and
> then send it.

After reading the manual i found the --annotate option for "git send-email" which helped me here.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


