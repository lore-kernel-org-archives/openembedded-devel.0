Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lynn.xin.lin@gmail.com>) id 1RG84Q-0000Qn-MB
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 13:42:58 +0200
Received: by vwe42 with SMTP id 42so217796vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ex0P3PvUPJVCqAH8/vSkIKNcQVkjpR4WEopjml+NreE=;
	b=O/p2/54r2nMxqJ1VOC7HalXkS97hNAeTwjMOYSagnXXxjsC1hZGhcReGCxqiTwyyGd
	g9fOL70C0HRwwfO0OxE9mJN3Xq7fr5leWhN6ZTawBD2qhJANhjWeT78UbBl2L78MbP2v
	jj3Nb4pzOnz+Y9/KPSVBMVKssXUYDsvfTI4MI=
MIME-Version: 1.0
Received: by 10.52.109.42 with SMTP id hp10mr1185500vdb.65.1318937828604; Tue,
	18 Oct 2011 04:37:08 -0700 (PDT)
Received: by 10.52.160.197 with HTTP; Tue, 18 Oct 2011 04:37:08 -0700 (PDT)
Received: by 10.52.160.197 with HTTP; Tue, 18 Oct 2011 04:37:08 -0700 (PDT)
In-Reply-To: <CACphT6KqgRkRt1vtfS8ROS5P36P=yKACX0tNV6gw7NTa25U9Bg@mail.gmail.com>
References: <CACphT6KqgRkRt1vtfS8ROS5P36P=yKACX0tNV6gw7NTa25U9Bg@mail.gmail.com>
Date: Tue, 18 Oct 2011 19:37:08 +0800
Message-ID: <CAPgpnMRYDpv6gKF2m7OTz-9BKgR1EYaEgu0Sqy2JDRKqiMxfXA@mail.gmail.com>
From: Lynn Lin <lynn.xin.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Openssl build bug
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
X-List-Received-Date: Tue, 18 Oct 2011 11:42:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2011-10-18 =E4=B8=8A=E5=8D=884:46=EF=BC=8C"Panda Resistor" <panda=
resistor@gmail.com>=E5=86=99=E9=81=93=EF=BC=9A
>
> Openssl-native_1.0.0d-r14 will not build on Ubuntu 11.10, but is building
on
> Ubuntu 10.04. The errors are undefined reference errors, and it has been
> suggested that they are linked to erroneous ordering of library
dependencies
> and dependency folders, however the libdepsfirst patch has been applied b=
y
> bitbake upon a compilation attempt.
>
> Cheers
>
I also see this error on ubuntu 11.10
_______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

