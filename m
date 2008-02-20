Received: from [64.233.178.246] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JRxZd-0000iD-EY
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2008 23:38:26 +0100
Received: by hs-out-0708.google.com with SMTP id n78so2903558hsc.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2008 14:37:54 -0800 (PST)
Received: by 10.100.123.4 with SMTP id v4mr18383081anc.14.1203547074765;
	Wed, 20 Feb 2008 14:37:54 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Wed, 20 Feb 2008 14:37:54 -0800 (PST)
Message-ID: <c384c5ea0802201437l5a15ddbcu13904422f9bf7aa6@mail.gmail.com>
Date: Wed, 20 Feb 2008 23:37:54 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47BAC66A.8090700@bolloretelecom.eu>
MIME-Version: 1.0
References: <1203419692.21824.35.camel@dax.rpnet.com>
	<20080219113024.32ba3368@cimmeria>
	<47BAC66A.8090700@bolloretelecom.eu>
X-SA-Exim-Connect-IP: 64.233.178.246
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE.dev roadworks notification
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2008 22:38:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

On Tue, Feb 19, 2008 at 1:07 PM, Jeremy Lain=E9
<jeremy.laine@bolloretelecom.eu> wrote:
>  I would also prefer to see packaged staging as the default.
>  It will go a long way towards making builds deterministic as
>  opposed to the current situation where you may or may not
>  have cruft leftover in your staging directory, depending on
>  what you built in the past.
>
I agree with Jeremy's reasoning.

The only deterministic build currently is a build-from-scratch.
Packages configure themselves against anything that you might have
staged but what does not end up in the image.

To what stage is .stable synchronized with current .dev? I would like
to move all my running projects across both branches so that I can
both
(1) continue working on them
(2) test Richard's efforts on .dev

And Richard, your work is greatly applauded!

Regards from a mere handful-of-package maintainer,
--=20
Leon


