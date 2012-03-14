Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1S7nUy-0004Cu-PM
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 13:40:13 +0100
Received: by vcbfl13 with SMTP id fl13so2044808vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nkytVjUmdt01Fsb03lJHWb+ywVxmQUq8mnWW4OaFQd8=;
	b=wdOsePctGceraPaYBmOmxeRF3L5WbyIbeLTwYAp2mIh3aC1ZSwDNshl9onI50fD+p0
	EeAOCV2Tf6uA+TPZF28Xl8tyhmi3Lg8AvfKmFZAQ0CPl9TzhwWcYuZYI10dHmXKSujDC
	fV5S6KbZNgPFC637cq/7nDDwDd1Iu2ui2UfTuVWsF7GKlCx3ERfMg6yLPa4jVeNE0x/O
	mNA+ie/RhjsppYjd4O5Tu7UNb8nYwgbxzrs9jJX6ZOWdKV3Vcx/runI1TTMCtzEdlESH
	4HhNjq6SHPiz+AtnyLMZIXHUoVVORh7r8Cb1yzRyfg7rraJ+tOKzWHwTzq8ZwMoe+l5b
	vwdw==
MIME-Version: 1.0
Received: by 10.52.95.74 with SMTP id di10mr1675461vdb.46.1331728286239; Wed,
	14 Mar 2012 05:31:26 -0700 (PDT)
Received: by 10.52.30.98 with HTTP; Wed, 14 Mar 2012 05:31:26 -0700 (PDT)
In-Reply-To: <20120313175223.GB12674@bill-the-cat>
References: <1331472732-28668-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20120313175223.GB12674@bill-the-cat>
Date: Wed, 14 Mar 2012 13:31:26 +0100
Message-ID: <CACW_hTa6RSZd07O5fGSURRgohe04AG1_PDW_F0-JKdCmWFUdkQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] [PATCH 1/2] tzcode/tzdata: moved to 2012b; changed src location
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
X-List-Received-Date: Wed, 14 Mar 2012 12:40:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/3/13 Tom Rini <tom.rini@gmail.com>:
> On Sun, Mar 11, 2012 at 02:32:11PM +0100, Frans Meulenbroeks wrote:
>
>> elsie does not respond, so moved to ftp.iana.org (also used by oe-core)
>
> A quick check and I see that ftp.iana.org does NOT delete old versions
> so we can finally fix that problem too. =A0Please rework to use the new
> URL but not to change versions. =A0Thanks!
>

I agree that iana.org does not delete old versions, but it seems
better to me to move to the latest version as the tz info in that one
is more recent (and presumably better, although I did not check the
details; then again the 2012b version does work fine for me).

Frans


