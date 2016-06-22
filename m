Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8136FF01
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 20:01:53 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id t190so20647847pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 13:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=/H8uN+5DlTlBGqnCC2Qmhs8tW/1sQAHHeHP3XqfBlZo=;
	b=fQkc/+nTSiliYoUmmLfgSbDQMq1A3xsBvmPTEb1YzifJpQ9ZrDP9I7P0G85z8rKLTz
	K/WSuqME7BNqJanXPqFz7Atlm9BAEfrfc/xjcxD/IqmbvFEL3JAKDoUWUcKT44uOSFzr
	7sFt9sLOOZA8+2ZZmxc0HH7K9KQQREHbi1S+2Jwul2cCeCv1OfDH/WWzphQtRKEc3lOo
	7a43gKlsR6DRMb5vJ5rlc/WrghksZyQoEGq3+3Xek++/xCYEuY4DCTt/RtMwocMso5+C
	stvsTsBuy+s3lXtOTh84cMJoYJ0DwxesWLKdVpeRPH4EddjLRZMCKfZkC0UUKO2us/hq
	1VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=/H8uN+5DlTlBGqnCC2Qmhs8tW/1sQAHHeHP3XqfBlZo=;
	b=a4pEnhFeKLKpSVpyoxh+Z4LpdEmwLNMlGq0pihhKvuGi6H1FxMbXfvhER5C7UVgBpa
	IYAV0NCM9KPjE/VhvzhnLQ3CIj2Z6R8nfUK6ZVlgZn1VHXcG5es3pKKRqNx0xNjLMquU
	yxYDyvdAqAF18bvyTtC5tMZLpq1YbZ2W+AkpThPvbDqTumCC/rxLIRQ4rfcX/hZQOAYA
	r9K50cP4cMSWepF2JL8EjZ7ZSa2+ltg7BsRSLwdYWTJqNVTbbyAgz579Q/dz0JHCkjfA
	F28b6LwXdIVhHlLU1qH+uxjyjkR2NiUzZVC4M8FL2aOf96rq0gJ3Li4qqirS/zpZbdwr
	NK7A==
X-Gm-Message-State: ALyK8tJ91llAxcBbks2MqPFGQbH3WtxrdVEYOmnOELnYjLUt0RwKOtqMZ/JDGMrH0LOK7w==
X-Received: by 10.98.65.2 with SMTP id o2mr7308817pfa.97.1466625714368;
	Wed, 22 Jun 2016 13:01:54 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:115c:c15d:825f:58bc:113e?
	([2601:647:4c00:115c:c15d:825f:58bc:113e])
	by smtp.gmail.com with ESMTPSA id
	ns4sm1747675pab.40.2016.06.22.13.01.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 13:01:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <B7D5FA7C76968448B8E9D735071E5AC8163992B2@VSVR01.ZenoTrack.local>
Date: Wed, 22 Jun 2016 13:01:52 -0700
Message-Id: <41ABB027-8C2A-4C9A-A7D8-7AB45D67D749@gmail.com>
References: <8105716b-d375-8d23-d4ab-151da7078b8f@stella.at>
	<B7D5FA7C76968448B8E9D735071E5AC8163992B2@VSVR01.ZenoTrack.local>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: LXDM only showing black screen in krogoth
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
X-List-Received-Date: Wed, 22 Jun 2016 20:01:55 -0000
X-Groupsio-MsgNum: 61938
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6A65DD4C-F920-4DB8-B93A-AF7510C5147C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6A65DD4C-F920-4DB8-B93A-AF7510C5147C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 2, 2016, at 9:50 AM, Kai Iskratsch =
<Kai.Iskratsch@zenotrack.com> wrote:
>=20
> Our system is based on an intel-atom and i was just testing the =
upgrade from yocto 2.0 to 2.1. In Jethro lxdm with configured autologin =
to a xfce4 session is workign without problems.
> now i tried a testbuild based on krogoth the build went through =
without problems, but in this image lxdm is just displaying a black =
screen. So i tried disabling the autologin, but that did not change =
anything.
>=20
> lxdm and X seem to be running, there is just nothing displayed, only =
hint seems to be in lxdm log (** Message: spawn lxdm-session fail)


you lxdm logs say

** Message: find greeter (nil)

may be thats a starting point to investigate

>=20
> root@xxxxx~# systemctl status lxdm
> =E2=97=8F lxdm.service - LXDE Display Manager
>   Loaded: loaded (/lib/systemd/system/lxdm.service; enabled; vendor =
preset: enabled)
>   Active: active (running) since Thu 2016-06-02 09:10:13 CEST; 4min 3s =
ago
> Main PID: 532 (lxdm-binary)
>   CGroup: /system.slice/lxdm.service
>           =E2=94=9C=E2=94=80532 /usr/sbin/lxdm-binary
>           =E2=94=94=E2=94=80571 /usr/bin/X -s 0 :0 vt07 -nolisten tcp =
-novtswitch -auth /var/run/lxdm/lxdm-:0.auth
>=20
> Jun 02 09:10:13 xxxxx systemd[1]: Started LXDE Display Manager.
> <Xorg.0.log><lxdm.log>--
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_6A65DD4C-F920-4DB8-B93A-AF7510C5147C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldq7rAACgkQuwUzVZGdMxS8WwCfcPNh/v3B7HUULVLWQ+LVLiD9
EaIAnAlUhNsBfbWzrfrqqUMO3v5Mh8va
=/ZUl
-----END PGP SIGNATURE-----

--Apple-Mail=_6A65DD4C-F920-4DB8-B93A-AF7510C5147C--
