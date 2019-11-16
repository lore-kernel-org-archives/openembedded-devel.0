Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id EC87C7FA0E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Nov 2019 03:19:50 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id g3so12709561ljl.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 19:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=X5UbttyEYhiUdogbNrrDLOVIpqgGvJg1FfFLn9ir/sA=;
	b=C3UZbvr9USSBL/Lgz/IvegDn66ORaK4Ix06h5bO2ZijEkVyiFhEs+YVtklbjzPHWar
	kbhTNiTRfTrSAwv4ftjR2FG98fHbJcafSp6XHyMCzaVUnlXraNKjqpHVKNeUlLhrYGmB
	RNo+h0ZVqAYJd8lUfheeKbs5e2vpkHPO2OV+bQwrWktnBEDb5BUiSrL67B/LYC1BpHyX
	hwRMlgDGTzmJ70AcOuXpZc8QiADxg2nMvHFmwZzE3H/nX4N+vK6Qc6um44SZb7pwg6bZ
	ueOBvDtRwu2kEEBJqCrjAvWJxbkjClr7AdQaZlWlojrcfYBLV7ccJzUOwXeJqAH7MwTa
	ib2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=X5UbttyEYhiUdogbNrrDLOVIpqgGvJg1FfFLn9ir/sA=;
	b=jM4qH2+qFe2FlCiJp+iK+PZLWnoCXF24stvngLTTHR5/Nc1TXg5yy8plVufxne/jUD
	0/AEwupzncghK2wUvkgbwAbFT6mS56yGTmhDsqsHHhtwZB5YrG5pmjaMtUoUEhc44q5l
	hlR0FaYoWlCFCkt+pVMZha9ivPu1JK9zYFsVEeXIGuc2i7BJaKmZvXwzfxtlMWJysifp
	jNQGAX1frG2/tzooSpAjRUYca7C+2N9FXOh+69aKtQfDa8f25NH/zlvdRdjqmBG0ng/G
	ppC271ia+09t+iLAYe6TCdAOoDgDjagJEvt6rg7IX6M2aUt8TCAtADK4H2lm9zXwMlUe
	xCaA==
X-Gm-Message-State: APjAAAWTPitvIJJUismH4xvqT7bT//OobZwD4etv0jQxoR/qr+5FRr+5
	61DTUJE+2C/wfZ3SPPiOW4poS8GI+63o26rdsrg=
X-Google-Smtp-Source: APXvYqzrho7Bd0IFFoIbu9geUW4znYch8/+aUazMfsT79k7hUMcz+YibIhkZo5Ox1yPGHM+2gAXfeq7lmnmyG6E66CE=
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr7670934ljn.4.1573874391299;
	Fri, 15 Nov 2019 19:19:51 -0800 (PST)
MIME-Version: 1.0
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Nov 2019 22:19:22 -0500
Message-ID: <CAKmqyKOFhocfnVfrW2htR65fKtHq65NqZDKhKaiYRKhJFhyzDg@mail.gmail.com>
To: undisclosed-recipients:;
X-Mailman-Approved-At: Sat, 16 Nov 2019 11:52:12 +0000
Subject: Open ISA (RISC-V, OpenPOWER, etc) Miniconf at LCA 2020
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Nov 2019 03:19:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

We=E2=80=99re pleased to announce the first Open ISA miniconf at linux.conf=
.au

Open Instruction Set Architectures like RISC-V, OpenPOWER and others are
the next step in the evolution of Open Hardware.  The mini-conference
will commence with a brief overview of Open ISAs in general.

It will then introduce the two most common open ISAs, RISC-V and
OpenPOWER. This will include an overview of the ISAs, how they are
supported and why people should use them. Finally we will delve straight
into a set of curated presentations from across the Open ISA ecosystem.

The miniconf organisers, Alistair Francis and Hugh Blemings along with
the LCA 2020 team invite proposals for sessions in the Open ISA miniconf
of either 15 or 30 minutes duration.  Suggested topics include Linux
kernel support for open ISAs, RISC-V, Open POWER and any other Open ISA
related topics.  As befits LCA, sessions should have a strong technical
emphasis rather than marketing/sales focus.

Places are limited in the miniconf schedule and early submission of your
proposal will assist our planning.  The Call for Sessions formally
closes on December 8th.

For attendees - the miniconf promises a great deal of technical depth
and breadth across this relatively new aspect of the open technical
commons, we look forward to seeing you!

As an extra plus it's on the beautiful Gold Coast in the middle of Summer :=
)

Registration and details are available at:
https://linux.conf.au/programme/miniconfs/open-isa/

And don't forget there's a bunch of other awesome miniconfs scheduled
for LCA 2020 - the complete list is available here -
https://linux.conf.au/programme/miniconfs/

We look forward to seeing you!

Regards,
Hugh Blemings & Alistair Francis

