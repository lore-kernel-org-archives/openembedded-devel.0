Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U4EwF-0006zW-D6
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2013 19:14:11 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id B1B117AF94A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Feb 2013 18:58:16 +0100 (CET)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id B580DA6261;
	Sat,  9 Feb 2013 18:58:09 +0100 (CET)
Date: Sat, 9 Feb 2013 18:58:08 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130209185808.4fe5cfe7@e6520eb>
In-Reply-To: <CAP9ODKoiG+bjZgXZvOkvYTiFqr0HEQWrevdn8PVkP3ZnzXC0zA@mail.gmail.com>
References: <CAP9ODKpr-Hg6h5mANx0s-p=TUzfaKhwmrKQMRK1wRpDdEHCXeA@mail.gmail.com>
	<CAP9ODKoiG+bjZgXZvOkvYTiFqr0HEQWrevdn8PVkP3ZnzXC0zA@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [for-danny] Changes for cherry-pick
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
X-List-Received-Date: Sat, 09 Feb 2013 18:14:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le Sat, 9 Feb 2013 15:40:09 -0200,
Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :
> On Tue, Feb 5, 2013 at 12:29 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > Hello Eric,
> >
> > Please evaluate following changes for backport to danny (in order):
> >
> > * 430922f xf86-video-geode: Update to 2.11.14
> >
> > * 6956575 samba: split winbind into winbind and libwinbind
> >
> > * 47e9480 samba: remove empty /sbin
> >
> > * 1ec00cd samba: added gnu-configize for AArch64 support
> >
> > * 86c8f45 samba: Fix build on Fedora 17
> >
> > * a623fd9 samba: disable avahi and build without acl
> >
> > * 18e5661 samba: add new package libwbclient to avoid libsmbclient
> > dragging in samba
>=20
> ping?
>=20
the request is still in build test on my buildserver for
different targets and will be pushed shortly after if no build problem
occurs.

Please allow at least 1 week before sending a request and sending a
ping, since the systemd problem in december I launch several builds
before integrating the patches in order to avoid problems (or at least
to reduce the risk of breaking the stable branches).

Thanks,
Eric


