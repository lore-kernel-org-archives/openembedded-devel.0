Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P17fM-0000AK-0M
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 03:10:36 +0200
Received: by iwn2 with SMTP id 2so1779394iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:cc:content-type;
	bh=t4i0bqg4hjluFaPyu+okTBpJxVe6YkMwC2HV+Z+PwIQ=;
	b=C5hZvzbr4/3VR5O0VqD7CAy0HSirmZT1cEZYBivnOakS+MDFQn/5/aIySaBIw0Mulp
	BTddFBWIl3tfBgMEV25diRAYUffcPSza7HwM1peYuhWomgZIvWqYglEQTaJ8wxaB27fE
	+NlxL7d9rxJBWmGdhuOdBMOrbUl9wtIWAezX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=b3C3skeUB+4bqwV2ksSWytsft3PcVwdD55w0qb+raZxBVJLGWVvO7ucb3a7Na7mq87
	2TTbTyRAxPq5dhmPDZL0Tkxp0n2HzSRrk40IpeOIWnz1FXAAu68q5N9fbwvJ68ygRL7L
	sB8EctKqGGITJxH2ybl+ehimXZAxeNUF8WycQ=
MIME-Version: 1.0
Received: by 10.231.147.202 with SMTP id m10mr2781983ibv.2.1285808997521; Wed,
	29 Sep 2010 18:09:57 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Wed, 29 Sep 2010 18:09:57 -0700 (PDT)
Date: Thu, 30 Sep 2010 10:39:57 +0930
Message-ID: <AANLkTi=_yrunZt-ogeQwAW3Qua9jAvZUvEOCE8BNQsC4@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>
Subject: gdb-avr32.inc: unused file?
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
X-List-Received-Date: Thu, 30 Sep 2010 01:10:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

This file looks like it might be useful for avr32 with the v6.7.1
recipes, but isn't currently included anywhere. Is this just an
accidental omission, or is there something else going on?

-Graham


