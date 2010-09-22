Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyMf1-0006nx-PP
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 12:34:48 +0200
Received: by iwn2 with SMTP id 2so416289iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BeoUjboTCEKV9UBntcM9Kf7kIHolYIxV5VEpEy0/7R0=;
	b=wDMgbmwOqHh0sxaNQ9gC7d9U0vIEWyJN7szHtsIpYOrmnQOsSFI1kL11UuluGBfqDx
	I1rxkIaZRt8Mcic5og6rEtUBbXC35G+vobCA7rF4Wgv4Ky0lzmhJwbAMvnIqW9PHUSYX
	cdeoXwumL3n6RZkOuLJhZ6pb7i6a3v4LnReG4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XUTeK7aJSK1SaJiwAtoJiBGgfZ+y527QfC76C+5R07UVgqkb/6brdZgw7XWXK2sqq8
	8Z4i5mm1BsmeRu+N6p+cQbQIDpjNbgB3UXCW2/nstIOFYlHwb1VortTLwzcBUnUQ+RMu
	QBcRBkZHo5ROenry9tVWw1ofzRDW/ZeRaZTls=
MIME-Version: 1.0
Received: by 10.231.146.136 with SMTP id h8mr13914691ibv.0.1285151683619; Wed,
	22 Sep 2010 03:34:43 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Wed, 22 Sep 2010 03:34:43 -0700 (PDT)
In-Reply-To: <1285147099.4175.25.camel@mattotaupa>
References: <4C99473D.9020308@gmail.com> <1285147099.4175.25.camel@mattotaupa>
Date: Wed, 22 Sep 2010 20:04:43 +0930
Message-ID: <AANLkTikm2_KzqZ+hYcQ6HC_V+J3FegTXgDRXpxVsPKH=@mail.gmail.com>
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
Subject: Re: [PATCH] u-boot-env.bb: Mark as COMPATIBLE_MACHINE=neuros-osd2.
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
X-List-Received-Date: Wed, 22 Sep 2010 10:34:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

This recipe fails to build for all machines except neuros-osd2.


