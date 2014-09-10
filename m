Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id CBFAB713DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 04:17:13 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id hy10so3625615vcb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Sep 2014 21:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=26LVn2umKzKxldMKn9A2eLl9uxQlePfRK41aWJ/l1xE=;
	b=PAjUXsUyclzpTyWpFPCUlGESsl4dQCR32xr8hNfrB+5w3utMSHRJsO/NLdGs/+4h71
	riggwKqvI/menv31IO644P1mruNzjd8lXjrM8+ZV+XRZ0sSoO90Vmfm6blAxIRMBo0vp
	W2YWtASRApmgUVdtrD7wfD4WA9HhC/Iyusobx1grUJH+TpRDi1IY6kV2ikmkffUv4adV
	petSzH5JCyz7XpVkt/JTwUeztIvLFFZF1+pDsCnzGVh+AjT834CaYsRkGO0YEJ0sq55T
	NSsLWUu1TewKq74ok1O3b6+s1OfiEQkoxdRzbaBPyJPROIINvhHMpjQNokvbAsiFgkOT
	dv/w==
X-Gm-Message-State: ALoCoQkCRJphQF14kAzObQph3qwUyNNIJTua8zkXPpHatAFAS9ncRXXLKnL0XX6Dzng0AxCf41OHo4+SmtEj4JW0csKAuKNeWQdIxFOLU/luzMBJNwWeM7oHV6uL93zqIjlU14lnqApo3PcCoIZmwJnbz3/w/XNhYg==
MIME-Version: 1.0
X-Received: by 10.52.3.40 with SMTP id 8mr28711305vdz.24.1410322634617; Tue,
	09 Sep 2014 21:17:14 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Tue, 9 Sep 2014 21:17:14 -0700 (PDT)
In-Reply-To: <CAP9ODKqbwXrieO8yUJYu6+vBK6qerCCZsamkbz6RO5vS0Wq_oA@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
	<CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
	<CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
	<CALRGHr_OiFeW60BsKxe0XdrBbkcXAE+usv3-=pHnhXCzONK_vg@mail.gmail.com>
	<CAP9ODKoBFp7Pskwch4nLq4mkJOB-uFh1m2w7zz46LZ=CUp5JAg@mail.gmail.com>
	<CALRGHr9iRe3j9j0ce2RnOz7TP+1UzaPqtE5vsooBze_A0fAuyA@mail.gmail.com>
	<CALRGHr98gwgsSQQ9tnLBan-XybFqXN=VoMKYueh5YWhOVXFWXQ@mail.gmail.com>
	<CAP9ODKqbwXrieO8yUJYu6+vBK6qerCCZsamkbz6RO5vS0Wq_oA@mail.gmail.com>
Date: Wed, 10 Sep 2014 09:47:14 +0530
Message-ID: <CALRGHr-kpOc88VED2YM3ZaS6beSXz_+xujK7UW6PmvO5BwzP2A@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Error while bitbake meta-toolchain-qt5
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
X-List-Received-Date: Wed, 10 Sep 2014 04:17:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,
     Please confirm the following that i had understood -

1. You have pushed the fix.
2. Now, i have to apply the patch, with

    SRCREV =3D "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
+QT_MODULE_BRANCH =3D "5.4"

 SRC_URI +=3D " \
     file://0001-examples.pro-include-server-buffer-only-when-buildin.patch
\

3. I need to write
    SRCREV =3D "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
    +QT_MODULE_BRANCH =3D "5.4"
in the file,   Home/bin/fsl-community-bsp/sources/meta-qt5//recipes-qt/qt5/
qtwayland_git.bb

4. Then apply patch
    $ patch <
file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \

Are the above steps are right? Please Otavio consider that i m beginner in
the Linux platform.

Thanking you.
Switesh.

On Tue, Sep 9, 2014 at 6:08 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> On Tue, Sep 9, 2014 at 6:12 AM, Switesh Fulpagare
> <switesh.fulpagare@mindastoneridge.com> wrote:
> > Correction in last mail,
> >
> > But now only one error is encountering as  qtwayland-native_git.bb,
> do_fetch
>
> I pushed the fix.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

