Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1USlWW-0000rS-GZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 11:53:03 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id BE9264B01D0;
	Thu, 18 Apr 2013 11:35:22 +0200 (CEST)
Date: Thu, 18 Apr 2013 11:35:21 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130418113521.3713e0f8@e6520eb>
In-Reply-To: <20130418084437.GM26007@jama>
References: <1366104524-13236-1-git-send-email-ml@communistcode.co.uk>
	<20130418084437.GM26007@jama>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>, martin.jansa@gmail.com
Subject: Re: [meta-oe][PATCH] Hiawatha: update to 9.0, add systemd support
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
X-List-Received-Date: Thu, 18 Apr 2013 09:53:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le Thu, 18 Apr 2013 10:44:37 +0200,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

>  http://hiawatha-webserver.org/files/hiawatha-9.0.tar.gz

I can confirme that the sha256 is false :

> +SRC_URI[md5sum] =3D "8abc4f85dbb9a76ed66e7f35de520064"
> +SRC_URI[sha256sum] =3D "e40119afb050b11737250c08d89ac7ba7472645738a48c06=
aa79979a19729fc" =20

here I also get :
5e40119afb050b11737250c08d89ac7ba7472645738a48c06aa79979a19729fc
as you get on jenkins.

Eric


