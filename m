Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R3qlc-0002oh-J2
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 16:48:48 +0200
Received: by bke11 with SMTP id 11so1540066bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 07:43:38 -0700 (PDT)
Received: by 10.204.156.4 with SMTP id u4mr3103639bkw.68.1316011418021;
	Wed, 14 Sep 2011 07:43:38 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id b17sm449302bkd.8.2011.09.14.07.43.36
	(version=SSLv3 cipher=OTHER); Wed, 14 Sep 2011 07:43:36 -0700 (PDT)
Message-ID: <4E70BD97.4060401@dresearch-fe.de>
Date: Wed, 14 Sep 2011 16:43:35 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1315920550-3977-1-git-send-email-sledz@dresearch-fe.de>
	<1315925466.4195.58.camel@mattotaupa>
	<4E6FB151.2030701@dresearch-fe.de>
	<4E70BA87.2010304@dresearch-fe.de>
	<1316010999.6686.108.camel@mattotaupa>
In-Reply-To: <1316010999.6686.108.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] eglibc-2.9: allow building with newer GNU make
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
X-List-Received-Date: Wed, 14 Sep 2011 14:48:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.09.2011 16:36, Paul Menzel wrote:
>>>> The patch header is missing [1].
>>>
>>> Hmmm? After reading [1] i could not find what exactly is missing.
>>
>> Does the guidelines require that the patch files itself (make-3.82.patch in this case) need a header (in addition to the commit comment)?
> 
> Yes, that is correct.

It would be very helpful if [1] could be modified in a way that makes clear that it talk about to separate things: the commit message *and* the patch header.

This was totally unclear for me after reading it.

>> If yes, how do i create such a header? Normally i create the patch with "diff -Nurd".
>>
>> If no, please enlighten me what is required?
> 
> You can add any text to a diff file above a `---` I think. `patch` can
> handle that. But there should be some example in the repositories.

OK, i'll create a new version of the commit.

Steffen

[1] http://openembedded.org/index.php?title=Commit_Patch_Message_Guidelines

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


