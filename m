Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RatL8-0007Ss-Ob
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 19:14:03 +0100
Received: by qcqw6 with SMTP id w6so665021qcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2011 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=2It0Sivka0fVI937nezyNQ68bN4vDQrwk0q2/BWqz1g=;
	b=SC9iXCLXeSuyI8OGJFk2wm1xYLEMP/D8Xtq4CZQzBiigP7xT2Ie+E3ejAYPwyJ5qXj
	1dKYVDWAIIyLTy3b+qCVYvw5OgM45IfaHHTjqlMSiFWnR9hB4bxd6+hMUDj05IJkTiuM
	+XYxZpEAm3KrGuAW7oGMXQ8GgRfdj32ILsB6A=
MIME-Version: 1.0
Received: by 10.224.107.200 with SMTP id c8mr11404334qap.18.1323886022163;
	Wed, 14 Dec 2011 10:07:02 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Wed, 14 Dec 2011 10:07:02 -0800 (PST)
In-Reply-To: <cover.1323862499.git.sledz@dresearch-fe.de>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
Date: Wed, 14 Dec 2011 11:07:02 -0700
Message-ID: <CA+M6bXk57+wbvAzkLrZVDPCvhGFLH8A-A3ESNnW_-Yk=TiDfLw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Steffen Sledz <sledz@dresearch.de>,
	openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [2011.03-maintenance 0/5] pull request 20111214
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
X-List-Received-Date: Wed, 14 Dec 2011 18:14:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2011 at 4:40 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> Hi Tom,
>
> please pull these 5 commits cherry-picked from oe.dev.
> All of them are bugfixes and tested in our own environment.
>
> Thx,
> Steffen
>
> The following changes since commit 9826895e30baa597a5ec433cc0ebd52f5f6c87=
96:
>
> =A0Merge remote-tracking branch 'upstream/2011.03-maintenance' into sledz=
/maintenance (2011-12-09 14:06:08 +0100)
>
> are available in the git repository at:
>
> =A0git://git.openembedded.org/openembedded sledz/maintenance
> =A0http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dsledz/main=
tenance
>
> Stefan Schmidt (2):
> =A0llvm2.7_2.7: Add patch for build errors on newer gcc / glibc
> =A0 =A0combinations
> =A0llvm2.7_2.7.bb: Update patch to use c++ include style.
>
> Steffen Sledz (3):
> =A0live555: replace version 20110314 with 20111120
> =A0icedtea6-native: fix problem on build hosts with linux kernel 3.x
> =A0openjdk: fix problem on build hosts with linux kernel 3.x

Only 1 2 and 3 made it to the ML.  1 and 2 are fine.  For 3, we should
grab the old file (someone must have a copy) and stick that on
sources.openembedded.org.

--=20
Tom


