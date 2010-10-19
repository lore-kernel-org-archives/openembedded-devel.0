Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P86MI-0003at-QP
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 09:11:44 +0200
Received: by iwn2 with SMTP id 2so2179747iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=FKY8z5bfRXk4XPrg4mJndeY1MbrCp8Oqn6Yr840XiIQ=;
	b=viikidQB9Lho71fMmHzofQFXXWfliOFuKHjXCTFg9jX/hz+SJ3syBVmB9vLklbfoHI
	eOkTpwJbS2sm255tWihMVUvMl+2b0vVrTmMC4jSar4jqeKZ8Y55fUe9yYrzr0tsTwL5S
	2LQiI9bWygYiY900snUImOiAbHvEfrJhh/RVs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=IjP2GeCr9B1Uh4RdqVKQPmvNTte++D1c5cgSviLkjUZeEWKyF+tw89anE1QJBZXiua
	9AWjakGO9CBT0KzBMEMMClWwEJw0fpAK8cZIVPx7yYYbAZQxWLpP5eGGZmaHJhBtt1+0
	L4kFyHpYo7blok0lkjXm/Kh8YIq2zyZg+DXIQ=
MIME-Version: 1.0
Received: by 10.42.218.65 with SMTP id hp1mr1713760icb.30.1287472269359; Tue,
	19 Oct 2010 00:11:09 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 00:11:09 -0700 (PDT)
Date: Tue, 19 Oct 2010 09:11:09 +0200
Message-ID: <AANLkTi=BRC8V5VRWuBKac750eoS79eeBtaiyDOYGwzgo@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-gumstix-2.6.15 & gumstix_2.6.5-gnalm1: removed outdated recipes
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
X-List-Received-Date: Tue, 19 Oct 2010 07:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Could not easily reply to the message because it was so long (gmail
took ages) but:

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Ash, do you have commit access, or does someone needs to push this for you?


