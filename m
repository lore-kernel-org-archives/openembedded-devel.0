Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVL89-0000Qf-O6
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 10:37:09 +0100
Received: by iyj18 with SMTP id 18so4086065iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 01:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iWE021YXsGRedXh9QYuum3RCW61BYCZZPZPtut62JkI=;
	b=f/mtoiEB8RXwX8Rbgm5LDMT2Ni6gachNbeq1XawCajbbKxESt7dsrLa1VUvlucjZ6C
	g3NgEgMkFHMuGmK/4LDMs6fxewVfPv842aj4FeEXg+Wuh7E3yWnTidUMZBWvLw1uLeIv
	U4stdr+53gj74Q83ZmVE3whMV7VP+/IyfGixM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vRW8n0YGParCW4Klx2maTHLZhgBlIxYrM3rcc6IWJQ9pwphzkhhl8a6VIW3CGl+QG0
	LphnCBT53lFb6NlDgYlHQtZqjSvqSopVT3Z4YfYK0FMEEy/MCOM6/fNSQKawMTW8mppH
	KfK6X6Ee50iH3I54EyAKbdwRp8ix759YScNUE=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr540351ibb.57.1293010621412; Wed,
	22 Dec 2010 01:37:01 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 22 Dec 2010 01:37:01 -0800 (PST)
In-Reply-To: <AANLkTik4ZXMff-vHGJTK4sJcEuUHuvGNcsGjGPgwLZng@mail.gmail.com>
References: <20101221150222.GB4665@gmail.com>
	<1292969027-18762-1-git-send-email-eric@eukrea.com>
	<1292969027-18762-2-git-send-email-eric@eukrea.com>
	<AANLkTik4ZXMff-vHGJTK4sJcEuUHuvGNcsGjGPgwLZng@mail.gmail.com>
Date: Wed, 22 Dec 2010 10:37:01 +0100
Message-ID: <AANLkTikDnXGbBWf2c=KHrAvUbZq3J1ndHWexPYvQZ06Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] asterisk: fix SRC_URI
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
X-List-Received-Date: Wed, 22 Dec 2010 09:37:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/21 Khem Raj <raj.khem@gmail.com>:
> On Tue, Dec 21, 2010 at 2:03 PM, Eric B=E9nard <eric@eukrea.com> wrote:
>> * keep the higher version which fetch and patch
>> * fix SRC_URI for all the asterisk recipes
>>
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


