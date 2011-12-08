Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RYfSi-0003DZ-0P
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Dec 2011 16:00:41 +0100
Received: by qabg14 with SMTP id g14so1599385qab.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Dec 2011 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Y9qbcsmJwjGO00Db4x/tzHAAyF73izxd6dmR44rSoxc=;
	b=mmAwAyWIVto2zZIHiNPIn+jjqTPAHGFIocb42cjfvihh8p4gihhWFCdTv9gqwaGtGp
	IHSDQ4+Z1QnlTxo8Gx/T7UqhvEzOdjqVoUp+CbyUHIzfkQjV7t9V36UXTIhykVCrosWa
	C+9JXpsWb5yLO6vndvzNfh+x22lKg04I1kn7k=
MIME-Version: 1.0
Received: by 10.224.189.78 with SMTP id dd14mr3189981qab.31.1323356028848;
	Thu, 08 Dec 2011 06:53:48 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Thu, 8 Dec 2011 06:53:48 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>
Date: Thu, 8 Dec 2011 07:53:48 -0700
Message-ID: <CA+M6bXmAWBYktJBtxYXoqWsXr=2ADAqJ0+Xa4YWZkWYQV+wQMQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for libpam
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
X-List-Received-Date: Thu, 08 Dec 2011 15:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2011 at 9:42 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> wr=
ote:
> Hello Tom,
>
> Please pull this commit from here:
>
> git://github.com/mkarrman/openembedded
> Branch: maintenance
>
> Mats K=E4rrman (1):
> =A0 =A0 =A0368c68a =A0libpam_1.1.1: remove directory preventing /var/run =
from being volatile.

To be clear, since you've made changes to this patch based on Paul's
feedback for oe.dev/master, I expect a new pull request with these
changes incorporated, thanks!

--=20
Tom


