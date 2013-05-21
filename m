Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 534E161489
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 19:50:24 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so1070490pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=y15+03M1REWCdmErf0Muv+0n8zM6cZu07wYytVrY82s=;
	b=Du0Mkwp3G9WCc5hA+j9sP4RCYrLfjIofitcKt3Q6XZP2dMcidb2f4yYXkeckonZCJZ
	JPUy91qJAkONpKR0V1rtIzqU8dFss/4K7F67z/lSKr0/vfQ+ET73GlgBtzwDGKvPcxfs
	YkKToisw0vFXdmmHy4PImfg+3SMPh6ZgI2n6BDvhHZ87dzrihnnGWuaLt3Rn/3Ypiyb/
	POEsiWEv69K7iHT79xp0d834J/4AVoQCMSCU0xHuby3+mU/BioQHS1Ro5vVWL85p+2cX
	lK5wgBcRlAWnaX2ruEYGIxFhS4plrbj6nLqxJRPZ9/WYtTxE9hWAtHMuC5qn8pP6UIc5
	6TEg==
X-Received: by 10.68.103.131 with SMTP id fw3mr4227030pbb.112.1369165825440;
	Tue, 21 May 2013 12:50:25 -0700 (PDT)
Received: from sa-nc-common3-43.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id vz8sm4530840pac.20.2013.05.21.12.50.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 May 2013 12:50:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRTwzk+d+C2y_-PSKD4kWpkG_DEgDfCTGusSeCm6Wjz3qw@mail.gmail.com>
Date: Tue, 21 May 2013 12:50:21 -0700
Message-Id: <DE39D058-6634-41E3-B587-09E8853C3C83@gmail.com>
References: <04B2970B-A4CB-48F6-88FD-56862388393F@gmail.com>
	<CALbNGRSBxa7=dYyX1DetnWOkeEVQ40VisrtLoPNzb4cxg=NMqg@mail.gmail.com>
	<20130521193204.GD32431@jama>
	<CALbNGRTwzk+d+C2y_-PSKD4kWpkG_DEgDfCTGusSeCm6Wjz3qw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: world build on angstrom-next
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2013 19:50:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On May 21, 2013, at 12:47 PM, Andreas M=FCller =
<schnitzeltony@googlemail.com> wrote:

> I was also wondering of the passed chromium in the last logs you sent.
> Was this build performed with gcc 4.8 - or was there an update fixing
> builds with gcc 4.8 which I have missed?
>=20

yes gcc 4.8 and no local patches to chromium=

