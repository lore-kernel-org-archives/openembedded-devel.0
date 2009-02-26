Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Lcorj-0006oH-5v
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 23:38:03 +0100
Received: by rv-out-0708.google.com with SMTP id b17so801486rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 14:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pFjIhPuQMgNbYFzje6UVJLGZT/8u0Th692yrILV6LOg=;
	b=EguxajrPRcUrBPguucHNDQd8Qb0oe5JX0n1GU4WOHa8UbrcHlG/d6OoSDxGcwBtA7k
	JFeLoLtPuVzO4VA9h5UvLl0iZATnM4OpU64RzB79+dTpPawxKC/APi+5nInR6jI00PFD
	e16vnwYakfyW2Ut5zGUmNYalrcCGanYT95PPo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=h/LyVVkAWrl0Vf1tCHvcM6+/vhNjMPf4FojLyo+n3XkMIUlRLOc8drQqT1nhExpm1l
	sX15pQ8oHzQZ10qYad7hVF+LA9/MaMiIyQh8BNn7Ry7YwOdI7bNt4IcqR9TVY2kOI7V/
	mL/ieojSmY3dKD2xW0LvbuH6flpCvjuYppVuI=
MIME-Version: 1.0
Received: by 10.141.53.4 with SMTP id f4mr846408rvk.155.1235687680636; Thu, 26 
	Feb 2009 14:34:40 -0800 (PST)
In-Reply-To: <alpine.DEB.1.00.0902251712490.25447@localhost.localdomain>
References: <alpine.DEB.1.00.0902251712490.25447@localhost.localdomain>
Date: Thu, 26 Feb 2009 17:34:40 -0500
Message-ID: <f96d234e0902261434r7ac3e41ek877a8045f28e6425@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] getting_oe.xml: Update "Building Software" section.
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
X-List-Received-Date: Thu, 26 Feb 2009 22:38:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2009 at 8:15 PM, Theodore A. Roth <taroth@gmail.com> wrote:
>
> ---
> =A0docs/usermanual/chapters/getting_oe.xml | =A0317 +++++++++++++++++++++=
+++++++++-
> =A01 files changed, 310 insertions(+), 7 deletions(-)

Applied, thanks!

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


