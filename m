Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LcK7J-0007T6-Oi
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Feb 2009 14:48:05 +0100
Received: by rv-out-0708.google.com with SMTP id b17so27421rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 05:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=55OhOaH/1wYl+ksL+uFQgxg0jWEPWOruHD2y6xG8pB0=;
	b=hmfuFfZxdi/V9VYZtxC7tpMwHpY6mR87bwCYQD1QQrrcLvtc3U6iJ1AwVJAu2d03r9
	pf5WskPOd23IDUYhLAHL7TFlas6T0/Hl01494ZwglEaKKcj3l7ZrDAm+uQXN4V7Caeyv
	Fn89IU8RfNg5MuaYiGRpaxFPWmxQqdJ8SnltA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r+ogJZf4DwjlYAJ5uEugebvRjVbEO98+okOu16ws4oVwVngsakF2wgLpD8c7X4HfhC
	ZojBqIcIqoLn3b8P+M3jDTdVDWGl5nHak1mEPw/jCubmyOyE2V0KVevOdnY2g8RjqoND
	3PJN60XwLM09jCFyKpT6c1wLxC6QbHHNvOiUw=
MIME-Version: 1.0
Received: by 10.141.53.4 with SMTP id f4mr60964rvk.155.1235569495214; Wed, 25 
	Feb 2009 05:44:55 -0800 (PST)
In-Reply-To: <alpine.DEB.1.00.0902241827020.19556@localhost.localdomain>
References: <alpine.DEB.1.00.0902241827020.19556@localhost.localdomain>
Date: Wed, 25 Feb 2009 08:44:55 -0500
Message-ID: <f96d234e0902250544w629cc08fwf9710e83fd6da25c@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] getting_oe.xml: Update documentation.
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
X-List-Received-Date: Wed, 25 Feb 2009 13:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2009 at 9:30 PM, Theodore A. Roth <taroth@gmail.com> wrote:
> =A0* New section about directory structure.
> =A0* Update 'Getting BitBake' section.
>
> Resubmitted against .dev instead of .documentation.
>
> Signed-off-by: Theodore A. Roth <taroth@gmail.com>

Pushed, thanks.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


