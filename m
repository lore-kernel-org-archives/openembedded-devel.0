Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RmShn-0000HB-72
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 17:13:15 +0100
Received: by qcsp14 with SMTP id p14so1001951qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jan 2012 08:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=SHBFyKIMfZGZ+hkJi4Ve4JF0iZA3+6ADUlQsQo/sPhQ=;
	b=KPs+Pfx/5KIWskpowIUBCCFhhOluC32zztulCMOiTihBqsMn67DerzuVHDjX/HxRlz
	1zA4RjGFpJUIdkzrvG8jyyQ3mYLOHsECsEytlF0OU4ptlks4sgLSRyt74PjLp8+aAX9t
	PTWHS7KuxQC+yq1C3HYGvgfnvoHhUthWjQYIQ=
Received: by 10.229.78.158 with SMTP id l30mr3067922qck.96.1326643540227; Sun,
	15 Jan 2012 08:05:40 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.186.149 with HTTP; Sun, 15 Jan 2012 08:05:19 -0800 (PST)
In-Reply-To: <CAPOJ94OspH5H4G-=wQNqb=DdHratNwV3LHYnYo2BW43sbavk+g@mail.gmail.com>
References: <CAPOJ94OspH5H4G-=wQNqb=DdHratNwV3LHYnYo2BW43sbavk+g@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 15 Jan 2012 09:05:19 -0700
X-Google-Sender-Auth: QYEPVMhu4ZW3a_Wq8tw80tsReGs
Message-ID: <CABcZANmFa5CwuT0CY5pa8BE0wt70aGfZA3M4PJHPW_Rd3WA8bQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core license description practices
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
X-List-Received-Date: Sun, 15 Jan 2012 16:13:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2012 at 8:15 AM, Peter Bigot <bigotp@acm.org> wrote:
> http://www.openembedded.org/wiki/OpenEmbedded-Core states that the
> LICENSE field should be "as correct as possible (e.g. 'GPLv2', not
> just 'GPL')". =C2=A0If the upstream package self-describes as "GPL", is i=
t
> necessary that this be refined to a more specific version?

Generally they may say they're GPL, but are actually GPLv2+ or
similar. Read the actual license text included in the source tree, and
the headers of the files.
--=20
Christopher Larson


