Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id AFB266081A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2013 06:11:16 +0000 (UTC)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 31C01A627D;
	Mon, 27 May 2013 08:11:09 +0200 (CEST)
Date: Mon, 27 May 2013 08:11:08 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130527081108.023bd128@e6520eb>
In-Reply-To: <1369604103-31315-2-git-send-email-raj.khem@gmail.com>
References: <1369604103-31315-1-git-send-email-raj.khem@gmail.com>
	<1369604103-31315-2-git-send-email-raj.khem@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 2/2] chromium: Add recipes for 29.0.1518
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
X-List-Received-Date: Mon, 27 May 2013 06:11:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Sun, 26 May 2013 14:35:03 -0700,
Khem Raj <raj.khem@gmail.com> a =C3=A9crit :

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: Eric B=C3=A9nard <eric@eukrea.com>
> CC: Denis Carikli <denis@eukrea.com>
> CC: Otavio Salvador <otavio@ossystems.com.br>
>=20
> ---
>  .../chromium-29.0.1518.2/armv6/include.gypi        |  8 ++
>  .../chromium-29.0.1518.2/armv6/oe-defaults.gypi    | 15 ++++
>  .../chromium-29.0.1518.2/armv7a/include.gypi       |  9 +++
>  .../chromium-29.0.1518.2/armv7a/oe-defaults.gypi   | 15 ++++
>  .../chromium-29.0.1518.2/i586/include.gypi         |  5 ++
>  .../chromium-29.0.1518.2/i586/oe-defaults.gypi     | 15 ++++
>  .../uninitialised-warning.patch                    | 90 ++++++++++++++++=
++++++
>  .../chromium/chromium-29.0.1518.2/unistd-2.patch   | 27 +++++++
>  .../chromium-29.0.1518.2/x86-64/include.gypi       |  5 ++
>  .../chromium-29.0.1518.2/x86-64/oe-defaults.gypi   | 15 ++++
>  recipes-browser/chromium/chromium_29.0.1518.2.bb   | 72 +++++++++++++++++
>  11 files changed, 276 insertions(+)

both pushed to master.

Thanks
Eric

