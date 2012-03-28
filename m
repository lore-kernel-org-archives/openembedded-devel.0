Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCowH-00022t-P2
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 11:13:09 +0200
Received: by iaag37 with SMTP id g37so1192599iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vmJ1//mn1hI0i4kXKry4ldD0rI7WGUj4y1MJ4zFHjmo=;
	b=oSkG0SswKflFeAxpIQmWFbly9VBu1tNN2WQevD2NXf+mwjpQApJko251bP83hJJlw+
	2EppWCd5UYOLjZaLiWVJJc7Ho2Chs0C9pnrHv1Ax3rOOarHkjOat3bUPVUFMm9NVo9Lm
	Bw3/Qp3uYWIV4/SPiMUduNJQB0dlJF1csc/KpkahXMkCNr/WkInocSj5Mnc9hEepEcDA
	NaP+o6KjN3QzHwWToRC3d0qBF1P8TG+AuTmFLfXlqaxVsqQ7g+stnKSyvg8ERoXStTV+
	bEdFuYyC6Hwnxstsz2nsucKwV7uWAq7DgETYzL6XAWEfH5D3k64S8CS8lRHtdQd45eL+
	fhmA==
MIME-Version: 1.0
Received: by 10.50.156.135 with SMTP id we7mr1611713igb.0.1332925447155; Wed,
	28 Mar 2012 02:04:07 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Wed, 28 Mar 2012 02:04:07 -0700 (PDT)
In-Reply-To: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
Date: Wed, 28 Mar 2012 11:04:07 +0200
Message-ID: <CALbNGRRbDLWOWrfzfb+GNX6Wh6cNracvkCYj3B5yUkL4aKj3Ow@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 0/2] midori: cleanup
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
X-List-Received-Date: Wed, 28 Mar 2012 09:13:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 9:10 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> v1 -> v2:
> change order variables/functions as suggested in [1]
>
> v2 -> v3
> change order variables/functions as suggested in [2]
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/03=
8650.html
> [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-March/03=
8684.html
>
> Andreas M=FCller (2):
> =A0midori: remove midori.inc and oe-stylize
> =A0midori: add librsvg-native to DEPENDS
>
> =A0meta-oe/recipes-connectivity/midori/midori.inc =A0 =A0 | =A0 39 ------=
-------------
> =A0.../recipes-connectivity/midori/midori_0.4.4.bb =A0 =A0| =A0 41 ++++++=
+++++++++++++-
> =A02 files changed, 39 insertions(+), 41 deletions(-)
> =A0delete mode 100644 meta-oe/recipes-connectivity/midori/midori.inc
>
> --
> 1.7.4.4
>
ping?


