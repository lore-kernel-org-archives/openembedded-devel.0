Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TbTXO-0007mf-Ra
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 10:57:38 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1794122bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 01:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QD6p6VX01nD2bqz5PXfw8m3Fqn6hy68uF45dx4tLerM=;
	b=UMplrS6Eunn/qUfjSnFUpnx76gYSomaNAt0t9ty7ZmHxiS1NlJMN7hbJwPyaDLR6Kr
	Q8o0z6CG9Kr0uG+Y+Og1vo1RD87fVy+zQmXVi0Zjpn7OBAv+M4Ap8OJ/FuWtUpDy6X+z
	+Kq/UVqfMX1AN6nLAXFKiFzVACQiV1XGFt8YVxuGfu4AylJ0PuWPPUNnlI6iHZxKm9oP
	7UcDFvsazzL8dtuirZTu7K+RBm24uXBjODDjRSJA8ODZIXrPrJZofnO8S8PzJokOAx3d
	0CbUafmMreNW57hj1MaxP62vSB8kvC1T2GUp2kdJVCPL0/GPaQE69uXPL3XKq/GTTlxF
	cJ7Q==
Received: by 10.204.4.131 with SMTP id 3mr1073206bkr.25.1353577412316;
	Thu, 22 Nov 2012 01:43:32 -0800 (PST)
Received: from [172.20.0.22] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id y11sm1764106bkw.8.2012.11.22.01.43.30
	(version=SSLv3 cipher=OTHER); Thu, 22 Nov 2012 01:43:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1353575947-8283-1-git-send-email-eric@eukrea.com>
Date: Thu, 22 Nov 2012 10:43:29 +0100
Message-Id: <0A03D7F4-9D4D-4EC5-920D-996A27C21E79@dominion.thruhere.net>
References: <1353575947-8283-1-git-send-email-eric@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlCdZ000DO3cEnwDbuIu+tv0i/Jpiabt0DqxAc3qOvy5gFJlN8Y0NC91VD8NpDkVTCf6AQd
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][danny][PATCH] README: update to danny
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
X-List-Received-Date: Thu, 22 Nov 2012 09:57:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 22 nov. 2012, om 10:19 heeft Eric B=E9nard <eric@eukrea.com> het =
volgende geschreven:

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

It still list me as maintainer for a lot of layers, but let's get this =
in first:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta-efl/README        |    8 ++++----
> meta-gpe/README        |    8 ++++----
> meta-initramfs/README  |    6 +++---
> meta-multimedia/README |    8 ++++----
> meta-networking/README |    5 ++++-
> meta-oe/README         |    6 +++---
> meta-systemd/README    |    8 ++++----
> meta-webserver/README  |    7 +++++--
> meta-xfce/README       |    8 ++++----
> toolchain-layer/README |    6 +++---
> 10 files changed, 38 insertions(+), 32 deletions(-)
>=20
> diff --git a/meta-efl/README b/meta-efl/README
> index 62daa0a..2e3df9f 100644
> --- a/meta-efl/README
> +++ b/meta-efl/README
> @@ -1,15 +1,15 @@
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> -Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-efl]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-efl][danny]' in the subject'
>=20
> -When sending single patches, please using something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-efl][PATCH'
> +When sending single patches, please using something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-efl][danny][PATCH'
>=20
> Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
> diff --git a/meta-gpe/README b/meta-gpe/README
> index 220f031..f8e8255 100644
> --- a/meta-gpe/README
> +++ b/meta-gpe/README
> @@ -1,15 +1,15 @@
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> -Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-gpe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-gpe][danny]' in the subject'
>=20
> -When sending single patches, please using something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-gpe][PATCH'
> +When sending single patches, please using something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-gpe][danny][PATCH'
>=20
> Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index 8430555..99702d4 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -12,7 +12,7 @@ Dependencies
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
>=20
> @@ -20,9 +20,9 @@ Maintenance
> -----------
>=20
> Send patches / pull requests to =
openembedded-devel@lists.openembedded.org
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][danny]' in the subject.
>=20
> -When sending single patches, please using something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-initramfs][PATCH'
> +When sending single patches, please using something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-initramfs][danny][PATCH'
>=20
> Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
>                    Paul Eggleton <paul.eggleton@linux.intel.com>
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index 0e85179..f6008ca 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,16 +1,16 @@
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> URI: git://git.openembedded.org/meta-openembedded/meta-oe
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> -Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-multimedia]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-multimedia][danny]' in the subject'
>=20
> -When sending single patches, please use something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-multimedia][PATCH
> +When sending single patches, please use something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-multimedia][danny][PATCH
>=20
> You are encouraged to fork the mirror on github =
https://github.com/openembedded/meta-oe/ to share your patches, this is =
preferred for patch sets consisting of more than one patch. Other =
services like gitorious, repo.or.cz or self hosted setups are of course =
accepted as well, 'git fetch <remote>' works the same on all of them. We =
recommend github because it is free, easy to use, has been proven to be =
reliable and has a really good web GUI.
>=20
> diff --git a/meta-networking/README b/meta-networking/README
> index 438f442..949d0e2 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -18,7 +18,7 @@ Dependencies
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> Maintenance
> @@ -26,3 +26,6 @@ Maintenance
>=20
> Please see the MAINTAINERS file for information on contacting the
> maintainers of this layer, as well as instructions for submitting =
patches.=20
> +
> +When sending single patches, please using something like
> +'git send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-networking][danny][PATCH'
> diff --git a/meta-oe/README b/meta-oe/README
> index 4226c29..08ee07f 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -1,12 +1,12 @@
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> -Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-oe][danny]' in the subject'
>=20
> -When sending single patches, please use something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-oe][PATCH'
> +When sending single patches, please use something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-oe][danny][PATCH'
>=20
> You are encouraged to fork the mirror on github =
https://github.com/openembedded/meta-oe/ to share your patches, this is =
preferred for patch sets consisting of more than one patch. Other =
services like gitorious, repo.or.cz or self hosted setups are of course =
accepted as well, 'git fetch <remote>' works the same on all of them. We =
recommend github because it is free, easy to use, has been proven to be =
reliable and has a really good web GUI.
>=20
> diff --git a/meta-systemd/README b/meta-systemd/README
> index 84578b5..ad4fe5f 100644
> --- a/meta-systemd/README
> +++ b/meta-systemd/README
> @@ -1,13 +1,13 @@
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> And we're working to break the dependency on this one:
>=20
> URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> To make BBMASK'ing per layer possible the following directory =
structure is
> @@ -15,9 +15,9 @@ used:
>=20
> $[LAYERDIR}/<layer =
name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappend
>=20
> -Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-oe][meta-systemd]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-oe][meta-systemd][danny]' in the subject'
>=20
> -When sending single patches, please use something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-oe][meta-systemd][PATCH'
> +When sending single patches, please use something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-oe][meta-systemd][danny][PATCH'
>=20
> You are encouraged to fork the mirror on github =
https://github.com/openembedded/meta-oe/ to share your patches, this is =
preferred for patch sets consisting of more than one patch. Other =
services like gitorious, repo.or.cz or self hosted setups are of course =
accepted as well, 'git fetch <remote>' works the same on all of them. We =
recommend github because it is free, easy to use, has been proven to be =
reliable and has a really good web GUI.
>=20
> diff --git a/meta-webserver/README b/meta-webserver/README
> index 47136fb..83be7d2 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -12,7 +12,7 @@ Dependencies
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
>=20
> @@ -21,7 +21,10 @@ Maintenance
> -----------
>=20
> Send patches / pull requests to =
openembedded-devel@lists.openembedded.org
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][danny]' in the subject.
> +
> +When sending single patches, please using something like
> +'git send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-webserver][danny][PATCH'
>=20
> Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 88f2332..6aafb4b 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,11 +1,11 @@
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: danny
> revision: HEAD
> meta-xfce depends on meta-oe and meta-multimedia in this repository.
>=20
> @@ -14,8 +14,8 @@ this to local.conf:
>=20
> BBMASK =3D "meta-xfce/recipes-multimedia"
>=20
> -Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-xfce][danny]' in the subject'
>=20
> -When sending single patches, please using something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-xfce][PATCH'
> +When sending single patches, please using something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-xfce][danny][PATCH'
>=20
> Interim layer maintainer: Andreas M=FCller =
<schnitzeltony@googlemail.com>
> diff --git a/toolchain-layer/README b/toolchain-layer/README
> index 5996b6c..127983a 100644
> --- a/toolchain-layer/README
> +++ b/toolchain-layer/README
> @@ -1,12 +1,12 @@
> This layer depends on:
>=20
> URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: danny
> revision: HEAD
>=20
> -Send pull requests to openembedded-devel@lists.openembedded.org with =
'[meta-oe][toolchain-layer]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with =
'[toolchain-layer][danny]' in the subject'
>=20
> -When sending single patches, please use something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dmeta-oe][toolchain-layer][PATCH'
> +When sending single patches, please use something like 'git =
send-email -1 --to openembedded-devel@lists.openembedded.org =
--subject-prefix=3Dtoolchain-layer][danny][PATCH'
>=20
> You are encouraged to fork the mirror on github =
https://github.com/openembedded/meta-oe/ to share your patches, this is =
preferred for patch sets consisting of more than one patch. Other =
services like gitorious, repo.or.cz or self hosted setups are of course =
accepted as well, 'git fetch <remote>' works the same on all of them. We =
recommend github because it is free, easy to use, has been proven to be =
reliable and has a really good web GUI.
>=20
> --=20
> 1.7.7.6
>=20



