Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QTwTQ-0007Ln-8s
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 15:37:37 +0200
Received: by wwi18 with SMTP id 18so2384916wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=nB+MUqhnml75gPWk/2ZD5mEiXPTaHhm5PLrX8w7aytc=;
	b=ZREwhXp+911lzQ98OlZMyg5H7jIDIxAQJF3pcnjNtFHYte5o915gg1GOiNmwqcOu46
	HSK158+HOsigQwy4WlCUfMf+p4pOOnv345QYSgmwBE9jTZMlzPDem2rlS+iHGQtUQP7a
	bfa2cqiCCDwYoocC5LAOJs+7sjPQN8uk4BY3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=EXlZGjeKO387T52QfuX1qMtn3TKaQWsKZL62O9UwqE5inL/zwbjSAdtkuA9KaGMvVl
	KX1ANjLEEKBGnUP6fiIVUPbLQwW1T+ZlytV6UkSfbEds0F9Zf5YuYuPx2ORUExnNn/pi
	kBP5rW2eUZAoEO73pMBFJjGibCoKXad0QxSUQ=
Received: by 10.227.176.136 with SMTP id be8mr6381124wbb.18.1307453658273;
	Tue, 07 Jun 2011 06:34:18 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id fm14sm3561605wbb.24.2011.06.07.06.34.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 06:34:17 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Tue, 7 Jun 2011 15:34:13 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20110607153413.03b2a478@guibc>
In-Reply-To: <20110607130953.GB23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110607124151.GA23137@jama.jama.net>
	<20110607145713.4ff067a0@guibc>
	<20110607130953.GB23137@jama.jama.net>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Tue, 07 Jun 2011 13:37:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


> > > the 2 patches in linphone-3.1.0 look self-explanatory, are they
> > > applied upstream?
> I'm talking about those in linphone-3.1.0 dir
> OE @ ~ $ ls dev/recipes/linphone/linphone-3.1.0/
> fix.unused.variable.patch  preferences-segv.patch

I see ;)

These patches are present upstream.


