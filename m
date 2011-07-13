Received: from moutng.kundenserver.de ([212.227.17.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Borutta@schoeps.de>) id 1Qgz1N-0006Fn-0e
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 14:58:33 +0200
Received: from ZEUS.schoeps.local (pd95ba764.dip0.t-ipconnect.de
	[217.91.167.100])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0LkAig-1RENKF1zuE-00bT3a; Wed, 13 Jul 2011 14:30:33 +0200
Received: from ZEUS.schoeps.local ([fe80::71f0:3b18:ef63:ee9c]) by
	ZEUS.schoeps.local ([fe80::71f0:3b18:ef63:ee9c%10]) with mapi;
	Wed, 13 Jul 2011 14:30:31 +0200
From: Christian Borutta <Borutta@schoeps.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jul 2011 14:30:15 +0200
Thread-Topic: using i2c on a mx28evk
Thread-Index: AcxBWJ5pFBYD1L5iTGuri3lGNGnqIQ==
Message-ID: <311EE95A63F86C4E960B402004EAD7E310AF74E158@ZEUS.schoeps.local>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, de-DE
MIME-Version: 1.0
X-Provags-ID: V02:K0:xnHiUBrfNmE7+FjlqSkEwN+Iok+ikP8VfoMWgJ9IqED
	A1YDaHFQXsRm5pYuVk8xeASBUUrOkBFFe8yY0Scdeq8LcZe+r0
	Zy58RoffeTfX/xVY5njtZjtLvUCPNQQeB7lORdzDTB+goT7c0E
	t+a+Rb7qaOvpj/GUk0REu6F3kbfW4IcKX+VauuZXpXrio4xzw+
	5qCSfMk/1rERQKWmSZQ3A==
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: using i2c on a mx28evk
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
X-List-Received-Date: Wed, 13 Jul 2011 12:58:33 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm running an Angstr=F6m Linux on a Freescale mx28evk board. For using the=
 i2c ports of the board I compiled and installed the packages i2c and i2c-d=
ev, but the Kernelmoduls are missing.

While booting the system sends the message:

" FATAL: Module i2c-pxa not found.
   FATAL: Module i2c-pxa not found."

I'm neither able to load the modules with modprobe nor do I find the module=
s ( I think one of them is  i2c-dev.ko) anywhere in the filesystem.

Can anybody help me solving this issue?

Christian Borutta

Schoeps Mikrofone
Schalltechnik Dr.-Ing. Schoeps GmbH
Spitalstr. 20
76227 Karlsruhe - Germany

Phone:+49 (0)721-94320-42
Fax: +49 (0)721-94320-50
www.schoeps.de

Sitz der Gesellschaft: Karlsruhe
Amtsgericht Mannheim, HRB Nr. 102442
Gesch=E4ftsf=FChrer: Ulrich Schoeps, Dr. Helmut Wittek


