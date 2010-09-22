Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OyWS5-0000qh-Mr
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 23:02:08 +0200
Received: by wwb17 with SMTP id 17so326892wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zPNW/9RlJWAFpku7b+n6AqjI7S10N8SxtnI6ek4Fuiw=;
	b=eFkA4zJ6Sq9q09VBY4DIyIlklXplOUfgn5yejgM75zgwDb6FQbAwUFLfZkNKc1AE/6
	P5QF1RwwSjnGFuKwbjmTZTTlsPBlw4AoBiQYETd7or4UZFZr+xhzo3t04COwDM59RkDN
	0X506TZ02hrb+HJZPGKhSxHcKTA70af0i15Ss=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iGVJonPHCr01Mf61I2Sgd02/cYHRZrmqwpDulM/0fo+r93t6YAV4xqFZ0VNwF73cnM
	X9rwSxCzmZslGKEHSluMPh7YWi5+GPhacxcOI5HlrNzrD1Sy+E6Y/aN2WAm6q/EL5MJr
	3F7LQKTbIf/ZfqVwrAcaRq2fxfuwvxLVdCMFQ=
MIME-Version: 1.0
Received: by 10.216.176.8 with SMTP id a8mr7462234wem.93.1285189320445; Wed,
	22 Sep 2010 14:02:00 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Wed, 22 Sep 2010 14:02:00 -0700 (PDT)
In-Reply-To: <20100921203711.GF3403@jama>
References: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
	<20100921152505.GB3403@jama>
	<AANLkTikTrRMX-5UAso2BgJ8-XqhwtXTnS_vT2Yt4FNnc@mail.gmail.com>
	<20100921154038.GC3403@jama>
	<AANLkTim9cs7=eKAV1T2ZWTd1HgAaXrxDUdcLUT8RahUF@mail.gmail.com>
	<20100921203711.GF3403@jama>
Date: Wed, 22 Sep 2010 17:02:00 -0400
Message-ID: <AANLkTin-D__XnhkP3ZDjtW0K5hN0QyY0Zkd6sXd-XGsd@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Wed, 22 Sep 2010 21:02:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2010 at 4:37 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Sep 21, 2010 at 04:26:06PM -0400, Cliff Brake wrote:
>> On Tue, Sep 21, 2010 at 11:40 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> > On Tue, Sep 21, 2010 at 11:34:23AM -0400, Cliff Brake wrote:
>> >> On Tue, Sep 21, 2010 at 11:25 AM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>> >> > On Tue, Sep 21, 2010 at 11:21:32AM -0400, Cliff Brake wrote:
>> >> >> Qt 4.7.0 is now released:
>> >> >>
>> >> >> http://labs.qt.nokia.com/2010/09/21/qt-4-7-0-now-available/
>> >> >>
>> >> >> Is anyone working on recipes for this yet? =A0I've been trying to =
get
>> >> >> 4.7.0-beta2 to build, so wondering if anyone has tried 4.7.0 relea=
sed
>> >> >> yet.
>> >> >
>> >> > 4.7.0-beta2 is building and working for me (SHR) fine, but no time =
to
>> >> > work on 4.7.0 now, so would be great if someone else does that.
>> >>
>> >> Just to verify and get a baseline, what all do you need to set to get
>> >> 4.7.0-beta2 to build properly. =A0I'm trying:
>> >>
>> >> ANGSTROM_QT_VERSION =3D "4.6.3+4.7.0-beta2"
>> >
>> > Yes, I also had to use newer postgresql before (not sure if it's still
>> > needed).
>> >
>> > http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/5fcd2=
0c6e939edfec27fccce1e92f82cf0a78b17
>> >
>> >> Are you using the X11 or embedded version or Qt?
>> >
>> > only X11 version
>>
>> X11 version built fine -- qt4-embedded failed:
>>
>> http://bec-systems.com/oe/qt4-embedded-log.do_compile
>>
>> We'll move on to the 4.7.0 released stuff next.
>
> Looks like same issue as with demos/browser fixed in:
> recipes/qt4/qt-4.6.3+4.7.0-beta2/demos.browser.add.mediaservices.lib.patc=
h

I have pushed a branch with my work so far:

http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dcbrake/qt-4.7.0

currently getting compile errors:

cd domtraversal/ && make -e -f Makefile
make[3]: Entering directory
`/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-a=
ngstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src=
-4.7.0/examples/webkit/domtraversal'
arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Dxscale
-mthumb-interwork -mno-thumb
-Wl,-rpath-link,/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp=
/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
-L/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/armv=
5te-angstrom-linux-gnueabi/usr/lib
-Wl,-rpath-link,/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp=
/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=3Dgnu -o domtraversal
.obj/release-shared/main.o .obj/release-shared/window.o
.obj/release-shared/moc_window.o
-L/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/armv=
5te-angstrom-linux-gnueabi/usr/lib
-L/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-=
angstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-sr=
c-4.7.0/lib
-L/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/armv=
5te-angstrom-linux-gnueabi/usr/lib
-lQtWebKit -lQtGui
-L/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-=
angstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-sr=
c-4.7.0/lib
-lQtNetwork -lQtCore -lpthread
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/x86_64=
-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm=
-angstrom-linux-gnueabi/bin/ld:
warning: libphonon.so.4, needed by
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so,
not found (try using -rpath or -rpath-link)
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/x86_64=
-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm=
-angstrom-linux-gnueabi/bin/ld:
warning: libQtDBus.so.4, needed by
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so,
not found (try using -rpath or -rpath-link)
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/x86_64=
-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm=
-angstrom-linux-gnueabi/bin/ld:
warning: libQtXml.so.4, needed by
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so,
not found (try using -rpath or -rpath-link)
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/x86_64=
-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm=
-angstrom-linux-gnueabi/bin/ld:
warning: libc.so, needed by
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/x86_64=
-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm=
-angstrom-linux-gnueabi/lib/libgcc_s.so,
not found (try using -rpath or -rpath-link)
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::isSeekable() const'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::state() const'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::seek(long long)'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::errorType() const'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to
`Phonon::MediaObject::setCurrentSource(Phonon::MediaSource const&)'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::createPath(Phonon::MediaNode*,
Phonon::MediaNode*)'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::hasVideo() const'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaSource::MediaSource(QUrl const&)'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to
`Phonon::BackendCapabilities::availableMimeTypes()'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::pause()'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::AudioOutput::setMuted(bool)'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::VideoWidget::VideoWidget(QWidget*)'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::play()'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::AudioOutput::AudioOutput(QObject*)'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::totalTime() const'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::currentTime() const'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::AudioOutput::setVolume(float)'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::Path::~Path()'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaSource::~MediaSource()'
/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-an=
gstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src-=
4.7.0/lib/libQtWebKit.so:
undefined reference to `Phonon::MediaObject::MediaObject(QObject*)'
collect2: ld returned 1 exit status
make[3]: *** [domtraversal] Error 1
make[3]: Leaving directory
`/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-a=
ngstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src=
-4.7.0/examples/webkit/domtraversal'
make[2]: *** [sub-domtraversal-make_default] Error 2
make[2]: Leaving directory
`/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-a=
ngstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src=
-4.7.0/examples/webkit'
make[1]: *** [sub-webkit-make_default] Error 2
make[1]: Leaving directory
`/scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/work/armv5te-a=
ngstrom-linux-gnueabi/qt4-x11-free-4.7.0-r18.0/qt-everywhere-opensource-src=
-4.7.0/examples'
make: *** [sub-examples-make_default-ordered] Error 2
FATAL: oe_runmake failed

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


