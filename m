Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SbhUe-0007s9-Gz
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 02:19:28 +0200
Received: by wgbdr1 with SMTP id dr1so4189435wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 17:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=VLzqKbH9lKm6Mj8pAvlpi9Isndihx7BSbd5Oow89GmY=;
	b=WH8HOI2M2C75uIA9vbfNgCMe6TA3TFhNc86qeq3k3pzGQpzrnGQq+mZdlCcPkfgiU4
	8NbzjWsLWamiIGi/WXFOPD4Ojw1ekN0MxJCWhcfttXSzARS4li4P66wpCDiU8bkwoTR0
	38QxGKDkaT3rL6QU5csqAHgxEdGxkgfldBp0NGSE3TfFX/2YjevQ+pO0MuX3RErz0BoB
	hbAuX3mZVXguTtv6/r1KAZGc7NCkf6Vo9pO6dd9wQaOGI4zKaIG7V0iQ5JWyI3k9SRiR
	GvlngMr0ozhhxhONwI7YxPyl4K7WQV5eM2ZkAzElPP7YUUDtGkvOhtmC1P/6W5P2GXvN
	eLAw==
Received: by 10.216.202.170 with SMTP id d42mr11549018weo.83.1338854943332;
	Mon, 04 Jun 2012 17:09:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.63.175 with HTTP; Mon, 4 Jun 2012 17:08:33 -0700 (PDT)
In-Reply-To: <20120604233700.GE19651@bill-the-cat>
References: <1338514403-9477-1-git-send-email-raj.khem@gmail.com>
	<20120604233700.GE19651@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jun 2012 17:08:33 -0700
Message-ID: <CAMKF1srw04QQG+rdJJmPBBR9WyYKuyPrx6C7HnAvru5+6mwmEA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V2] classes/mirrors.bbclass: update debian snapshot mirror url
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
X-List-Received-Date: Tue, 05 Jun 2012 00:19:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 4, 2012 at 4:37 PM, Tom Rini <tom.rini@gmail.com> wrote:
> Isn't that backwards for say kernel.org mismatches? =C2=A0Or am I forgett=
ing
> that we already fixed that and switched to new checksums?

hmmm I dont know if we did. I am also not aware of conflicts
its only a fallback so mostly missing old packages only land here


