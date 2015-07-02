Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 554416E5F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jul 2015 16:23:35 +0000 (UTC)
Received: by igcur8 with SMTP id ur8so123145770igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2015 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=+VzzWLIo4Cxb9McSRongO0I3AtGk8gSnLnAZm3l95UA=;
	b=Pv7js5+0ILsMqbYlkV419CsWdj6Bfl5Us2A7OqTvW/avdYZFYpMniZ83SlpZ/4rOkg
	/vLWYXDie/D8IWTihhfVCXQ+gDC5LandaxJ9ap0Zg9M8cZngAGwg3iMrvAOMZKVgsRZT
	OiE0dbXdTgTC1/Y0sFusynLEuFGZPJ2FFpiLeLMBYu6yDqKKdCCU2DHS3OvkArIv9W9t
	qAZtXvaBhBgx0Awdihc7QzfbIB6mFYFjR3ydi1xpMZLB+NGcpUZvWgdXwJF2kXGLNkJe
	SLIRAoCbdaYomv+d+M2e+rd3CgUhwiZAQGfetg4OXgWTU7hDHD/zuUZ84/yHRvdCnUx3
	2emQ==
MIME-Version: 1.0
X-Received: by 10.50.50.130 with SMTP id c2mr15689195igo.19.1435854215255;
	Thu, 02 Jul 2015 09:23:35 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 2 Jul 2015 09:23:35 -0700 (PDT)
In-Reply-To: <20150629125024.GF2393@jama>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
	<1435235754-7339-3-git-send-email-schnitzeltony@googlemail.com>
	<20150629125024.GF2393@jama>
Date: Thu, 2 Jul 2015 18:23:35 +0200
Message-ID: <CALbNGRSuZUJOO1KJB6qxQ3cYkK1juCT3HEbbCaSqonkPfBwQzg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/7] networkmanager: update to 1.0.2
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
X-List-Received-Date: Thu, 02 Jul 2015 16:23:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 2:50 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Jun 25, 2015 at 02:35:49PM +0200, Andreas M=C3=BCller wrote:
>> * at_console support is gone
>> * add PACKAGECONFIG for bluez5/modemmanager/ppp and disable them by defa=
ult
>
> world build shows:
> networkmanager-1.0.2: networkmanager: Files/directories were installed
> but not shipped in any package:
>   /run
>   /run/NetworkManager
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install. [installed-vs-shipped]
>
> can you please check it?
>
Am out till 16th - will check then

Andreas

