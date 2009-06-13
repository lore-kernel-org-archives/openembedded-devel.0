Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MFa4R-0003R0-EE
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jun 2009 22:43:23 +0200
Received: by gxk2 with SMTP id 2so4300867gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2009 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rcqKdHmUeys1N/P89aFwb2cA29yJizU4q6H/lxI2Sog=;
	b=yFj5+56pD0ugdOr1c7tEauPFgaZRFS0F/E0VgTYUCMh0UtVHO/aK2Gtfwg89ogLWB/
	IS/XvSgOJx7ewebuVQ2D+FnSWHH1hOXOOS2ba/WmB/tc0P5oawTfDFcn3CWlKi2C82kw
	xqwxxg1O4H7vYgcKni+pp5blGeW0/rFIqOjrc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TGGh6OKZTBwe+NcDDvAlciXNGw99WEkO5Hp0zoMrkMFAAMoTOlJqLwRCbgmwkifoIS
	P7G8xnxKJvHZJwR7N4loD1RCGFxCs2SF6pAVZ2UNTDuq4tf/VH9ETTlzxwHbzNvq5dlK
	W+25tJwgrlPKu7tzhEIUajYZ9z0fYKjc15gN0=
MIME-Version: 1.0
Received: by 10.231.18.140 with SMTP id w12mr2096232iba.55.1244925198529; Sat, 
	13 Jun 2009 13:33:18 -0700 (PDT)
In-Reply-To: <1244924378.29153.12.camel@lenovo.internal.reciva.com>
References: <1244924378.29153.12.camel@lenovo.internal.reciva.com>
Date: Sat, 13 Jun 2009 22:33:15 +0200
Message-ID: <c384c5ea0906131333p644316fcyf6719911c5bba57d@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: lib*.so in FILES_${PN}
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
X-List-Received-Date: Sat, 13 Jun 2009 20:43:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Phil,

On Sat, Jun 13, 2009 at 10:19 PM, Phil Blundell<philb@gnu.org> wrote:
> I propose to revert the patch in question, and instead just let
> procps.bb adjust its own local setting of FILES as necessary.
>
Agreed,
-- 
Leon


