Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MCZIY-0003Zn-P8
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 15:17:30 +0200
Received: by qw-out-1920.google.com with SMTP id 14so865473qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2009 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hBCZpJxG/qvczYFI+mOBOCMdWjwcWnxLwUUt5URX4b4=;
	b=hZ57enteF+5k0TTY9MXAqi2Ov1t5iJ3YBfci3Z5ZelTmTHOy7oTVVE/mRLjgq7mavz
	1IFFST5mckYClxCycq2frQaq086meIwaRbnRh/JkkyTM96wbo9UIcE1FfKH7H8AV/GpX
	0jT+eRjLmK+qk0XfsT8ygbasLz+QFpYmbEwmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NwJC4DI8IdacGCyJ50UCCcPHOU4V6xFbyqB+Pw/VNdsL6gLLljdWOe8LU65z94sxI/
	jgr7zdVxLmr8fhLEDm91/129i2LNCZ5wuQg/xt/KOONKRLyU232ve0YtBbw5d/5Na2rJ
	85CRKqOfSI5jYOaaobqAWUBIIrVH/LIeq64wM=
MIME-Version: 1.0
Received: by 10.231.11.140 with SMTP id t12mr919625ibt.44.1244207300501; Fri, 
	05 Jun 2009 06:08:20 -0700 (PDT)
In-Reply-To: <1244206798.2611.160.camel@mill.internal.reciva.com>
References: <1244206798.2611.160.camel@mill.internal.reciva.com>
Date: Fri, 5 Jun 2009 15:08:20 +0200
Message-ID: <c384c5ea0906050608j3b3ace50x81e5ac4983a174ec@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [patch] micro: eliminate some further bloat
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
X-List-Received-Date: Fri, 05 Jun 2009 13:17:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2009 at 2:59 PM, Phil Blundell<philb@gnu.org> wrote:
> Almost the entire contents of the base-files package is unnecessary in a
> micro-type environment, some of it (e.g. /usr/games) laughably so. =A0The

Acked-by: Leon Woestenberg <leon@sidebranch.com>

--=20
Leon


