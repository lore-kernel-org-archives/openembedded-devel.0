Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OLtW1-0000HV-CC
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 09:46:45 +0200
Received: by gwb20 with SMTP id 20so1975035gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xiFDwiKbmJakgkR09CauGmZShDa7I1ZiZhKG9+Jmgb0=;
	b=KqXu+iLOSi7mNc65heeZ6vjVcbJdZ8temSEeocNVdrEuTUAH/7PSiOsrkG63YxJwj7
	FB332U3SMBU8vy8BtoVR+bpGDj+ClaGK1GHunBRtPTe04+jWAtSpd654WbF4GaUUDMw4
	uJUaIWcByYpiG1aahCypJ/0l2W1ZhChz8SMqI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lYmlHN364KTX4lQhvYpiHXuaMa3eGc9HM2ZfljwlDURpQ9bcXvN4OSaLXWxZmEt0TI
	AWN2S0ReVmJsbfXap20Kd9UKOZ0nChzKa6c02v9/jQY3jdOQmEIU5o9PHzwMed/60vPt
	HEXVGMal7U9EWoHDmKiDhTDFV0hOl5eiwQYjY=
MIME-Version: 1.0
Received: by 10.90.46.17 with SMTP id t17mr7845460agt.146.1275982919021; Tue, 
	08 Jun 2010 00:41:59 -0700 (PDT)
Received: by 10.90.88.14 with HTTP; Tue, 8 Jun 2010 00:41:58 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CF93@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF93@KCINPUNHJCMS01.kpit.com>
Date: Tue, 8 Jun 2010 09:41:58 +0200
Message-ID: <AANLkTikH4eGT4ZqBHeL1aiNjwOyNJaETz5Skex_sYo2a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ERROR: Please set the 'PERSISTENT_DIR
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
X-List-Received-Date: Tue, 08 Jun 2010 07:46:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/8 Soumya R <Soumya.R@kpitcummins.com>:
> Hi All ,
>
> =A0 I am getting the error while configuring the bitbake
> [root@fedora12 bitbake-1.8.18]# bitbake nano
> ERROR: Please set the 'PERSISTENT_DIR' or 'CACHE' variable.
> I got the sources of the bitbake and gave following commands
> python setup.py build
> python setup.py install
>
> =A0Please help me out to resolve this error..

I suggest following the instructions:
http://wiki.openembedded.net/index.php/Getting_Started
guess your local.conf is not ok or not present at all.
Google has plenty of pages on this (and some actually carry answers :-) )

FM


