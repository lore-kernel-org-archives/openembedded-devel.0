Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1M8VKh-0003CU-Re
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 10:14:58 +0200
Received: by ewy20 with SMTP id 20so3034763ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rN7JAgGdXnfbH3QE/bpJ0M9ImtZZQ9isERepnxXtxGg=;
	b=UXdjEcKHZqUSg82Wc61IN5gQaCxU0kch6uAnPb6iGrWtvHvRCeregyGcbP1c3zMxdF
	8hOeqCARln6xRu8lu6+L8R+SLRVBmN73eTltMMyKma9D90fVTv/XwV3+482AvdHkylJd
	+X+M5zFUUoz+52+9mwTmhHUf/uf0ypjP8DiWg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=opCJnf/+M59SCwkt1PNJP+/vrPhSLjzAhwrVP2B8clxg3GE20Rfgi74RYr/+MiBxC+
	4pl9fed+G3baI39t/DZTKfjh1I1osoGxvH342R9oLEtUBCywxNkL3Xm3eocruqPmFYAN
	81tYX0KKDfeuYncCTRFxLHI320wqX6lBZGz1g=
MIME-Version: 1.0
Received: by 10.216.13.209 with SMTP id b59mr1456413web.44.1243238815272; Mon, 
	25 May 2009 01:06:55 -0700 (PDT)
In-Reply-To: <1243164722.4226.129.camel@lenovo.internal.reciva.com>
References: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
	<1243164722.4226.129.camel@lenovo.internal.reciva.com>
Date: Mon, 25 May 2009 10:06:55 +0200
Message-ID: <5c5e5c350905250106v6d1c4be4laebb4517abbc44ac@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Add gtksourceview 2.x and rename the 1.x tree recipe
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
X-List-Received-Date: Mon, 25 May 2009 08:15:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2009 at 1:32 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2009-05-14 at 10:14 +0200, Elena Grandi wrote:
>> GtkSourceView[1] currently maintains a stable 2.x tree and an old stable
>> 1.x tree for compatibility with older applications[2] and they can be
>> installed together on a computer.[...]
> Is there really any need to rename the old one? =A0It seems like it would
> be better just to leave the existing gtksourceview alone and add the new
> one as gtksourceview2 or some such.

no, there is no real need, except for the fact that now it would be
easy to do so, while in the future it could became problematic as new
recipes are added

for my needs adding gtksourceview2 is good enough

--=20
Elena ``of Valhalla''

email: elena.valhalla@gmail.com


