Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JPgdu-0004oW-1K
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2008 17:08:58 +0100
Received: by fk-out-0910.google.com with SMTP id 18so459093fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2008 08:08:49 -0800 (PST)
Received: by 10.82.165.13 with SMTP id n13mr978273bue.30.1203005328788;
	Thu, 14 Feb 2008 08:08:48 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Thu, 14 Feb 2008 08:08:48 -0800 (PST)
Message-ID: <74d0deb30802140808k4258f05bgdc37602c16448d4d@mail.gmail.com>
Date: Thu, 14 Feb 2008 17:08:48 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47B463E8.303@student.utwente.nl>
MIME-Version: 1.0
References: <E1JPfZq-0006fI-Ky@linuxtogo.org>
	<74d0deb30802140736j45e629dfr717549c267c0db53@mail.gmail.com>
	<47B463E8.303@student.utwente.nl>
Subject: Re: [oe-commits] org.oe.dev angstrom 2008: start lockdown file based on openmoko versions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2008 16:08:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 14, 2008 at 4:53 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
>  Hash: SHA1
>
>  pHilipp Zabel schreef:
>
> | On Thu, Feb 14, 2008 at 4:00 PM, koen commit
>
>
> |>   #Prefer a newer GTK+ and friends
>  |>  -PREFERRED_VERSION_gtk+                 = "2.12.3"
>  |>  -PREFERRED_VERSION_glib-2.0              = "2.14.4"
>  |>  -PREFERRED_VERSION_pango                 = "1.18.1"
>  |>  +PREFERRED_VERSION_gtk+                 ?= "2.12.3"
>  |>  +PREFERRED_VERSION_glib-2.0              ?= "2.14.4"
>  |>  +PREFERRED_VERSION_pango                 ?= "1.18.1"
>  |
>  | Why the change to ?= and why are those not in -preferred-versions.inc?
>
>  Because they will be in the -preferred-versions.inc in the future
>  (volunteers?).

:) Good, so it's just for historical reasons?
I think I just volunteered involuntarily, then.

regards
Philipp


