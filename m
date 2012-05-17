Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SV1DW-00008m-Er
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 15:58:10 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4HDm6ng011073;
	Thu, 17 May 2012 08:48:06 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4HDm6e5030856;
	Thu, 17 May 2012 08:48:06 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 17 May 2012 08:48:06 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [2011.03-maintenance] Pull request 20120514
Thread-Index: AQHNMgn1P7Ks4RhWa0OI4uinGP3AfZbOAy/g
Date: Thu, 17 May 2012 13:48:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10138E3E470@DLEE12.ent.ti.com>
References: <1337018980-29630-1-git-send-email-Chase.Maupin@ti.com>
	<20120514194409.GD8995@denix.org>
In-Reply-To: <20120514194409.GD8995@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request 20120514
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
X-List-Received-Date: Thu, 17 May 2012 13:58:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Monday, May 14, 2012 2:44 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: Re: [oe] [2011.03-maintenance] Pull request 20120514
>=20
> On Mon, May 14, 2012 at 01:09:40PM -0500, Chase Maupin wrote:
> > Tom,
> >
> > Please pull the following commits that update the LICENSE field
> to
> > list the actual license version for licenses like GPL and LGPL.
> These
> > patches have previously been sent to the list with each patch
> identifying
> > where it was derived from.  I have also submitted patches for
> oe-core where
> > appropriate.
> >
> > I'm looking for feedback on how to properly mark a package as
> having two
> > licenses in oe-classic since "&" causes issues.  If these
> patches are OK
> > then they can be pulled.  If there is a better way to mark the
> dual licensing
> > then I'll update them accordingly.
>=20
> As far as I recall, we don't use "&" in oe-classic for dual
> licenses.
>=20
>=20
> > The following changes since commit
> 36a56cbb69cda0c89f478e01183d61c6a66525c9:
> >   Steffen Sledz (1):
> >         icedtea6-native-1.7.10: backport S7103224
> >
> > are available in the git repository at:
> >
> >   http://arago-project.org/git/projects/arago-oe-amsdk.git
> update-licenses
>=20
> Also the same in different format:
>=20
> Pull URL: git://arago-project.org/git/projects/arago-oe-amsdk.git
>   Branch: update-licenses
>   Browse: http://arago-project.org/git/projects/?p=3Darago-oe-
> amsdk.git;a=3Dshortlog;h=3Drefs/heads/update-licenses
>=20
>=20
> Acked-by: Denys Dmytriyenko <denys@ti.com>

Ping on this pull request.  Any issues?

>=20
>=20
> > Chase Maupin (69):
> >       gnutls: update LICENSE setting
> >       libtasn1: update LICENSE setting
> >       bonnie: Update LICENSE field version
> >       canutils: Update LICENSE field version
> >       debianutils: Update LICENSE field version
> >       gtk+: Update LICENSE field version for 2.20.1
> >       gnome-keyring: Update LICENSE field version
> >       gnome-vfs: Update LICENSE field version
> >       hicolor-icon-theme: Update LICENSE field version
> >       hostap-daemon: Update LICENSE field version
> >       liba52: Update LICENSE field version
> >       atk: Update LICENSE field version
> >       audiofile: Update LICENSE field version
> >       avahi: Update LICENSE field version
> >       cairo: Update LICENSE field version
> >       libcap2: Update LICENSE field version
> >       libcroco: Update LICENSE field version
> >       esound: Update LICENSE field version
> >       faac: Update LICENSE field version
> >       faad2: Update LICENSE field version
> >       flac: Update LICENSE field version
> >       libgcrypt: Update LICENSE field version
> >       gdbm: Update LICENSE field version
> >       libgpg-error: Update LICENSE field version
> >       libical: Update LICENSE field version
> >       libid3tag: Update LICENSE field version
> >       libidl: Update LICENSE field version
> >       libmad: Update LICENSE field version
> >       libmodplug: Update LICENSE field version
> >       lame: Update LICENSE field version
> >       mpeg2dec: Update LICENSE field version
> >       mysql5: Update LICENSE field version
> >       libnl: Update LICENSE field version
> >       libproxy: Update LICENSE field version
> >       librsvg: Update LICENSE field version
> >       libsamplerate0: Update LICENSE field version
> >       schroedinger: Update LICENSE field version
> >       libsdl: Update LICENSE field version
> >       libsidplay: Update LICENSE field version
> >       libsndfile1: Update LICENSE field version
> >       libsocketcan: Update LICENSE field version
> >       libsoup-2.4: Update LICENSE field version
> >       libvisual: Update LICENSE field version
> >       x264: Update LICENSE field version
> >       libxv: Update LICENSE field version
> >       lmbench: Update LICENSE field version
> >       makedevs: Update LICENSE field version
> >       nfs-utils: Update LICENSE field version
> >       orbit2: Update LICENSE field version
> >       pango: Update LICENSE field version
> >       shared-mime-info: Update LICENSE field version
> >       wireless-tools: Update LICENSE field version
> >       gnome-common: Update LICENSE field version
> >       cups: Update LICENSE field version
> >       gnome-mime-data: Update LICENSE field version
> >       gtk-doc: Update LICENSE field version
> >       intltool: Update LICENSE field version
> >       libart-lgpl: Update LICENSE field version
> >       libdaemon: Update LICENSE field version
> >       libdiscid: Update LICENSE field version
> >       libglade: Update LICENSE field version
> >       libmikmod: Update LICENSE field version
> >       libmusicbrainz: Update LICENSE field version
> >       neon: Update LICENSE field version
> >       libnfnetlink: Update LICENSE field version
> >       python-pycairo: Update LICENSE field version
> >       python-pygobject: Update LICENSE field version
> >       python-pygtk: Update LICENSE field version
> >       time: Update LICENSE field version
> >
> >  recipes/atk/atk_1.30.0.bb                          |    4 ++--
> >  recipes/audiofile/audiofile_0.2.6.bb               |    4 ++--
> >  recipes/avahi/avahi.inc                            |    4 ++--
> >  recipes/bonnie/bonnie++.inc                        |    3 ++-
> >  recipes/cairo/cairo_1.10.0.bb                      |    4 +++-
> >  recipes/cups/cups_1.2.12.bb                        |    4 ++--
> >  recipes/debianutils/debianutils.inc                |    4 ++--
> >  recipes/esound/esound_0.2.36.bb                    |    4 ++--
> >  recipes/faac/faac_1.24.bb                          |    4 ++--
> >  recipes/faad2/faad2_2.7.bb                         |    4 +++-
> >  recipes/flac/flac_1.2.1.bb                         |    4 +++-
> >  recipes/gdbm/gdbm_1.8.3.bb                         |    4 ++--
> >  recipes/gnome/gnome-common.inc                     |    2 +-
> >  recipes/gnome/gnome-common_2.28.0.bb               |    2 ++
> >  recipes/gnome/gnome-keyring_2.28.2.bb              |    4 ++--
> >  recipes/gnome/gnome-mime-data_2.18.0.bb            |    4 ++--
> >  recipes/gnome/gnome-vfs_2.24.1.bb                  |    4 ++--
> >  recipes/gnome/libart-lgpl.inc                      |    4 ++--
> >  recipes/gnome/libproxy_0.2.3.bb                    |    4 ++--
> >  recipes/gnome/libsoup-2.4_2.32.2.bb                |    4 +++-
> >  recipes/gnome/orbit2_2.14.17.bb                    |    4 ++++
> >  recipes/gnutls/gnutls.inc                          |   10
> +++++++---
> >  recipes/gnutls/libtasn1_1.7.bb                     |    8
> +++++---
> >  recipes/gtk+/gtk+_2.20.1.bb                        |    4 +++-
> >  recipes/gtk-doc/gtk-doc.bb                         |    4 ++--
> >  .../hicolor-icon-theme/hicolor-icon-theme_0.11.bb  |    4 ++--
> >  recipes/hostap/hostap-daemon-0.7.inc               |    2 +-
> >  recipes/hostap/hostap-daemon_0.7.3.bb              |    2 +-
> >  recipes/intltool/intltool.inc                      |    4 ++--
> >  recipes/lame/lame_3.98.2.bb                        |    4 ++--
> >  recipes/liba52/liba52_0.7.4.bb                     |    4 ++--
> >  recipes/libcap/libcap2_2.20.bb                     |    4 ++--
> >  recipes/libcroco/libcroco_0.6.2.bb                 |    4 +++-
> >  recipes/libdaemon/libdaemon_0.13.bb                |    4 ++--
> >  recipes/libdiscid/libdiscid.inc                    |    2 +-
> >  recipes/libdiscid/libdiscid_0.2.2.bb               |    2 ++
> >  recipes/libgcrypt/libgcrypt_1.4.1.bb               |    4 ++++
> >  recipes/libglade/libglade_2.6.4.bb                 |    4 ++++
> >  recipes/libgpg-error/libgpg-error_1.4.bb           |    4 +++-
> >  recipes/libical/libical_0.44.bb                    |    4 ++--
> >  recipes/libid3tag/libid3tag_0.15.1b.bb             |    4 ++--
> >  recipes/libidl/libidl-native_0.8.13.bb             |    2 +-
> >  recipes/libidl/libidl.inc                          |    2 +-
> >  recipes/libidl/libidl_0.8.13.bb                    |    2 +-
> >  recipes/libmad/libmad_0.15.1b.bb                   |    4 ++--
> >  recipes/libmikmod/libmikmod_3.1.12.bb              |    4 ++--
> >  recipes/libmodplug/libmodplug_0.8.7.bb             |    4 ++--
> >  recipes/libnfnetlink/libnfnetlink_1.0.0.bb         |    4 +++-
> >  recipes/libnl/libnl_2.0.bb                         |    5
> ++++-
> >  recipes/librsvg/librsvg_2.26.2.bb                  |    4 ++--
> >  recipes/libsamplerate/libsamplerate0_0.1.7.bb      |    4 ++--
> >  recipes/libsdl/libsdl-1.2.14.inc                   |    4 ++--
> >  recipes/libsidplay/libsidplay_1.36.59.bb           |    4 ++--
> >  recipes/libsndfile/libsndfile1_1.0.24.bb           |    4 ++--
> >  recipes/libvisual/libvisual_0.4.0.bb               |    4 ++--
> >  recipes/lmbench/lmbench_3.0-a9.bb                  |    4 ++--
> >  recipes/makedevs/makedevs_1.0.0.bb                 |    4 ++--
> >  recipes/mpeg2dec/mpeg2dec_0.4.0b.bb                |    4 ++--
> >  recipes/musicbrainz/libmusicbrainz.inc             |    2 +-
> >  recipes/musicbrainz/libmusicbrainz_3.0.2.bb        |    2 +-
> >  recipes/mysql/mysql5_5.1.40.inc                    |    4 ++--
> >  recipes/neon/neon_0.25.5.bb                        |    4 ++--
> >  recipes/nfs-utils/nfs-utils_1.1.2.bb               |    4 ++--
> >  recipes/pango/pango_1.24.4.bb                      |    4 +++-
> >  recipes/python/python-pycairo_1.8.0.bb             |    4 ++--
> >  recipes/python/python-pygobject_2.20.0.bb          |    4 ++--
> >  recipes/python/python-pygtk_2.16.0.bb              |    4 ++--
> >  recipes/schroedinger/schroedinger_1.0.9.bb         |    4 +++-
> >  recipes/shared-mime-info/shared-mime-info_0.51.bb  |    4 +++-
> >  recipes/socketcan/canutils.inc                     |    4 ++--
> >  recipes/socketcan/libsocketcan.inc                 |    4 ++--
> >  recipes/time/time.inc                              |    4 ++--
> >  recipes/vlc/x264_r2245.bb                          |    4 ++--
> >  recipes/wireless-tools/wireless-tools.inc          |    2 +-
> >  recipes/wireless-tools/wireless-tools_29.bb        |    2 +-
> >  recipes/xorg-lib/libxv_1.0.6.bb                    |    4 ++--
> >  76 files changed, 168 insertions(+), 120 deletions(-)
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-
> bin/mailman/listinfo/openembedded-devel


