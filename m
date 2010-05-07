Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1OAOYf-0000B5-4T
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 16:29:42 +0200
Received: by wyf22 with SMTP id 22so822576wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=52/faT+bP4vqKJgK0WtwtEze4K1rC9SxVjFjaeJRmxA=;
	b=heOn8YPtDVporcRX53szbeOYR6tTa8I59b22x7CMCEw5JhYzB4yzwgCDppIOAshLvP
	IcyDxV4RgqqaICS9J5NQira12U4OpC9V1zJerrIolgn59OTy6BArYXE6Z2qWAbw3uNZv
	MLlyrfpQXo1ypvPUo8HxhT1kWVhhe1FsTbSQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=B4fkQXBlomncxXCWpxabJTQVzeLq4VquVgHY+rrLV2XWsu/uJtCRdxDo80sC0RIuIW
	B1NZcpFr5UlYNsU3aUZ3+ZZ8JSL2OGGCeOZCel2nU4TpI1N8KzQnPas83t+LVGgUU6Vs
	yb+WRew7XTIuaSjuqRrwhcJo2A7a4J6uY7GgM=
MIME-Version: 1.0
Received: by 10.227.138.72 with SMTP id z8mr80167wbt.209.1273242351366; Fri, 
	07 May 2010 07:25:51 -0700 (PDT)
Received: by 10.216.39.83 with HTTP; Fri, 7 May 2010 07:25:51 -0700 (PDT)
In-Reply-To: <hs16qi$ph5$1@dough.gmane.org>
References: <1273239992-13847-1-git-send-email-mchazaux@adeneo-embedded.com>
	<hs16qi$ph5$1@dough.gmane.org>
Date: Fri, 7 May 2010 16:25:51 +0200
Message-ID: <u2nbc36f8ed1005070725x31daea3frb4fc5b4f70f0d2c0@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add i.MX51 based "Babbage" board support
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
X-List-Received-Date: Fri, 07 May 2010 14:29:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2010/5/7 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Looks pretty good to me, altough I don't think xf86-video-omapfb will
> work on imx51:

Wow, sorry about that, I'll correct it and resubmit.

Regards,

Mickael Chazaux

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


