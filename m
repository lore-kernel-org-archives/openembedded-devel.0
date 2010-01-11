Received: from mail-pz0-f185.google.com ([209.85.222.185])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NU8V7-0003FW-2I
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 01:51:24 +0100
Received: by pzk15 with SMTP id 15so12835206pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 16:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=qWx20Or52osiPx3Dx18GpQTVGASNAkMvF3/g27h+MaI=;
	b=ZcFS1t02dcMClsjU7rwlXsy8W3UqI5UTAy31LbFrbqvKVuFCCRpxvDlhg3jAwhHNNd
	WbX+SowsOVxsFI04xafiLr2LWklPzkGJQGeQ6ZmMnLuXUg4z9n5eihf0CQWsLfpYMJa2
	SzE/b02i0D8m30vTGBGJu8on4DqamwkR1vQ0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wMb2yyxg+Brt3PJwG9Z3TF8Y7Fsznq3pS6f6/uGUNTgfst54NYdGq9IEnJClEMJ2nU
	wq6OkAyxHaupNP4nc1i2pDZ90DZrTrLE9Dylu2c/thFUlQTCTtY6KyEU6ImFtPkKVMk1
	VhArETyd+PBW3HbvCB+eKzEFZaPliHvzMp1lo=
MIME-Version: 1.0
Received: by 10.142.74.8 with SMTP id w8mr16076244wfa.192.1263170951998; Sun, 
	10 Jan 2010 16:49:11 -0800 (PST)
In-Reply-To: <19c1b8a91001092315o183ad3f5t1870ba1e0bbdbf9c@mail.gmail.com>
References: <alpine.LFD.2.00.1001091915010.6810@localhost>
	<19c1b8a91001092315o183ad3f5t1870ba1e0bbdbf9c@mail.gmail.com>
Date: Mon, 11 Jan 2010 11:19:11 +1030
Message-ID: <6ec4247d1001101649j22ca897h5b28be68d038ce7f@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: still unable to "bitbake e2fsprogs"
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
X-List-Received-Date: Mon, 11 Jan 2010 00:51:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

This is an upstream bug in the e2fsprogs makefiles. It looks fixed the
most recent version, 1.41.9.

-Graham


