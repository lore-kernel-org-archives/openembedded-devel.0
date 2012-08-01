Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Swi1Z-0007DU-I9
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 01:08:17 +0200
Received: by ggnp4 with SMTP id p4so7173773ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=R6R8IBx6Cno+hiAbegy4mCI+h7mZd1Lgf5estXrzmw8=;
	b=zIJsPdjSda/S7ZVf9wwheVsPHBSL1R+mZwxSPc3CXgxYJvK0VQFcjDi1+L9rYM4sfy
	UulA24vmlWnk3gk9kP4DKfKJ9o/GTOnUyor4QZborY47wVuhHwoRBDwoqBVFVoqQCh2Y
	u36jcUEEyhgjxT4SJuijcMVF8Hn9hhs5X/CHFKBUBqPfa0XdDUpGYfJJyDE84FS7cJ8X
	62Wn26xI1z2jo2hhVXo4NZ1GIccJb+ItWDkcHAKAZv7iioiGe8IsvGjBUCjL4cXRk38V
	JCq5G14Eg6zBlO0cfnGKac6f2UwKfDDOIAPguj+Jjwr9BWfaPKiIywI+Eb/tYzqzPJUn
	z/DA==
Received: by 10.42.145.7 with SMTP id d7mr667578icv.45.1343861798235;
	Wed, 01 Aug 2012 15:56:38 -0700 (PDT)
Received: from [10.11.81.126] (corp.force10networks.com. [64.186.164.204])
	by mx.google.com with ESMTPS id yh10sm16389207igb.0.2012.08.01.15.56.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:56:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <jvbgus$ove$1@dough.gmane.org>
Date: Wed, 1 Aug 2012 15:56:34 -0700
Message-Id: <BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1485)
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Wed, 01 Aug 2012 23:08:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2012, at 8:11 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

>>=20
>> Along with upgrade use the release tarballs instead of git
>=20
> For an update we need to pull in some patches from master, so a git =
recipe
> is still the preferred way.

OK, you know more about it then me but do you know how many those will =
be ?
in other words does systemd releases mean much for stability yet or =
still
its a project moving at so fast pace ?

I see that releases are rolled out almost every month, that sort of =
could mean
either way, we wait until the next release or just take from a commit =
upstream

I feel like staying with a release+patches could be one way if we are =
not importing
pathes too often. but I don't know how often that would be. For the =
testing I did
release worked well for those platforms x86, ppc and arm=


