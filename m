Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id C762A6148C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2013 08:56:58 +0000 (UTC)
Received: from e6520eb (unknown [82.233.81.124]) (Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3CA6D4B009B;
	Sun, 15 Dec 2013 09:56:50 +0100 (CET)
Date: Sun, 15 Dec 2013 09:56:49 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: prabhu.sundararaj@freescale.com
Message-ID: <20131215095649.51ae12b8@e6520eb>
In-Reply-To: <1387063799-2777-1-git-send-email-prabhu.sundararaj@freescale.com>
References: <1387063799-2777-1-git-send-email-prabhu.sundararaj@freescale.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser][PATCH] Chromium : update to version 33
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
X-List-Received-Date: Sun, 15 Dec 2013 08:57:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Prahbu,

Le Sat, 14 Dec 2013 17:29:59 -0600,
Prabhu Sundararaj <prabhu.sundararaj@freescale.com> a =E9crit :

> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> ---
>  .../chromium-29.0.1518.2/armv6/include.gypi        |   8 -
>  .../chromium-29.0.1518.2/armv6/oe-defaults.gypi    |  15 --
>  .../chromium-29.0.1518.2/armv7a/include.gypi       |   9 -
>  .../chromium-29.0.1518.2/armv7a/oe-defaults.gypi   |  15 --
>  .../chromium/chromium-29.0.1518.2/google-chrome    |   7 -
>  .../chromium-29.0.1518.2/google-chrome.desktop     | 222 ---------------=
------
>  .../chromium-29.0.1518.2/i586/include.gypi         |   5 -
>  .../chromium-29.0.1518.2/i586/oe-defaults.gypi     |  15 --
>  .../uninitialised-warning.patch                    |  90 ---------
>  .../chromium/chromium-29.0.1518.2/unistd-2.patch   |  27 ---
>  .../chromium-29.0.1518.2/x86-64/include.gypi       |   5 -
>  .../chromium-29.0.1518.2/x86-64/oe-defaults.gypi   |  15 --
>  recipes-browser/chromium/chromium_29.0.1518.2.bb   |  66 +-----
>  13 files changed, 6 insertions(+), 493 deletions(-)

it seems that you forget to add the files for the new version.
Please also add in the commit message how you tested the new version
(platform and tests you did).

Thanks,
Eric

