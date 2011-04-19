Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QC9qS-0005t1-EW
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 14:15:52 +0200
Received: by qwh5 with SMTP id 5so3093566qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 05:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=saXhCUsh5cu1WrVu93j6xyNPJLRVjQwVxB/KYcMWKhw=;
	b=Y1cWTFyZVhozDTpwbHI0IzAMpgF3umIcBPVVfQxlo4TRuSE7yA8AIsJNd5hrkecDvT
	mKpAos/Ir8aqEq0i3mWSECjsG23u8oifWL8YjX6jtbpf+e1b7lXM2UnQ4TRA/cOk0d19
	ON2V9iqSX1LZz9TEAhr1m+x2YL7/h2WxYmQb0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SRLEP2HUeoZwZ4a5/+k/qB0bV4+ae/zQw4ubDaUpO5Q0GcuIFKdsv4Dr8kz2LEKd7s
	HFXQQHmjFdxAvPavfObw/0vGGuJEDnAtNDnLm1+X2reg0uIZQewQLYERM6xvDWJs4wAl
	vyhe2tNQSXQbZsl6z/d/WLnBKXfK8Ln5lVqHY=
MIME-Version: 1.0
Received: by 10.229.114.200 with SMTP id f8mr4375076qcq.68.1303215210493; Tue,
	19 Apr 2011 05:13:30 -0700 (PDT)
Received: by 10.229.224.14 with HTTP; Tue, 19 Apr 2011 05:13:30 -0700 (PDT)
Received: by 10.229.224.14 with HTTP; Tue, 19 Apr 2011 05:13:30 -0700 (PDT)
In-Reply-To: <iojko1$bte$3@dough.gmane.org>
References: <1302727726-9362-1-git-send-email-eyalr@ti.com>
	<iojko1$bte$3@dough.gmane.org>
Date: Tue, 19 Apr 2011 07:13:30 -0500
Message-ID: <BANLkTimCahieiD70bjeSJz=G6oFfTu--Eg@mail.gmail.com>
From: =?UTF-8?B?15DXmdeZ15wg16jXmdeZ15bXqA==?= <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCHv2] wpa-supplicant: Build from git sources
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
X-List-Received-Date: Tue, 19 Apr 2011 12:15:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This naming is used in other recipes building from git.
Any suggestions of how it should be called instead?
=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A 2011 4 19 12:35, =D7=9E=D7=90=D7=AA "K=
oen Kooi" <koen@dominion.thruhere.net> :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 13-04-11 22:48, Eyal Reizer wrote:
>> * Builds a new version 0.8.x which is not released yet as a zip file.
>> This version has new features like WIFI-direct used in new mac80211
>> versions
>>
>
> Same thing as with hostap-daemon: 'git' is not a valid PV.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNrVZBMkyGM64RGpERAiFKAJ0Qogin9nEKl1EAjRyxvlXaGJAFhQCfcVf1
> dOwRpnAJEiCi00ExVgZitQM=3D
> =3Dzcin
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

