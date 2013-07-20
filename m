Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 5E83E601AF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 13:49:31 +0000 (UTC)
Received: from e6520eb (unknown [90.84.144.98]) (Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 18BCBA6271;
	Sat, 20 Jul 2013 15:49:25 +0200 (CEST)
Date: Sat, 20 Jul 2013 15:49:23 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: stefan@datenfreihafen.org
Message-ID: <20130720154923.7f559faf@e6520eb>
In-Reply-To: <1374266831-2316-1-git-send-email-stefan@datenfreihafen.org>
References: <1374266831-2316-1-git-send-email-stefan@datenfreihafen.org>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qtbase-native_5.0.2: Also use gcc 4.8 fix for the native package.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Jul 2013 13:49:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Le Fri, 19 Jul 2013 21:47:11 +0100,
Stefan Schmidt <stefan@datenfreihafen.org> a =C3=A9crit :

> When running on a host with gcc 4.8 we run into a compile problem with st=
ricter
> gcc. This was already fixed for the target packages so we only re-use the=
 patch.
>=20
that's already fixed :
https://github.com/meta-qt5/meta-qt5/commit/75291e7614115dc89045fcf6650bbde=
ad071da03

Eric

