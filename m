Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 61B0460B06
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 20:35:26 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id w9so14210312iob.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 13:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=omXMEa3CkErMMt9GTIu22Wcl9JbBkX2zg9enCOEm+Lo=;
	b=j2N3AmZJ3EWcMWDaU2XnYHjkq394BobKxeN2W3K0qSUj0oUVGyNYHjvPSkPtTT7Rdj
	y96yWFpy6JW7V+8woH8HuvHGgFe31+Pw3tpvaowamDwf54LgONrFZthSqSuO5wkNLpmO
	ISvT2Vbi4ilo6MsBum76D56ntfbqY14CwhaqBjubPtt0rIbO0YoX1NL8y3602op16dIz
	6JTK96nMffldWmkzL5ZxulCyKZ53itt6nfoSSOjaWJy7sBKqjKgx5Xzqpk0wsMO27Hu+
	Ck3QJBqAdEYNV4iwhIs3QQpVpEEJLRaWMQr3zSqdzcqRXlh92oYdvhSO5K6dQ3xLumW1
	QUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=omXMEa3CkErMMt9GTIu22Wcl9JbBkX2zg9enCOEm+Lo=;
	b=tUHg+nu+Kmz7HV+gqd9BRRgKofWAMeORRlhdVJqZVPZNdF/GEUr0uqFlVHzOAxUjX9
	FvclKHqTillpQzITpTG3G/eHg/yatLYxGeXXVQY0hKTAWestjbH15mCwPURafMA04u/U
	XKKKR4oNefs4s0a3ABKZWTM24KgIQpQis02CXB6YushYtMgou6f1XZoON/reH8m/cAFi
	2luyGzJYd1Oa649HesEjFGIjv2DTC5eYcgLyoXHzY9VXEf82nYA6k/55cbEEJ2unuOFq
	ymSlY8jSgKVXgFRf5KN9D3+lne40yR6WPlmeiUadLCd3LanDfPvN8wSOeenQ6a89EYIO
	Aikw==
X-Gm-Message-State: ANhLgQ1YfK0aN8wCiqyqUYLWrdhj9Fo6vFEoN1VFkblc9TTCkobjo00q
	eCp9B9VymBn2H3Hr8m29wQitKdPsStxVUcY9bKo=
X-Google-Smtp-Source: ADFU+vtz3p1N0BHADL+jQHBmQJNbjxn3idoiB2XNZDCOH2dC2nfoU5dP4zKzN6T/zuQTuaLMLVUMSJ3p3fTFnOGwX0k=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr22235353jag.22.1583872527011; 
	Tue, 10 Mar 2020 13:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200310024936.18941-1-scott.branden@broadcom.com>
	<CANx9H-A_bpFV7c+u_-3p23a4kUmjiuQ+FUE5LqtKu2_rDW+BzQ@mail.gmail.com>
	<3a1066ff-7016-dd0b-a7f5-197631b92785@gmail.com>
In-Reply-To: <3a1066ff-7016-dd0b-a7f5-197631b92785@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 10 Mar 2020 13:35:14 -0700
Message-ID: <CANx9H-COTxmHWTQzW_Uu7SfgO3dq54-qKr0VHAo0Yvirj6V4Aw@mail.gmail.com>
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python3-pycryptodomex: add 3.9.4 recipe
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
X-List-Received-Date: Tue, 10 Mar 2020 20:35:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 12:56 PM Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@=
gmail.com>
wrote:

> Hi,
>
> Actually no.
>
> pythonX-cryptodome has need to conflict with pythonX-crypto.
>
> But python3-cryptodomex can coexists with either one of those as they
> have own namespace.
>

That is probably what I am remembering, since I had to fix that exact issue
on meta-python2.


> Some software need to unfortunately have both python3-cryptodome (brings
> python3-crypto "API emulation") and python3-cryptodomex installed in
> order to function.
>

We (all of us ;) should look for recipes that have legacy RDEPENDS on
python3-crypto or python3-cryptodome , when in fact they could use the
cleaner solution of python3-cryptodomex.

Commits I made in meta-python2 might help.

Thank you for digging deeper and capturing the state of things.


> Thanks,
> Vesa J=C3=A4=C3=A4skel=C3=A4inen
>
> On 10.3.2020 7.50, Tim Orling wrote:
> > This probably should have an RCONFLICTS with python3-cryptodme (and may=
be
> > even python3-crypto).
> >
> > These three packages step all over each other with same functionality..=
.
> >
> > On Mon, Mar 9, 2020 at 7:50 PM Scott Branden via Openembedded-devel <
> > openembedded-devel@lists.openembedded.org> wrote:
> >
> >> From: Rajesh Ravi <rajesh.ravi@broadcom.com>
> >>
> >> Add python3-pycryptodomex 3.9.4 recipe needed to build
> >> such components as optee 3.8.0.
> >>
> >> Signed-off-by: Rajesh Ravi <rajesh.ravi@broadcom.com>
> >> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> >> ---
> >>   .../python/python3-pycryptodomex_3.9.4.bb     | 30
> +++++++++++++++++++
> >>   1 file changed, 30 insertions(+)
> >>   create mode 100644 meta-python/recipes-devtools/python/
> >> python3-pycryptodomex_3.9.4.bb
> >>
> >> diff --git a/meta-python/recipes-devtools/python/
> >> python3-pycryptodomex_3.9.4.bb b/meta-python/recipes-devtools/python/
> >> python3-pycryptodomex_3.9.4.bb
> >> new file mode 100644
> >> index 000000000..be6b10f3f
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/
> python3-pycryptodomex_3.9.4.bb
> >> @@ -0,0 +1,30 @@
> >> +SUMMARY =3D "Cryptographic library for Python"
> >> +DESCRIPTION =3D "PyCryptodome is a self-contained Python package of
> >> low-level\
> >> + cryptographic primitives."
> >> +HOMEPAGE =3D "http://www.pycryptodome.org"
> >> +LICENSE =3D "PD & BSD-2-Clause"
> >> +LIC_FILES_CHKSUM =3D
> >> "file://LICENSE.rst;md5=3D6dc0e2a13d2f25d6f123c434b761faba"
> >> +
> >> +SRC_URI[md5sum] =3D "46ba513d95b6e323734074d960a7d57b"
> >> +SRC_URI[sha256sum] =3D
> >> "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
> >> +
> >> +inherit pypi
> >> +inherit setuptools3
> >> +
> >> +RDEPENDS_${PN} +=3D " \
> >> +    ${PYTHON_PN}-io \
> >> +    ${PYTHON_PN}-math \
> >> +"
> >> +
> >> +RDEPENDS_${PN}-tests +=3D " \
> >> +    ${PYTHON_PN}-unittest \
> >> +"
> >> +
> >> +PACKAGES =3D+ "${PN}-tests"
> >> +
> >> +FILES_${PN}-tests +=3D " \
> >> +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
> >> +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
> >> +"
> >> +
> >> +BBCLASSEXTEND =3D "native nativesdk"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

