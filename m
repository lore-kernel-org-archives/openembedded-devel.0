Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1O7ehg-00034i-8w
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 03:07:45 +0200
Received: by pxi14 with SMTP id 14so3289499pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 18:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=3rksOY7/cW9ZY1NfHyO/uuIH3gEshNk4HKkJCK/3axs=;
	b=pDUIQkZcoE5M/bGOEHTv/1vUHWaWGG2GOR7i9q45E2roxBmC5yNxYl0JxAFQixFpMv
	yO4sN0jAx4ZrW61fg/u0YA4fdHeC+fy/lmEa4sJWze514OV4v6nsTdMc2eVB0BeLhzBx
	ALegX8Sqv5d9DNw6QS1JcJHr+N+c+akaFu9Kk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=DHwgFGf5vf5aoQyaGVeNe+yH8fsN0/K6SGPKa9uwCHYTSjnyY6wjtk4mJ+XDgrD0g7
	ksP36SXrM6nd6lXMVwc0HpfFSEvpb2CLvmGwHbIzHvctPmgEeH7G5GBcqT8WbC13EsXH
	GpvJSCp9iQppyiZEgMYLLA3E7OvO8M8wQmWnY=
MIME-Version: 1.0
Received: by 10.141.107.9 with SMTP id j9mr247116rvm.177.1272589436369; Thu, 
	29 Apr 2010 18:03:56 -0700 (PDT)
Received: by 10.140.143.10 with HTTP; Thu, 29 Apr 2010 18:03:56 -0700 (PDT)
Date: Thu, 29 Apr 2010 22:03:56 -0300
Message-ID: <k2y88e33d221004291803s3610117bod20cc0a55e2fd917@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: status of canadian cross
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
X-List-Received-Date: Fri, 30 Apr 2010 01:07:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Is possible to openembedded create a canadian cross?

My build machine is a x86_64 but I need to create a sdk to run x86
(i586) and my MACHINE=3Darm.

I created a x86_64-sdk. How can I build a x86-sdk? It's possible?

I am using the dev branch. This is not documented in official docs,
yet. And I can't discovery if this feature is supported.

In other words, Is possible to build on machine A(x86_64), target to
C(ARM) and host to B (i586).

Thanks
--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br


