Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UE013-00042O-F6
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 17:19:31 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 46AE3CA9324
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2013 17:02:56 +0100 (CET)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 839B54B019C;
	Fri,  8 Mar 2013 17:02:49 +0100 (CET)
Date: Fri, 8 Mar 2013 17:02:47 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130308170247.30dfa092@e6520eb>
In-Reply-To: <1362746826-22762-1-git-send-email-laurentiu.palcu@intel.com>
References: <1362746826-22762-1-git-send-email-laurentiu.palcu@intel.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-browser][PATCH 0/1] chromium: add support for x86-64
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
X-List-Received-Date: Fri, 08 Mar 2013 16:19:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

Le Fri,  8 Mar 2013 14:47:05 +0200,
Laurentiu Palcu <laurentiu.palcu@intel.com> a =C3=A9crit :
> I gave chromium a test on x86 architecture and, apparently, there was no
> support for x86-64. So, I added it (didn't do much actually, just copied
> the i586 gypi files and changed the target_arch to x64), built
> core-image-sato for qemux86-64, and ran chrome. It worked just fine.
>=20
> I also removed gtk+-native from the dependencies (there's no need for
> the native gtk) and added gtk+ instead (this one is needed).
>=20
thanks I splitted the change in 2 patches and pushed it.

Eric


