Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhUx2-0006jI-H6
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 23:31:56 +0100
Received: by yie16 with SMTP id 16so1635786yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 14:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Aj3HOYxSxFeAWNiSn5nZicAAO/O+4rheY8vGuYKWXU8=;
	b=bIM6/Hyi7wn7dA3zMbW6XjCA11M4BhFgWkSa9H2E8YzTW/IJ2u2hq9H8ZAy20tE7NB
	rrfnbiFv1o4sibpW/BWTCKuRl2eDSEn7eHrbG9/dpg2TqcqN6M6Rr6Sf6eOGWgBn/Wzd
	gyHDTpotpeyJmR4XG8mfJN7kIVRJvmT1S1sZM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=NJ+GtmX05B0+fGFZCJjikNVXg5b0icKT6Yaqmv3H2I+d17qNQhFF5HEYBlOP9hK+1M
	I4EQOhmMuvkMqSDcFl9p6q2xAPzLdel7Xr84WJEyBukjGXhhIcyTO1uInuOas7p66AvE
	ZAX4Qx5eXZNTU+AlnwhqihBe6yONYkjtGTvGQ=
Received: by 10.90.80.18 with SMTP id d18mr5705835agb.31.1295908270137; Mon,
	24 Jan 2011 14:31:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.45.13 with HTTP; Mon, 24 Jan 2011 14:30:47 -0800 (PST)
In-Reply-To: <4D3DF2DC.2020107@freyther.de>
References: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
	<1295900293-25470-4-git-send-email-raj.khem@gmail.com>
	<4D3DF2DC.2020107@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2011 14:30:47 -0800
Message-ID: <AANLkTinV-mV+vFnQLHwxdhUnaz5XYXsJFMC=2vXBz6OB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/5] recipes/meta recipes/tasks: Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Mon, 24 Jan 2011 22:31:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2011 at 1:45 PM, Holger Freyther <holger+oe@freyther.de> wr=
ote:
> On 01/24/2011 09:18 PM, Khem Raj wrote:
>> -DEPENDS =3D "opkg-native ipkg-utils-native fakeroot-native sed-native z=
ip-native"
>> +DEPENDS =3D "opkg-native opkg-utils-native fakeroot-native sed-native z=
ip-native"
>> =C2=A0PR =3D "r5"
>
> Do you want to change the PR?

Will do.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


