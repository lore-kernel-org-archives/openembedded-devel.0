Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1R5gMa-0001g5-Td
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 18:06:33 +0200
Received: by gyg8 with SMTP id 8so24681552gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=AvxsEO485WY6efcvXN5U1g6mtYqNJQ0C1pZ9hx1SBb4=;
	b=vIEdziiJOtaiYfJwhXxZB5uZerxxla2EpwMC3VcM1rnlsin0fbHMwBvTPeq+oGtu7V
	IsoNaiUKBo6zqbKk3zWBTV9TV9l8NKQykkvBbt91rjuYVbSqqZC04Q2dtjVajmzU6kBj
	x4s9RrdTEgpMUpUc8/yTjMXyJ5q5cV3eXI+Vw=
MIME-Version: 1.0
Received: by 10.42.197.67 with SMTP id ej3mr4889154icb.213.1316448075805; Mon,
	19 Sep 2011 09:01:15 -0700 (PDT)
Received: by 10.42.225.6 with HTTP; Mon, 19 Sep 2011 09:01:15 -0700 (PDT)
In-Reply-To: <4E732FE1.6030202@dresearch-fe.de>
References: <4E732FE1.6030202@dresearch-fe.de>
Date: Mon, 19 Sep 2011 09:01:15 -0700
Message-ID: <CA+M6bXn85txxE8+GrvzgaLduTAzNyh6pCFcmb9kmvk6Smq9edQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [2011.03-maintenance] pull request
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
X-List-Received-Date: Mon, 19 Sep 2011 16:06:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 4:15 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> Hi Tom,
>
> please pull these 2 commits from here:
>
> URI: git://git.openembedded.org/openembedded
> Branch: sledz/maintenance
>
> Steffen Sledz (2):
> =A0 =A0 =A0rsyslog: switch to new upstream version 5.8.4
> =A0 =A0 =A0linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from linux=
 2.6.26
>
> Both are bugfixes and already in oe-dev (aka OE classic) master.

Applied, thanks (and cursing a lack of GPG+gmail interface, outside of imap=
)

--=20
Tom


