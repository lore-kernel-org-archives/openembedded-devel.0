Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B61160616
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 10:09:06 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x190so5850251vka.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=ExdMsnNtWCYeUSe9LCTT1RPzct6my4KChTpOgWB4Ko4=;
	b=Nl3KUBd63iPgHaahlX74XPwYu8wtLQmuKKO/Hd0XscICYIOZw/Pb7KhiWbn+os/ORR
	fIG86YSQ3hqsCiE6Wr4FShwJQ9WQQsXtURNUg+ckYMjhJvlLP81tMxMZosOt9Zy6P7tH
	WSU837m05Yn07vzOut0iAo3XGoUATm+c6KPH6xKxwOqWFISUCLO/14r7fcF4+x6aj9RH
	7eG5nrvoYsmIhaPtxmz035ei/N0BCZHtlwN6mWKqLAuQclGHBzQEyWwNsVJfUSCfDg/B
	VYz9+K5Y7VKEtYOEZ/2ROK+TqJ+LsvoP3b1oqg78OW70foN3JUn0sXP/lSVbx9yAwgtE
	0+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=ExdMsnNtWCYeUSe9LCTT1RPzct6my4KChTpOgWB4Ko4=;
	b=LCT992Ri+D8bh2eoFZZmvUGB4CbIJUssk2tvCTOk+CvxipZQwiob6Cn/EmN2qxKwrB
	RtUak3VGWOitK41IQvkAlrlUA2uYJKEQ1jnjvQdAqZFlN1CmsLv6yfU3+LtTufdCUepV
	q0L8CEnOzoll9KNECZu0L+M7eMUrCg7S8tuJlBWQz5eo/bjxsrb0bTH7Wi3smzpMZVp1
	2RF+Mvhi0M5jBZAI5tSlPtk89Z3K1VnKQXoOS0Sac/ABoxMDpq9TOFUscDCHMzgMnRhf
	jifWPEhTfwhincZMcr5nwYs3X9lbwM8n/VQ5NwAeaqMmIbt3YKNUtExdfpJUwZnfyV4u
	RlaA==
X-Gm-Message-State: AOPr4FVwoyR/lRbt5reBpHlFB0SvHeiX0GZ8FxOtaEZkois/R7eOA5zHsDk69qCUs15dgbz51g+Xkm93nt0K7w==
MIME-Version: 1.0
X-Received: by 10.159.34.71 with SMTP id 65mr4309257uad.103.1461146947421;
	Wed, 20 Apr 2016 03:09:07 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Wed, 20 Apr 2016 03:09:07 -0700 (PDT)
In-Reply-To: <20160420092404.GA2561@jama>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
	<1460317290-4787-2-git-send-email-schnitzeltony@googlemail.com>
	<20160412102200.GD2564@jama>
	<CALbNGRQHekxMgsVgQnT8ACK7pKiSTGJ1KRmNLyvH7rsZ=9Zz8w@mail.gmail.com>
	<20160420092404.GA2561@jama>
Date: Wed, 20 Apr 2016 12:09:07 +0200
Message-ID: <CALbNGRSLGWidYnA5agDGipUaXV2frFD9UyvzYOaLppjtV32EpA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 01/31] qtbase-native: update sources to 5.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2016 10:09:08 -0000
X-Groupsio-MsgNum: 61076
Content-Type: multipart/mixed; boundary=001a1137c968c431ed0530e7c80d

--001a1137c968c431ed0530e7c80d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2016 at 11:24 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Tue, Apr 12, 2016 at 12:56:02PM +0200, Andreas M=C3=BCller wrote:
>> On Tue, Apr 12, 2016 at 12:22 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> > On Sun, Apr 10, 2016 at 09:41:00PM +0200, Andreas M=C3=BCller wrote:
>> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> >
>> > How did you pick these SRCREVs?
>> If tag for 5.6.0 available: I picked versions tagged.
>> If tag not available I chose revision right before 5.6.1 (as qtqick1)
>> out of 5.6 tree.
>> >
>> > OE @ ~/projects/qt-project/qtbase $ git log --oneline 41706400f605524a=
5a9953714aa0cfbf811dba7e..d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b
>> > d0cdc7a DirectFB: Fix build in C++98 mode
>> > 3bcc3037 fix non-git non-prefix shadow builds
>> > ae2d11d Add changelog for 5.6.0
>> > 38944d6 Fix syncqt.pl not respecting #pragma qt_no_master_include in f=
iles with Windows line endings
>> > 469e293 Fix crash when a standard bus isn't available
>> > bcdcde0 Doc: Simple CSS style: Convert font-sizes from px to pt
>> > 719623a Fix builds without session management.
>> > e7bf0ed Add option to disable "session management by closing windows".
>> >
>> >
>> > It's actually missing some changes which were included in previous SRC=
REV, I usually use latest in e.g. 5.6 branch
>> > even when it sets the version for next release (e.g. 5.6.1).
>> I was not aware of that. So we'll have to wait for 5.6.1 (whenever it
>> appears) if we want released versions without going backwards.
>>
>> As already noted in V2 description: Version mix 5.6.0/5.6.1 causes
>> cmake trouble and as heavy user of cmake in meta-qt5-extra I would
>> like to avoid...
>
> This revision also has issues building examples, my build failed with:
>
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/qtbase/5.6.0+gitAUTOINC+d0cdc7ad1e-r0/git/examples/widgets/mainwindows/app=
lication/mainwindow.cpp: In constructor 'MainWindow::MainWindow()':
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/qtbase/5.6.0+gitAUTOINC+d0cdc7ad1e-r0/git/examples/widgets/mainwindows/app=
lication/mainwindow.cpp:62:5: error: 'setFallbackSessionManagementEnabled' =
is not a member of 'QGuiApplication'
> |      QGuiApplication::setFallbackSessionManagementEnabled(false);
> |      ^
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/qtbase/5.6.0+gitAUTOINC+d0cdc7ad1e-r0/git/examples/widgets/mainwindows/app=
lication/mainwindow.cpp:63:20: error: 'commitDataRequest' is not a member o=
f 'QGuiApplication'
> |      connect(qApp, &QGuiApplication::commitDataRequest,
> |                     ^
>
> Which most likely was fixed with:
>> > 719623a Fix builds without session management.
> which is missing in this older SRCREV
>
> To move forward I've squashed your SRCREV changes to single commit and no=
w I'm preparing another
> change which will bump SRCREVs to latest in 5.6 branches. This way people=
 who care more about exact
> 5.6.0 version can use meta-qt5 revision with just your change, other peop=
le can follow latest 5.6
> and get also the examples build fixed from upstream.
>
> Regards,
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
I checked:

* Last KDE update in meta-qt5-extra had same trouble (error:
'setFallbackSessionManagementEnabled' is not a member of
'QGuiApplication') and I worked that around. To get rid of these
workarounds, I prepared this series for meta-qt5.
* My builds have packagegroup for session management enabled.
Functions 'setFallbackSessionManagementEnabled' and
'commitDataRequest' are defined in conditional #ifndef
QT_NO_SESSIONMANAGER blocks.

Conclusion: Examples were not properly updated - same issue as I have
at many KDE recipes nobody seems to work/test for Qt without
session-management.

Suggestion:

* Either patch qtbase by adding a patch attached or
* Update to later qt and hope this was fixed upstream - but please
take care that versions of all qt-libs are same (5.6.1??) otherwise
cmake won't find libraries (and I would start crying as heavy cmake
user)

Andreas

--001a1137c968c431ed0530e7c80d
Content-Type: text/x-patch; charset=UTF-8; 
	name="0001-examples-fix-build-for-sessionmanagement-disabled.patch"
Content-Disposition: attachment; 
	filename="0001-examples-fix-build-for-sessionmanagement-disabled.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_in8p3qoz1

RnJvbSA0YWE1YWJjNGM5NTUyYWUxOWZiMzJlYTIxZjQzNjU4ZTNiOTA4NzljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcmVhcz0yME09QzM9QkNsbGVyPz0gPHNj
aG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+CkRhdGU6IFdlZCwgMjAgQXByIDIwMTYgMTI6MDI6
MDMgKzAyMDAKU3ViamVjdDogW1BBVENIXSBleGFtcGxlczogZml4IGJ1aWxkIGZvciBzZXNzaW9u
bWFuYWdlbWVudCBkaXNhYmxlZApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVXBz
dHJlYW0tU3RhdHVzOiBQZW5kaW5nCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNj
aG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+Ci0tLQogZXhhbXBsZXMvd2lkZ2V0cy9tYWlud2lu
ZG93cy9hcHBsaWNhdGlvbi9tYWlud2luZG93LmNwcCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9leGFtcGxlcy93aWRnZXRzL21haW53aW5kb3dz
L2FwcGxpY2F0aW9uL21haW53aW5kb3cuY3BwIGIvZXhhbXBsZXMvd2lkZ2V0cy9tYWlud2luZG93
cy9hcHBsaWNhdGlvbi9tYWlud2luZG93LmNwcAppbmRleCA4NjFiOTA4Li4xMWZhYzc0IDEwMDY0
NAotLS0gYS9leGFtcGxlcy93aWRnZXRzL21haW53aW5kb3dzL2FwcGxpY2F0aW9uL21haW53aW5k
b3cuY3BwCisrKyBiL2V4YW1wbGVzL3dpZGdldHMvbWFpbndpbmRvd3MvYXBwbGljYXRpb24vbWFp
bndpbmRvdy5jcHAKQEAgLTU5LDkgKzU5LDExIEBAIE1haW5XaW5kb3c6Ok1haW5XaW5kb3coKQog
ICAgIGNvbm5lY3QodGV4dEVkaXQtPmRvY3VtZW50KCksICZRVGV4dERvY3VtZW50Ojpjb250ZW50
c0NoYW5nZWQsCiAgICAgICAgICAgICB0aGlzLCAmTWFpbldpbmRvdzo6ZG9jdW1lbnRXYXNNb2Rp
ZmllZCk7CiAKKyNpZm5kZWYgUVRfTk9fU0VTU0lPTk1BTkFHRVIKICAgICBRR3VpQXBwbGljYXRp
b246OnNldEZhbGxiYWNrU2Vzc2lvbk1hbmFnZW1lbnRFbmFibGVkKGZhbHNlKTsKICAgICBjb25u
ZWN0KHFBcHAsICZRR3VpQXBwbGljYXRpb246OmNvbW1pdERhdGFSZXF1ZXN0LAogICAgICAgICAg
ICAgdGhpcywgJk1haW5XaW5kb3c6OmNvbW1pdERhdGEpOworI2VuZGlmCiAKICAgICBzZXRDdXJy
ZW50RmlsZShRU3RyaW5nKCkpOwogICAgIHNldFVuaWZpZWRUaXRsZUFuZFRvb2xCYXJPbk1hYyh0
cnVlKTsKLS0gCjIuNS41Cgo=

--001a1137c968c431ed0530e7c80d--
