Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Op2vY-0001Dr-2s
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 19:41:32 +0200
Received: by fxm6 with SMTP id 6so2280787fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 10:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=KA5yI7k724xxK1UeHtJ+SdMNtzCtGpTW89beFkYiJis=;
	b=P6LH6aR6z4JIW4kQCAFnhVfKX6zH9FpbyxT47imlFOhKrhTSz774BkKfRvoTTBLADX
	BzYjtNitHPyVgP7kJf+10eFatqqJZGDJfzszw9W70pgU8VUQ5ExC7KPq24adkPjHcgc8
	/6+uMYrLiZsiZOORs2r22SarX+TWt3V1czEDM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=DPxEjxL/iFkRUrlk8m4tPnyKBUvt355AHA4AElhiz7SCjtGycEAE2H8SwPFc06mFZb
	Edl6uZtjmHPSWpxaxs5dodC/+ZHRDcw/ejsbmr7uOS3k1iuNLEwASulctRbvL8KTcWdY
	QBuHahPYhfoEJIsFFJOAUFO3nwATWV0gC5acU=
Received: by 10.223.112.10 with SMTP id u10mr944584fap.50.1282930849080; Fri,
	27 Aug 2010 10:40:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Fri, 27 Aug 2010 10:40:29 -0700 (PDT)
In-Reply-To: <AANLkTikxkvv1eSfY6QcEk-GdD_OR5rxA-Q2Ps3A=rS7Q@mail.gmail.com>
References: <1282447709-15130-1-git-send-email-coolaj86@gmail.com>
	<AANLkTinbVA1Cj2arRmrANWQH_VFMnhZ2x7i=LHdnNWp7@mail.gmail.com>
	<1282607876.3775.33.camel@mattotaupa> <20100827040432.GA8857@gmail.com>
	<AANLkTikxkvv1eSfY6QcEk-GdD_OR5rxA-Q2Ps3A=rS7Q@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Fri, 27 Aug 2010 11:40:29 -0600
Message-ID: <AANLkTimmEFyY4byAqa1NhWvnZnD7rQX2kqLvnku4X0JO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] [v2] added recipe for nodejs
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
X-List-Received-Date: Fri, 27 Aug 2010 17:41:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Upstream is making some changes so that my patches probably won't be
necessary.

I'm going to wait a week or two and I'll resubmit once node-v0.2.1 comes ou=
t
which will most likely include the changes.

AJ ONeal

On Thu, Aug 26, 2010 at 11:54 PM, AJ ONeal <coolaj86@gmail.com> wrote:

> I'll resubmit this weekend and put that patch tutorial on the wiki too.
>
> AJ ONeal
>
>
>
> On Thu, Aug 26, 2010 at 10:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On (24/08/10 01:57), Paul Menzel wrote:
>> > Dear AJ,
>> >
>> >
>> > sorry I overlooked that message. I will reply to your other message
>> > tomorrow.
>> >
>> >
>> > Am Montag, den 23.08.2010, 17:22 -0600 schrieb AJ ONeal:
>> > > bump
>> > >
>> > > AJ ONeal
>> > >
>> > > On Sat, Aug 21, 2010 at 9:28 PM, AJ ONeal <coolaj86@gmail.com> wrote=
:
>> > >
>> > > > ---
>> >
>> > After this line a short summary of the changes compared to previous
>> > iterations would be great. Git will ignore this when applying the patc=
h
>> > but it eases the work of the reviewers.
>> >
>> > > >  recipes/nodejs/files/libev-cross-cc.patch          |   18
>> ++++++++++++
>> > > >  recipes/nodejs/files/node-cross-cc.patch           |   14
>> ++++++++++
>> > > >  .../node-dont-include-hosts-usr-include.patch      |   22
>> +++++++++++++++
>> > > >  recipes/nodejs/nodejs_0.2.0.bb                     |   28
>> > > > ++++++++++++++++++++
>> > > >  4 files changed, 82 insertions(+), 0 deletions(-)
>> > > >  create mode 100644 recipes/nodejs/files/libev-cross-cc.patch
>> > > >  create mode 100644 recipes/nodejs/files/node-cross-cc.patch
>> > > >  create mode 100644
>> > > > recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
>> > > >  create mode 100644 recipes/nodejs/nodejs_0.2.0.bb
>> > > >
>> > > > diff --git a/recipes/nodejs/files/libev-cross-cc.patch
>> > > > b/recipes/nodejs/files/libev-cross-cc.patch
>> > > > new file mode 100644
>> > > > index 0000000..446015b
>> > > > --- /dev/null
>> > > > +++ b/recipes/nodejs/files/libev-cross-cc.patch
>> > > > @@ -0,0 +1,18 @@
>> > > > +diff --git node-v0.2.0/deps/libev/wscript.orig
>> > > > node-v0.2.0/deps/libev/wscript
>> > > > +index 19e7bb2..f0a3d3b 100644
>> > > > +--- node-v0.2.0/deps/libev/wscript.orig
>> > > > ++++ node-v0.2.0/deps/libev/wscript
>> > > > +@@ -52,7 +52,12 @@ def configure(conf):
>> > > > +           return 0;
>> > > > +       }
>> > > > +   """
>> > > > +-  conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCA=
LL",
>> > > > execute=3DTrue,
>> > > > ++  # TODO determine this dynamically
>> > > > ++  CROSS =3D True
>> > > > ++  execute =3D True
>> > > > ++  if CROSS:
>> > > > ++    execute =3D False
>> > > > ++  conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCA=
LL",
>> > > > execute=3Dexecute,
>> > > > +                 msg=3D"Checking for SYS_clock_gettime")
>> > > > +
>> > > > +   have_librt =3D conf.check(lib=3D'rt', uselib_store=3D'RT')
>> > > > diff --git a/recipes/nodejs/files/node-cross-cc.patch
>> > > > b/recipes/nodejs/files/node-cross-cc.patch
>> > > > new file mode 100644
>> > > > index 0000000..48a6226
>> > > > --- /dev/null
>> > > > +++ b/recipes/nodejs/files/node-cross-cc.patch
>> > > > @@ -0,0 +1,14 @@
>> > > > +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
>> > > > +index df9ef53..a55d464 100644
>> > > > +--- node-v0.2.0/wscript.orig
>> > > > ++++ node-v0.2.0/wscript
>> > > > +@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
>> > > > +   arch =3D ""
>> > > > +   if bld.env['DEST_CPU'] =3D=3D 'x86_64':
>> > > > +     arch =3D "arch=3Dx64"
>> > > > ++  # XXX Better support cross-compilation
>> > > > ++  else:
>> > > > ++    arch =3D "arch=3D" + bld.env['DEST_CPU']
>> > > > +
>> > > > +   if variant =3D=3D "default":
>> > > > +     mode =3D "release"
>> > > > diff --git
>> a/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
>> > > > b/recipes/nodejs/files/node-dont-include-hosts-usr-include.patch
>> > > > new file mode 100644
>> > > > index 0000000..edbf7c4
>> > > > --- /dev/null
>> > > > +++ b/recipes/nodejs/files/node-dont-include-hosts-usr-include.pat=
ch
>> > > > @@ -0,0 +1,22 @@
>> > > > +diff --git node-v0.2.0/wscript.orig node-v0.2.0/wscript
>> > > > +index 3c5ebc5..905bd58 100644
>> > > > +--- node-v0.2.0/wscript.orig
>> > > > ++++ node-v0.2.0/wscript
>> > > > +@@ -162,11 +162,12 @@ def configure(conf):
>> > > > +   if Options.options.efence:
>> > > > +     conf.check(lib=3D'efence', libpath=3D['/usr/lib',
>> '/usr/local/lib'],
>> > > > uselib_store=3D'EFENCE')
>> > > > +
>> > > > +-  if not conf.check(lib=3D"execinfo", includes=3D['/usr/include'=
,
>> > > > '/usr/local/include'], libpath=3D['/usr/lib', '/usr/local/lib'],
>> > > > uselib_store=3D"EXECINFO"):
>> > > > +-    # Note on Darwin/OS X: This will fail, but will still be use=
d
>> as the
>> > > > +-    # execinfo stuff are part of the standard library.
>> > > > +-    if sys.platform.startswith("freebsd"):
>> > > > +-      conf.fatal("Install the libexecinfo port from
>> > > > /usr/ports/devel/libexecinfo.")
>> > > > ++  # OpenEmbedded doesn't like us checking here
>> > > > ++  #if not conf.check(lib=3D"execinfo", includes=3D['/usr/include=
',
>> > > > '/usr/local/include'], libpath=3D['/usr/lib', '/usr/local/lib'],
>> > > > uselib_store=3D"EXECINFO"):
>> > > > ++  #  # Note on Darwin/OS X: This will fail, but will still be us=
ed
>> as the
>> > > > ++  #  # execinfo stuff are part of the standard library.
>> > > > ++  #  if sys.platform.startswith("freebsd"):
>> > > > ++  #    conf.fatal("Install the libexecinfo port from
>> > > > /usr/ports/devel/libexecinfo.")
>> > > > +
>> > > > +   if not Options.options.without_ssl:
>> > > > +     if conf.check_cfg(package=3D'openssl',
>> >
>> > Did you sent these patches upstream? Maybe document that in the patch
>> > headers. There is also a page in the Wiki regarding this.
>> >
>> > > > diff --git a/recipes/nodejs/nodejs_0.2.0.bb b/recipes/nodejs/
>> > > > nodejs_0.2.0.bb
>> > > > new file mode 100644
>> > > > index 0000000..83bfa2e
>> > > > --- /dev/null
>> > > > +++ b/recipes/nodejs/nodejs_0.2.0.bb
>> > > > @@ -0,0 +1,28 @@
>> > > > +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>> > > > +HOMEPAGE =3D "http://nodejs.org"
>> > > > +LICENSE =3D "MIT"
>> > > > +DEPENDS =3D "openssl"
>> > > > +SRC_URI =3D " \
>> > > > +  http://nodejs.org/dist/node-v${PV}.tar.gz<http://nodejs.org/dis=
t/node-v$%7BPV%7D.tar.gz>\
>> > > > +  file://node-cross-cc.patch \
>> > > > +  file://libev-cross-cc.patch \
>> > > > +  file://node-dont-include-hosts-usr-include.patch \
>> > > > +"
>> > > > +#file://libev-arm-cross.patch \
>> >
>> > Is that commented line needed?
>> >
>> > > > +SRC_URI[md5sum] =3D "99a6dacc44b3f9c6ec376ccb446dd0b8"
>> > > > +SRC_URI[sha256sum] =3D
>> > > > "3d3eff9287c9917af4044f3cef99ae5b17946710a71e83039de4fcb4b0a26631"
>> > > > +S =3D "${WORKDIR}/node-v${PV}"
>> > > > +do_configure () {
>> > > > +  ./configure --prefix=3D${D} --without-snapshot
>> > > > +}
>> >
>> > Can you use `EXTRA_OECONF` (Do `git grep EXTRA_OECONF` in the reposito=
ry
>> > to get examples.)
>>
>> its ok. Since its override the do_configure
>>
>> >
>> > I think you might need `inherit autotools`, but I am not sure.
>>
>>
>> no this package does not use autotools it not needed.
>>
>> >
>> > > > +do_compile () {
>> > > > +  make
>> > > > +}
>> >
>> > Is that needed? What about Frans=92 suggestion?
>>
>> should use oe_runmake instea of bare make to exploit parallelism.
>>
>> >
>> > > > +do_install () {
>> > > > +  #oe_runmake install # doesn't install to correct location
>> > > > +
>> > > > +  # This works
>> > > > +  install -d ${D}${bindir}/
>> > > > +  install -m 0755 ${S}/node ${D}${bindir}/
>> > > > +}
>> > > > +FILES_${PN} =3D "${bindir}/node"
>> >
>> > Why is that needed?
>> >
>> > I am a beginner, so I hope my comments are correct. If so please submi=
t
>> > a v3 and do not forget your Signed-off-by line.
>>
>> right.
>> >
>> >
>> > Thanks,
>> >
>> > Paul
>>
>>
>>
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

