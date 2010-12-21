Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PV39Z-0003I9-4R
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 15:25:25 +0100
Received: by wyb40 with SMTP id 40so4056458wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 06:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YZBv/9FJ9fhL8kDVI3RgkzE9SgyJ5CTtkIYsINXJbkU=;
	b=KFbpXf4M8w24D0WKyoDG+p8valXlNDoQlZqcEPlHMZay459QLA0MB/fINEYq6QIel2
	xpcYRTiolgsyiVX5CvdjQb1ek9Za12N89W6kLeSGzd6GRNvhAVEEgnyKkIBQ0w5g6vsz
	0SPWULHV9FFeQ1BVHhXfERoUbPv8UDO4i7iVE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qFq73zT7KLIwdNBYgLp5yLY0n/sRvsO4tTAy2Pspi6T0Vd4z3iTbnJhI0zEHbq1J14
	7MGPFwXv0rirWHwFCtKsIoKwxL9q8Jx+MLYwRRW2OFVvRBrqfW3RRATnwXjb5PXJTSAI
	Eh8EEiTkufjogcwXzVWE0RfcB8DMyo7+hpvkc=
MIME-Version: 1.0
Received: by 10.227.135.13 with SMTP id l13mr3418304wbt.84.1292941518713; Tue,
	21 Dec 2010 06:25:18 -0800 (PST)
Received: by 10.227.20.15 with HTTP; Tue, 21 Dec 2010 06:25:18 -0800 (PST)
In-Reply-To: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 21 Dec 2010 15:25:18 +0100
Message-ID: <AANLkTikf-tu3zh=2U_trR8zmnuKVgJCdDNPrH3WgwNwF@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Tue, 21 Dec 2010 14:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2010 at 2:48 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * X11R7.6-RC1 was already released
> =A0http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
> =A0so it's IMHO time to start migration there

FYI: X11R7.6 was released yesterday
http://www.x.org/wiki/Other/Press/X11R76Released


