Received: from goliath.siemens.de ([192.35.17.28])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PiPtg-0005xk-3x
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 12:20:16 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.12.11.20060308/8.12.11) with ESMTP id
	p0RBJTKN006324 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 12:19:29 +0100
Received: from DEMCHP99ET1MSX.ww902.siemens.net
	(demchp99et1msx.ww902.siemens.net [139.25.131.180])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id p0RBJSOL030884
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 12:19:29 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.34]) by
	DEMCHP99ET1MSX.ww902.siemens.net ([139.25.131.180]) with mapi;
	Thu, 27 Jan 2011 12:19:28 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jan 2011 12:19:27 +0100
Thread-Topic: [oe] [PATCH 2/9] packaged-staging.bbclass: improve documentation
Thread-Index: Acu9hylAwfGds9bzSvuHjSPg0u6PRQAjFwkw
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED682EB06@DEMCHP99E35MSX.ww902.siemens.net>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
	<1296065612-9637-3-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1296065612-9637-3-git-send-email-rep.dot.nop@gmail.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] packaged-staging.bbclass: improve documentation
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
X-List-Received-Date: Thu, 27 Jan 2011 11:20:16 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> +# To use the prebuilt pstage packages, save them away..
> +# $ rsync --delete -a tmp/pstage/ /there/oe/build/pstage_mirror
> +# .. and use it as mirror in your conf/local.conf:
> +# PSTAGE_MIRROR =3D "file:///there/oe/build/pstage_mirror"

This is indeed a very helpful comment, I can remember I had to spend some t=
ime before figuring this out.

Fabrice=


