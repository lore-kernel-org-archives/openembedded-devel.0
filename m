Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Olz7q-0000zp-9F
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 09:01:22 +0200
Received: by fxm6 with SMTP id 6so854819fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 00:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=l39qcRrjFsjAJlS/bSGqzbM9edWTzzBJftkzR6nRVpY=;
	b=UHF2q4ua+UXYHz2HOL57wJzW2h4iGQYdTJ6jZmBJ6SoUtx00auW4LTrKc++l0xKQ83
	h9zsNm7cFvAPgn/d0vF8whQ2kk8C/kDqS6wceBJC5LwctDG6q9KtG0Yq5Z7r1zgsdNAa
	M7lnteXMZxxGCEThiIE6lcGNDW9jPY6dUtNS4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=sVSbn5ByrLUAZBXVCYIrK6ug+JC4m7S4aEx9hAlUHNreXEEk3meUG2AhPr10AmZfVQ
	q2Wl5WTRgOkt+cF9tzdHxTz405Ctfzxjme2Tu8XVu/JjmvVteO34hREri7GdTkpzscL6
	z7piujaJdbML4HpSyCcfFEW6jpF6gX0aA1Y1E=
Received: by 10.223.122.6 with SMTP id j6mr8768105far.78.1282201260173; Thu,
	19 Aug 2010 00:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Thu, 19 Aug 2010 00:00:40 -0700 (PDT)
In-Reply-To: <AANLkTikW7eaRS4Ov0n9eT+_0qgU1E=8Q_3+P2SRN3eRo@mail.gmail.com>
References: <1282198749-25911-1-git-send-email-coolaj86@gmail.com>
	<AANLkTin1LNj80zSFxs81euO+0gw2bEA-JCpkx8s04FLh@mail.gmail.com>
	<AANLkTikW7eaRS4Ov0n9eT+_0qgU1E=8Q_3+P2SRN3eRo@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 19 Aug 2010 01:00:40 -0600
Message-ID: <AANLkTik8Qtn7YiVNcXthaPD2Eac-TaM3c-D+-hEa0RaC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] removed duplicate node recipe
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
X-List-Received-Date: Thu, 19 Aug 2010 07:01:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

the e-mail entitled

[patch] added a .bb for node.js

is is the correct way to add a new recipe?

