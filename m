Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.8829.1592185879925668589
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2020 18:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PpPL5BSV;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id ec10so7069644qvb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2020 18:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhGzsIsflfGf4B75Ras1HWF+EQ7sUaWvTVLuSyZtJe8=;
        b=PpPL5BSVAKUEd3gIxfQOkPD/g3++IiZtf6mjZ/jGrsueRON4kHHMDd6gdhiPA+9XWO
         kaxrVMkSM/+yyxwbLgzSY6ioFliiO4pRiU9du9haGFz+++KUKlpsS2Rk/tlBx9xph+Zr
         fNNAKI99MW8jJSH/6IdetSqJeTc4Shq7pgQ3Su7TA88oMQCmZf375qCewqYfCMPl3y60
         grnG8CFcIiFPpTYwhqVW3qgzVPBC35Wy9kTr3VeAP5af0MnM1tfYJTmoTRmw7q/uGHyW
         /4Yp1H0UZnf4s/hfL+SSNGavHdoFHDOzTUfHSECuvTorKbnEGzayx6Pcpbn0UsY4YG4y
         bCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhGzsIsflfGf4B75Ras1HWF+EQ7sUaWvTVLuSyZtJe8=;
        b=jCeAG/gqVqM/vjp+/AyKmOOsxZWkmZ+IWlOHP47wXKco5pe59w6Ns3Z7bF+Hq2d2E0
         lWJqWY2KQtsDJWcJcDbFWvnWIO5GlfmlXnYpc35RPPD5bgzPZ/QWPMXahf5dEuv4DV3B
         mvoc9mKFDrtTq3Y5MpZqsfayaGlMfVXfMP8jMLiK+4+su9DPcQNYcvpd7mk2WJBnnKpQ
         uK/2YMLgpDIG+hRRtzCuF7NoLX6VR2PN+PTPnHY6lNyLKddP7ZU4uQMx//A6n6CLfuah
         c/1IvksIhwpuFZIOcHq8NIZjutnf5Cml5mP8DZMZfxzvoF8DKuF8rxx1GJHG8N3b1e/f
         e0eQ==
X-Gm-Message-State: AOAM531YCFoT19ntLuMBem+NUj3+hIz2p6fu9OO6e6OD3Yx768eGIO/Y
	irVIMpsG9wDO/pr3zpEnRWRccMXMrBsdVuG//ig=
X-Google-Smtp-Source: ABdhPJzW1P/Ga2XEIcpJmXVKTwGK9wIGGiL/LzlaaQycAE6tfAcN+jz4uQ0re4roak9K/L8+Yc+W5IyXYJQ4L5vwUJA=
X-Received: by 2002:a0c:f888:: with SMTP id u8mr22535302qvn.130.1592185878960;
 Sun, 14 Jun 2020 18:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591886131.git.akuster808@gmail.com> <CAMKF1so4fDkW6eitZgDgPua2MdxAk5Q8tMLTXbySMT3+=XYzKQ@mail.gmail.com>
 <d2b73e4b-2462-e6cd-4a1b-067c5c3f8de3@gmail.com>
In-Reply-To: <d2b73e4b-2462-e6cd-4a1b-067c5c3f8de3@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 14 Jun 2020 18:51:08 -0700
Message-ID: <CAMKF1sqVJOtM2jg94XA8TxEX8OhWEvP9Rb+5g7TwBF3MQzu4=g@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/27] Merge request #3
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bb5c7805a815a9c4"

--000000000000bb5c7805a815a9c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2020 at 7:48 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 6/11/20 11:52 AM, Khem Raj wrote:
> > On Thu, Jun 11, 2020 at 7:38 AM akuster <akuster808@gmail.com> wrote:
> >> Please merge these changes to dunfell
> >> Cover letter only
> >>
> >> The following changes since commit
> cc155826b0b4f202a8fa4ac103b7c38368d32734:
> >>
> >>   thunar: upgrade 1.8.14 -> 1.8.15 (2020-05-28 21:50:13 -0700)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.openembedded.org/meta-openembedded dunfell-next
> >>   http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfell-nex=
t
> >>
> >> Adrian Bunk (1):
> >>   python3-docutils: Remove, moved to OE-core
> >>
> >> Andreas M=C3=BCller (1):
> >>   fluidsynth: upgrade 2.1.2 -> 2.1.3
> >>
> >> Denys Dmytriyenko (2):
> >>   python3-pycryptodome(x): moved to OE-Core, remove from meta-python
> >>   python3-pyelftools: moved to OE-Core, remove from meta-python
> >>
> >> Domarys Correa (1):
> >>   python3-pyyaml: Update 5.3 -> 5.3.1
> >>
> >> Hongxu Jia (1):
> >>   multipath-tools: fix compiling parallel issue
> >>
> >> Kai Kang (1):
> >>   plymouth: disable systemd-integration for sysvinit
> >>
> >> Khem Raj (1):
> >>   dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-outputdirs
> > this is not needed. Since relevant change in core is going to reverted
> > I plan to revert it in master of meta-oe too.
>
> Do i need to resend the merge request?


No are you ready with it now ?

>
>
> - armin
> >> Konrad Weihmann (6):
> >>   passwdqc: remove double modify operation
> >>   sound-theme-freedesktop: remove double depends
> >>   python3-cmd2: remove double colorama in RDEPENDS
> >>   python3-smbus2: remove duplicate RDEPENDS settings
> >>   python3-twisted: remove double var modification
> >>   proftpd: Fix typo for SRC_URI[md5sum]
> >>
> >> Leon Anavi (1):
> >>   python3-colorama: Upgrade 0.4.1 -> 0.4.3
> >>
> >> Maciej Pijanowski (1):
> >>   qpdf: fix typo in RDEPENDS
> >>
> >> Martin Jansa (2):
> >>   irssi: package libirc_proxy.a in PN-staticdev
> >>   meta-python: depend on core version 12 or higher
> >>
> >> Patrick Williams (1):
> >>   net-snmp: refresh patches
> >>
> >> Zang Ruochen (4):
> >>   libgphoto2: upgrade 2.5.24 -> 2.5.25
> >>   mosquitto: upgrade 1.6.9 -> 1.6.10
> >>   snort: upgrade 2.9.15 -> 2.9.16
> >>   wireshark: upgrade 3.2.2 -> 3.2.4
> >>
> >> Zheng Ruoqin (4):
> >>   nano: upgrade 4.9.2 -> 4.9.3
> >>   gsoap: upgrade 2.8.100 -> 2.8.103
> >>   logwatch: upgrade 7.5.1 -> 7.5.3
> >>   libnet-dns-perl: upgrade 1.23 -> 1.24
> >>
> >>  .../fluidsynth/fluidsynth.inc                 |  4 +-
> >>  ...tables-helper-we-have-to-use-native-.patch | 32 +++++++++----
> >>  ...mosquitto_1.6.9.bb =3D> mosquitto_1.6.10.bb} |  4 +-
> >>  ...deck-for-gettid-API-during-configure.patch | 48 -----------------=
--
> >>  .../{snort_2.9.15.bb =3D> snort_2.9.16.bb}      |  5 +-
> >>  .../recipes-daemons/proftpd/proftpd_1.3.6.bb  |  2 +-
> >>  ...upport-for-building-applications-and.patch | 24 +++++-----
> >>  .../0001-config_os_headers-Error-Fix.patch    | 10 ++--
> >>  ...t-snmp-fix-compile-error-disable-des.patch | 14 +++---
> >>  ...add-knob-whether-nlist.h-are-checked.patch | 15 +++---
> >>  ...{wireshark_3.2.2.bb =3D> wireshark_3.2.4.bb} |  4 +-
> >>  .../recipes-connectivity/irssi/irssi_1.2.2.bb |  2 +
> >>  .../recipes-core/plymouth/plymouth_0.9.4.bb   |  2 +-
> >>  .../{logwatch_7.5.1.bb =3D> logwatch_7.5.3.bb}  |  4 +-
> >>  ...gphoto2_2.5.24.bb =3D> libgphoto2_2.5.25.bb} |  4 +-
> >>  .../sound-theme-freedesktop_0.8.bb            |  2 +-
> >>  meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb  |  2 +-
> >>  .../passwdqc/passwdqc_1.3.1.bb                |  2 +-
> >>  .../dfu-util/dfu-util-native_0.9.bb           |  1 -
> >>  .../{gsoap_2.8.100.bb =3D> gsoap_2.8.103.bb}    |  4 +-
> >>  ...add-explicit-dependency-on-libraries.patch | 40 ++++++++++++++++
> >>  .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
> >>  .../nano/{nano_4.9.2.bb =3D> nano_4.9.3.bb}     |  4 +-
> >>  ...s-perl_1.23.bb =3D> libnet-dns-perl_1.24.bb} |  4 +-
> >>  meta-python/conf/layer.conf                   |  2 +-
> >>  .../python/python-pycryptodome.inc            | 29 -----------
> >>  .../python/python3-cmd2_0.9.23.bb             |  1 -
> >>  ...ama_0.4.1.bb =3D> python3-colorama_0.4.3.bb} |  4 +-
> >>  .../python/python3-docutils_0.15.2.bb         | 15 ------
> >>  .../python/python3-pycryptodome_3.9.4.bb      |  2 -
> >>  .../python/python3-pycryptodomex_3.9.4.bb     | 10 ----
> >>  .../python/python3-pyelftools_0.25.bb         | 14 ------
> >>  .../python/python3-pyyaml_5.3.1.bb            | 18 +++++++
> >>  .../python/python3-pyyaml_5.3.bb              | 19 --------
> >>  .../python/python3-smbus2_0.3.0.bb            |  2 -
> >>  .../python/python3-twisted_19.10.0.bb         |  4 +-
> >>  36 files changed, 144 insertions(+), 210 deletions(-)
> >>  rename meta-networking/recipes-connectivity/mosquitto/{
> mosquitto_1.6.9.bb =3D> mosquitto_1.6.10.bb} (95%)
> >>  delete mode 100644
> meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-=
API-during-configure.patch
> >>  rename meta-networking/recipes-connectivity/snort/{snort_2.9.15.bb =
=3D>
> snort_2.9.16.bb} (95%)
> >>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.2.bb
> =3D> wireshark_3.2.4.bb} (95%)
> >>  rename meta-oe/recipes-extended/logwatch/{logwatch_7.5.1.bb =3D>
> logwatch_7.5.3.bb} (95%)
> >>  rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.24.bb =3D>
> libgphoto2_2.5.25.bb} (91%)
> >>  rename meta-oe/recipes-support/gsoap/{gsoap_2.8.100.bb =3D>
> gsoap_2.8.103.bb} (89%)
> >>  create mode 100644
> meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependen=
cy-on-libraries.patch
> >>  rename meta-oe/recipes-support/nano/{nano_4.9.2.bb =3D> nano_4.9.3.b=
b}
> (80%)
> >>  rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.23.bb =3D>
> libnet-dns-perl_1.24.bb} (92%)
> >>  delete mode 100644
> meta-python/recipes-devtools/python/python-pycryptodome.inc
> >>  rename meta-python/recipes-devtools/python/{python3-colorama_0.4.1.b=
b
> =3D> python3-colorama_0.4.3.bb} (61%)
> >>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-docutils_0.15.2.bb
> >>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-pycryptodome_3.9.4.bb
> >>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-pycryptodomex_3.9.4.bb
> >>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-pyelftools_0.25.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pyyaml_5.3.1.bb
> >>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-pyyaml_5.3.bb
> >>
> >> --
> >> 2.17.1
> >>
> >>=20
>
>

--000000000000bb5c7805a815a9c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jun 14, 2020 at 7:48 AM akuster808 &lt;<a href=3D"=
mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
<br>
On 6/11/20 11:52 AM, Khem Raj wrote:<br>
&gt; On Thu, Jun 11, 2020 at 7:38 AM akuster &lt;<a href=3D"mailto:akuster=
808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Please merge these changes to dunfell<br>
&gt;&gt; Cover letter only<br>
&gt;&gt;<br>
&gt;&gt; The following changes since commit cc155826b0b4f202a8fa4ac103b7c3=
8368d32734:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0thunar: upgrade 1.8.14 -&gt; 1.8.15 (2020-05-28 21:50=
:13 -0700)<br>
&gt;&gt;<br>
&gt;&gt; are available in the Git repository at:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/meta-ope=
nembedded" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-o=
penembedded</a> dunfell-next<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/meta-openembe=
dded/log/?h=3Ddunfell-next" rel=3D"noreferrer" target=3D"_blank">http://cgi=
t.openembedded.org/meta-openembedded/log/?h=3Ddunfell-next</a><br>
&gt;&gt;<br>
&gt;&gt; Adrian Bunk (1):<br>
&gt;&gt;=C2=A0 =C2=A0python3-docutils: Remove, moved to OE-core<br>
&gt;&gt;<br>
&gt;&gt; Andreas M=C3=BCller (1):<br>
&gt;&gt;=C2=A0 =C2=A0fluidsynth: upgrade 2.1.2 -&gt; 2.1.3<br>
&gt;&gt;<br>
&gt;&gt; Denys Dmytriyenko (2):<br>
&gt;&gt;=C2=A0 =C2=A0python3-pycryptodome(x): moved to OE-Core, remove fro=
m meta-python<br>
&gt;&gt;=C2=A0 =C2=A0python3-pyelftools: moved to OE-Core, remove from met=
a-python<br>
&gt;&gt;<br>
&gt;&gt; Domarys Correa (1):<br>
&gt;&gt;=C2=A0 =C2=A0python3-pyyaml: Update 5.3 -&gt; 5.3.1<br>
&gt;&gt;<br>
&gt;&gt; Hongxu Jia (1):<br>
&gt;&gt;=C2=A0 =C2=A0multipath-tools: fix compiling parallel issue<br>
&gt;&gt;<br>
&gt;&gt; Kai Kang (1):<br>
&gt;&gt;=C2=A0 =C2=A0plymouth: disable systemd-integration for sysvinit<br=
>
&gt;&gt;<br>
&gt;&gt; Khem Raj (1):<br>
&gt;&gt;=C2=A0 =C2=A0dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-=
outputdirs<br>
&gt; this is not needed. Since relevant change in core is going to reverte=
d<br>
&gt; I plan to revert it in master of meta-oe too.<br>
<br>
Do i need to resend the merge request?</blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">No are you ready with it now ?</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
<br>
- armin<br>
&gt;&gt; Konrad Weihmann (6):<br>
&gt;&gt;=C2=A0 =C2=A0passwdqc: remove double modify operation<br>
&gt;&gt;=C2=A0 =C2=A0sound-theme-freedesktop: remove double depends<br>
&gt;&gt;=C2=A0 =C2=A0python3-cmd2: remove double colorama in RDEPENDS<br>
&gt;&gt;=C2=A0 =C2=A0python3-smbus2: remove duplicate RDEPENDS settings<br=
>
&gt;&gt;=C2=A0 =C2=A0python3-twisted: remove double var modification<br>
&gt;&gt;=C2=A0 =C2=A0proftpd: Fix typo for SRC_URI[md5sum]<br>
&gt;&gt;<br>
&gt;&gt; Leon Anavi (1):<br>
&gt;&gt;=C2=A0 =C2=A0python3-colorama: Upgrade 0.4.1 -&gt; 0.4.3<br>
&gt;&gt;<br>
&gt;&gt; Maciej Pijanowski (1):<br>
&gt;&gt;=C2=A0 =C2=A0qpdf: fix typo in RDEPENDS<br>
&gt;&gt;<br>
&gt;&gt; Martin Jansa (2):<br>
&gt;&gt;=C2=A0 =C2=A0irssi: package libirc_proxy.a in PN-staticdev<br>
&gt;&gt;=C2=A0 =C2=A0meta-python: depend on core version 12 or higher<br>
&gt;&gt;<br>
&gt;&gt; Patrick Williams (1):<br>
&gt;&gt;=C2=A0 =C2=A0net-snmp: refresh patches<br>
&gt;&gt;<br>
&gt;&gt; Zang Ruochen (4):<br>
&gt;&gt;=C2=A0 =C2=A0libgphoto2: upgrade 2.5.24 -&gt; 2.5.25<br>
&gt;&gt;=C2=A0 =C2=A0mosquitto: upgrade 1.6.9 -&gt; 1.6.10<br>
&gt;&gt;=C2=A0 =C2=A0snort: upgrade 2.9.15 -&gt; 2.9.16<br>
&gt;&gt;=C2=A0 =C2=A0wireshark: upgrade 3.2.2 -&gt; 3.2.4<br>
&gt;&gt;<br>
&gt;&gt; Zheng Ruoqin (4):<br>
&gt;&gt;=C2=A0 =C2=A0nano: upgrade 4.9.2 -&gt; 4.9.3<br>
&gt;&gt;=C2=A0 =C2=A0gsoap: upgrade 2.8.100 -&gt; 2.8.103<br>
&gt;&gt;=C2=A0 =C2=A0logwatch: upgrade 7.5.1 -&gt; 7.5.3<br>
&gt;&gt;=C2=A0 =C2=A0libnet-dns-perl: upgrade 1.23 -&gt; 1.24<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 .../fluidsynth/fluidsynth.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 ...tables-helper-we-have-to-use-native-.patch | 32 ++++++++=
+----<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://mosquitto_1.6.9.bb" rel=3D"noreferrer"=
 target=3D"_blank">mosquitto_1.6.9.bb</a> =3D&gt; <a href=3D"http://mosquit=
to_1.6.10.bb" rel=3D"noreferrer" target=3D"_blank">mosquitto_1.6.10.bb</a>}=
 |=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 ...deck-for-gettid-API-during-configure.patch | 48 --------=
-----------<br>
&gt;&gt;=C2=A0 .../{<a href=3D"http://snort_2.9.15.bb" rel=3D"noreferrer" =
target=3D"_blank">snort_2.9.15.bb</a> =3D&gt; <a href=3D"http://snort_2.9.1=
6.bb" rel=3D"noreferrer" target=3D"_blank">snort_2.9.16.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt;&gt;=C2=A0 .../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.6=
.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.6.bb</a>=C2=A0 |=C2=
=A0 2 +-<br>
&gt;&gt;=C2=A0 ...upport-for-building-applications-and.patch | 24 +++++---=
--<br>
&gt;&gt;=C2=A0 .../0001-config_os_headers-Error-Fix.patch=C2=A0 =C2=A0 | 1=
0 ++--<br>
&gt;&gt;=C2=A0 ...t-snmp-fix-compile-error-disable-des.patch | 14 +++---<b=
r>
&gt;&gt;=C2=A0 ...add-knob-whether-nlist.h-are-checked.patch | 15 +++---<b=
r>
&gt;&gt;=C2=A0 ...{<a href=3D"http://wireshark_3.2.2.bb" rel=3D"noreferrer=
" target=3D"_blank">wireshark_3.2.2.bb</a> =3D&gt; <a href=3D"http://wiresh=
ark_3.2.4.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_3.2.4.bb</a>} =
|=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 .../recipes-connectivity/irssi/<a href=3D"http://irssi_1.2.=
2.bb" rel=3D"noreferrer" target=3D"_blank">irssi_1.2.2.bb</a> |=C2=A0 2 +<b=
r>
&gt;&gt;=C2=A0 .../recipes-core/plymouth/<a href=3D"http://plymouth_0.9.4.=
bb" rel=3D"noreferrer" target=3D"_blank">plymouth_0.9.4.bb</a>=C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 .../{<a href=3D"http://logwatch_7.5.1.bb" rel=3D"noreferrer=
" target=3D"_blank">logwatch_7.5.1.bb</a> =3D&gt; <a href=3D"http://logwatc=
h_7.5.3.bb" rel=3D"noreferrer" target=3D"_blank">logwatch_7.5.3.bb</a>}=C2=
=A0 |=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://gphoto2_2.5.24.bb" rel=3D"noreferrer" =
target=3D"_blank">gphoto2_2.5.24.bb</a> =3D&gt; <a href=3D"http://libgphoto=
2_2.5.25.bb" rel=3D"noreferrer" target=3D"_blank">libgphoto2_2.5.25.bb</a>}=
 |=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 .../<a href=3D"http://sound-theme-freedesktop_0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">sound-theme-freedesktop_0.8.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 meta-oe/recipes-printing/qpdf/<a href=3D"http://qpdf_10.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">qpdf_10.0.1.bb</a>=C2=A0 |=C2=A0 =
2 +-<br>
&gt;&gt;=C2=A0 .../passwdqc/<a href=3D"http://passwdqc_1.3.1.bb" rel=3D"no=
referrer" target=3D"_blank">passwdqc_1.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 .../dfu-util/<a href=3D"http://dfu-util-native_0.9.bb" rel=
=3D"noreferrer" target=3D"_blank">dfu-util-native_0.9.bb</a>=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt;&gt;=C2=A0 .../{<a href=3D"http://gsoap_2.8.100.bb" rel=3D"noreferrer"=
 target=3D"_blank">gsoap_2.8.100.bb</a> =3D&gt; <a href=3D"http://gsoap_2.8=
.103.bb" rel=3D"noreferrer" target=3D"_blank">gsoap_2.8.103.bb</a>}=C2=A0 =
=C2=A0 |=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 ...add-explicit-dependency-on-libraries.patch | 40 ++++++++=
++++++++<br>
&gt;&gt;=C2=A0 .../multipath-tools/<a href=3D"http://multipath-tools_0.8.4=
.bb" rel=3D"noreferrer" target=3D"_blank">multipath-tools_0.8.4.bb</a>=C2=
=A0 |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 .../nano/{<a href=3D"http://nano_4.9.2.bb" rel=3D"noreferre=
r" target=3D"_blank">nano_4.9.2.bb</a> =3D&gt; <a href=3D"http://nano_4.9.3=
.bb" rel=3D"noreferrer" target=3D"_blank">nano_4.9.3.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://s-perl_1.23.bb" rel=3D"noreferrer" tar=
get=3D"_blank">s-perl_1.23.bb</a> =3D&gt; <a href=3D"http://libnet-dns-perl=
_1.24.bb" rel=3D"noreferrer" target=3D"_blank">libnet-dns-perl_1.24.bb</a>}=
 |=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 meta-python/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 .../python/python-pycryptodome.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 29 -----------<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-cmd2_0.9.23.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-cmd2_0.9.23.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://ama_0.4.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ama_0.4.1.bb</a> =3D&gt; <a href=3D"http://python3-colorama_0.=
4.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-colorama_0.4.3.bb</a>}=
 |=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-docutils_0.15.2.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-docutils_0.15.2.bb</a>=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0| 15 ------<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pycryptodome_3.9.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-pycryptodome_3.9.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 -<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pycryptodomex_3.9.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-pycryptodomex_3.9.4.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 10 ----<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pyelftools_0.25.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-pyelftools_0.25.bb</a>=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0| 14 ------<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pyyaml_5.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pyyaml_5.3.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pyyaml_5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pyyaml_5.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 --------<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-smbus2_0.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-smbus2_0.3.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 -<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-twisted_19.10.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-twisted_19.10.0.bb</a>=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 36 files changed, 144 insertions(+), 210 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta-networking/recipes-connectivity/mosquitto/{<a h=
ref=3D"http://mosquitto_1.6.9.bb" rel=3D"noreferrer" target=3D"_blank">mosq=
uitto_1.6.9.bb</a> =3D&gt; <a href=3D"http://mosquitto_1.6.10.bb" rel=3D"no=
referrer" target=3D"_blank">mosquitto_1.6.10.bb</a>} (95%)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta-networking/recipes-connectivity/sno=
rt/snort/0001-chdeck-for-gettid-API-during-configure.patch<br>
&gt;&gt;=C2=A0 rename meta-networking/recipes-connectivity/snort/{<a href=
=3D"http://snort_2.9.15.bb" rel=3D"noreferrer" target=3D"_blank">snort_2.9=
.15.bb</a> =3D&gt; <a href=3D"http://snort_2.9.16.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">snort_2.9.16.bb</a>} (95%)<br>
&gt;&gt;=C2=A0 rename meta-networking/recipes-support/wireshark/{<a href=
=3D"http://wireshark_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">wiresh=
ark_3.2.2.bb</a> =3D&gt; <a href=3D"http://wireshark_3.2.4.bb" rel=3D"noref=
errer" target=3D"_blank">wireshark_3.2.4.bb</a>} (95%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-extended/logwatch/{<a href=3D"http:/=
/logwatch_7.5.1.bb" rel=3D"noreferrer" target=3D"_blank">logwatch_7.5.1.bb<=
/a> =3D&gt; <a href=3D"http://logwatch_7.5.3.bb" rel=3D"noreferrer" target=
=3D"_blank">logwatch_7.5.3.bb</a>} (95%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-graphics/gphoto2/{<a href=3D"http://=
libgphoto2_2.5.24.bb" rel=3D"noreferrer" target=3D"_blank">libgphoto2_2.5.2=
4.bb</a> =3D&gt; <a href=3D"http://libgphoto2_2.5.25.bb" rel=3D"noreferrer"=
 target=3D"_blank">libgphoto2_2.5.25.bb</a>} (91%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-support/gsoap/{<a href=3D"http://gso=
ap_2.8.100.bb" rel=3D"noreferrer" target=3D"_blank">gsoap_2.8.100.bb</a> =
=3D&gt; <a href=3D"http://gsoap_2.8.103.bb" rel=3D"noreferrer" target=3D"_=
blank">gsoap_2.8.103.bb</a>} (89%)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/multipath-tools/=
files/0001-add-explicit-dependency-on-libraries.patch<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-support/nano/{<a href=3D"http://nano=
_4.9.2.bb" rel=3D"noreferrer" target=3D"_blank">nano_4.9.2.bb</a> =3D&gt; <=
a href=3D"http://nano_4.9.3.bb" rel=3D"noreferrer" target=3D"_blank">nano_4=
.9.3.bb</a>} (80%)<br>
&gt;&gt;=C2=A0 rename meta-perl/recipes-perl/libnet/{<a href=3D"http://lib=
net-dns-perl_1.23.bb" rel=3D"noreferrer" target=3D"_blank">libnet-dns-perl_=
1.23.bb</a> =3D&gt; <a href=3D"http://libnet-dns-perl_1.24.bb" rel=3D"noref=
errer" target=3D"_blank">libnet-dns-perl_1.24.bb</a>} (92%)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/pyth=
on-pycryptodome.inc<br>
&gt;&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http=
://python3-colorama_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
colorama_0.4.1.bb</a> =3D&gt; <a href=3D"http://python3-colorama_0.4.3.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-colorama_0.4.3.bb</a>} (61%)<b=
r>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-docutils_0.15.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-docutils_0.15.2.bb</a><br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-pycryptodome_3.9.4.bb" rel=3D"noreferrer" target=3D"_=
blank">python3-pycryptodome_3.9.4.bb</a><br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-pycryptodomex_3.9.4.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-pycryptodomex_3.9.4.bb</a><br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-pyelftools_0.25.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-pyelftools_0.25.bb</a><br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-pyyaml_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-pyyaml_5.3.1.bb</a><br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-pyyaml_5.3.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pyyaml_5.3.bb</a><br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;&gt; <br>
<br>
</blockquote></div></div>

--000000000000bb5c7805a815a9c4--
