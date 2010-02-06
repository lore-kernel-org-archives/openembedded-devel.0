Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Ndtp0-0007EO-Pc
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 00:12:17 +0100
Received: by ewy4 with SMTP id 4so98358ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Feb 2010 15:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=6S0bbcosbcG3yF0F45xXyp9L/UkxZC7o6RiCDQ5pgdY=;
	b=UzGLIb+2Rw/izlnodxeBsCNUoWHHzlIk7mSbG9ITJ345AH3Pel0tIyjzc+FwPVLv78
	f8LrNMFO93GduGKtCSuh+6GTt/4t88uU5xw7PxzjQUSa5T/9EgGHBexxAov9HA9nsazZ
	PfaSAuCxHDkNTUIihr+3uSo7pCJU/QEI5LkHs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=CFh4bZXKU/uyspEfbEJn4VmooqNGjtYZ2NLOPB0INLukw4bqiEeQ0QSNbKySu6R4ZY
	0sw4MplISMGqAFpQBpFd6aQ2ZS85RrAyIeIv+eyvdWlKLxeeEywpwcBvaQmRNEIxe37F
	bBqNCtAbiS9yR+bQ4lmR5ccYylaZ1UYSqwhUw=
MIME-Version: 1.0
Received: by 10.213.109.140 with SMTP id j12mr854015ebp.84.1265497784278; Sat, 
	06 Feb 2010 15:09:44 -0800 (PST)
In-Reply-To: <20100201234729.GB2493@xora-build.xora.org.uk>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<201001172258.25258.jay4mail@gmail.com>
	<d1b08f941001171559w5ae011a6u61715d0fd236046@mail.gmail.com>
	<d1b08f941001220212v588c5f9bvbf2a149660a86898@mail.gmail.com>
	<hjceds$nsr$2@ger.gmane.org>
	<d1b08f941001281450o3dc53131je7168dbfbca9c1c8@mail.gmail.com>
	<d1b08f941002011024p60f08708xbb56a3293fe73dba@mail.gmail.com>
	<d1b08f941002011357y4285709w44dbed0b4e2c4b87@mail.gmail.com>
	<hk7nl6$rik$1@ger.gmane.org>
	<20100201234729.GB2493@xora-build.xora.org.uk>
Date: Sun, 7 Feb 2010 00:09:44 +0100
Message-ID: <d1b08f941002061509y424103c3sa00e993c0deb485e@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and tosa
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
X-List-Received-Date: Sat, 06 Feb 2010 23:12:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ok, I committed the fix to updater.sh, now bumped to r24.
Painfully enough, I got mixed reports about unsuccessfull flashing
(no reboot) with the latest 2.6.33-rc6 lzma-compressed kernels on C700
and C1000:

C5600 ?

C700 KO
C750 OK
C860 OK
C1000 KO
C3000 OK
C3100 ?
C3200 OK
6000* ?

Pls help testing missing models.
Thx

Andrea


