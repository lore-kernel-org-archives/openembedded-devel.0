Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RDmFi-0005hP-Iu
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 02:00:54 +0200
Received: by ywf7 with SMTP id 7so141692ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 16:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=gJTFdOOIApUzeSJ5CNlJFqzHw61oIvJhbLA6ALBa82I=;
	b=oL+OwkXQxNWoteEl3Rga5APs7jbOm5nQoJ/UYPlgZKzr5dByEQ0ZX31FZY6q65yUNH
	f/Xx75pRHAuk78qNQoccQALFmsg1zSDY6xIPFEPOumcNT9pY9Dn/UB11iaU7x3ReoGsR
	ejG0I8IsJLdQbev+tSB0TUi/ZN+mtQ/S5ZjoY=
Received: by 10.68.8.195 with SMTP id t3mr49351195pba.107.1318377310071; Tue,
	11 Oct 2011 16:55:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Tue, 11 Oct 2011 16:54:40 -0700 (PDT)
In-Reply-To: <201110120100.15523.schnitzeltony@gmx.de>
References: <201110120100.15523.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Oct 2011 16:54:40 -0700
Message-ID: <CAMKF1sqgWAfNbL+W1Ge3gOHXdHoZQ9e_rO+jEKRSpapH+C1ZRw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] home for pdf-viewers / meta-office?
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
X-List-Received-Date: Wed, 12 Oct 2011 00:00:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 4:00 PM, Andreas M=C3=BCller <schnitzeltony@gmx.de>=
 wrote:
> I would like to have a pdf-viewer in my image.
> Since I can not find evince & epdfview ( did I oversee something? ) I am =
looking for a suited place for them: How about a new meta-office layer with=
in meta-oe?

I think it would be better if there could be separated based on gtk or
qt as well.
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


